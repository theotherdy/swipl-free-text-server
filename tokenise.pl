/*---------------------------------------------------------------------
tokenise2.pl

Contains predicates that read in an ascii file, segment into likely
tokens, and (rather rough and ready) splits the resulting list into
sentences. Then the sentences are tagged and the tokens and tags are
asserted as edges.


Version 1: April 2002.
Version 2: July 2003

Changed to regard html tags as a new kind of token, Nov 2002.

July 2003 - improved treatment of abbreviations, ',', and '.' when
occurring internal to numbers etc

Changed format of edge/7 so that arg5 is always either a cat or a word.
Format is now:
edge(StartVertex,EndVertex,EdgeId,Type,CatOrWord,Sought,Contents).

possible values of Type are:

spc, or nl       - space or newline char      Contents= spc, nl
tok              - a word or other token      Contents= token
pnct             - punctuation char           Contents= pnct
tag              - POS tag                    Contents=[IdOfWordEdge]
phrase           - np, vg, etc found by fsm   Contents= ListOfEDgeIds
phrase(RuleId)   - phrase found by pattern    Contents= ListOfEDgeIds
html             - html tag                   Contents = tag


July 2003 Changed so that html tags, spc and nl are not recorded as edges, but as
invisible(+Vertex,+Type,+Thing). This means that spaces and newlines
can be completely ignored when writing patterns.
----------------------------------------------------------------------*/


:- ensure_loaded(library(charsio)).
:- dynamic edge/7,  edgeid/1, invisible/3.

% new_edge_id(-Id).
%-----------------
new_edge_id(Id) :-
	retract(edgeid(Old)),
	Id is Old+1,
	assert(edgeid(Id)),
	!.


% main predicates in this file:
%----------------------------

tok_and_tag_file(File):-
	tokenise_clean_up,
	file_to_list(File,List),
	tok_and_tag_sentences(0-E,0-_V,List),
	assert(edgeid(E)).

tok_and_tag_string(String):-
	tokenise_clean_up,
	my_string_to_list(String,List),
	tok_and_tag_sentences(0-E,0-_V,List),
	assert(edgeid(E)).


% tok_and_tag_sentences(+EdgeIdIn-(-)EdgeIdOut,+VertexIn-(-)VertexOut,+ListOfTokens).
%------------------------------------------------------------------------------

% at end: thread out edge and vertex ids:

tok_and_tag_sentences(E-E,V-V,[]).

tok_and_tag_sentences(E-E,V-V,[eof]).  % don't know how that gets there

% EIn and VIn are the last ids used:

tok_and_tag_sentences(EIn-EOut,VIn-VOut,List) :-
	get_a_sentence(List,Sentence,Rest),

	 % get a Sentence
	\+Sentence=[],

	make_tokenisation_edges(EIn-ENxt,VIn-VNxt,Sentence,Tokens,WordEdges),

	 % assert all the edges, putting the words that need to be tagged in Tokens
	 % This will match up with the WordEdges, a record of the edges that this predicate
	 % asserts
	%\+Tokens=[],     % make sure not just space and nl

	tag(Tokens,Tagged,_),

	 % call the tagger

	ENxt1 is ENxt+1,
	make_tag_edges(ENxt1-ENxt2,Tagged,WordEdges,TagEdges),

	 % assert the tags as edges that contain the corresponding token edges

	ENxt3 is ENxt2+1,

	 % update edgeid

	assert(edge(VIn,VNxt,ENxt3,tagged_sentence,tagged_sentence,[],TagEdges)),

	 % assert an edge stating that these edges constitute a sentence, in some sense

	ENxt4 is ENxt3+1,
	!,
        tok_and_tag_sentences(ENxt4-EOut,VNxt-VOut,Rest).




/*---------------------------------------------------------------------
make_tag_edges(E-E,[],[],[]) :-
	assert(edgeid(E)).      % record last used edgeid
----------------------------------------------------------------------*/

make_tag_edges(E-E,[],[],[]).

make_tag_edges(EIn-EOut,[_Word/Tag|Rest],[Id-From-To|RestIds],[EIn|RestE]) :-
	assert(edge(From,To,EIn,tag,Tag,[],[Id])),
	ENxt is EIn+1,
	!,
	make_tag_edges(ENxt-EOut,Rest,RestIds,RestE).



/*---------------------------------------------------------------------
file_to_list(+AsciiFileName,-ListOfTokens).

Reads in file as a list of codes, calls a deterministic transducer (in
output, not in operation) to insert new items to make the list of
codes Prolog readable as a list of tokens, and then uses
read_from_chars/2 from library(charsio) to read the tokens.

----------------------------------------------------------------------*/


file_to_list(File,List) :-
	read_whole_file(File,CharList),
	transduce(1,CharList,Listified-[]),
	append([91|Listified],[39,101,111,102,39,93,46],BracketedList),
		                                       % add [ and eof].
	read_from_chars(BracketedList,List),
	!.
	
%string_to_list(String,List):-
%	append(String,[10],NewString),        % so that string ends with newline as does
%	                                      % output of read_whole_file
%	transduce(1,NewString,Listified-[]),
%	append([91|Listified],[39,101,111,102,39,93,46],BracketedList),
%		                                       % add [ and eof].
%	read_from_chars(BracketedList,List),
%	!.


my_string_to_list(String,List):-
	%append(String,[10],NewString),       % so that string ends with newline as does
	                                      % output of read_whole_file
	string_codes(String, NewString1),	  
	append(NewString1,[10],NewString), % xxxx Append code for new line char to end of NewString1
	transduce(1,NewString,Listified-[]), % xxxx Insert new items to make the list of codes Prolog readable as a list of tokens.
	append([91|Listified],[39,101,111,102,39,93,46],BracketedList), % xxxx Pre-pend an open square bracket (code 91) and append the following seven chars: 'eof'].
	read_from_chars(BracketedList,List),
	!.


% 3/03 cuts added to these predicates because inside a backtracking predicate they can give weird results.


read_whole_file(File,Charlist) :-
	(File='-stdin' -> Stream=user_input;	open(File,read,Stream)),
	get_chars_to_end_of_file(Stream,Charlist-[]),
	close(Stream).

/*---------------------------------------------------------------------
The predicates get_chars_to_end_of_{line/file} use difference
lists to avoid having to append a very long list.
----------------------------------------------------------------------*/

% get_chars_to_end_of_line(Stream,Chars-Tail)
%--------------------------------------------

get_chars_to_end_of_line(Stream,[]-[]) :-
 peek_char(Stream,-1).

% -1 means end of file. Close off difference list.

get_chars_to_end_of_line(Stream,[10|Tail]-Tail) :-
 peek_char(Stream,10),
 get0(Stream,10).

% peek to see if we have end of line (eol), if so read it and stop here

get_chars_to_end_of_line(Stream,[Next|Rest]-Tail) :-
 get0(Stream,Next),
 !,
 get_chars_to_end_of_line(Stream,Rest-Tail).

% otherwise, just take a char at a time


% get_chars_to_end_of_file(Stream,Chars-Tail)
%-------------------------------------------

get_chars_to_end_of_file(Stream,[]-[]) :-
	get_chars_to_end_of_line(Stream,[]-[]).

get_chars_to_end_of_file(Stream,Chars-Tail) :-
	get_chars_to_end_of_line(Stream,Chars-T),
	!,
	get_chars_to_end_of_file(Stream,T-Tail).



punctuation_char(X) :-
	member(X,[126,125,124,123,94,93,92,91,
	          63,62,60,59,58,47,46,44,43,
	          41,40,38,37,36,35,34,33]).

punct_not_period_or_comma(X) :-
	member(X,[126,125,124,123,94,93,92,91,
	          63,62,60,59,58,47,43,
	          41,40,38,37,36,35,34,33]).


punct_not_period(X) :-
	member(X,[126,125,124,123,94,93,92,91,
	          63,62,60,59,58,47,43,44,
	          41,40,38,37,36,35,34,33]).

/*---------------------------------------------------------------------
Transducer: also uses difference lists for efficiency.

t(+State,+CharsIn,+CharsOut,+NextState).

DGF: "a deterministic transducer (in output, not in operation) 
to insert new items to make the list of codes Prolog readable as a list of tokens"
----------------------------------------------------------------------*/

t(1,[60],[39,60|T]-T,3).	             % found <, start recognising html tag
										 % DGF: Code 39 is a single straight quote mark		

t(1,[38],[39,38|T]-T,4).                     % found &, start recognising html &nbsp;

t(1,[32],[39,32,39,44|T]-T,1).               % space    => ' ',

t(1,[10],[39,10,39,44|T]-T,1).               % newline  => '\n',

t(1,[13],[39,10,39,44|T]-T,1).               % cr  => '\n',

t(1,[9], [39,9,39,44|T]-T,1).               % tab  => '\t',

t(1,[39],[39,92,39,39,44|T]-T,1).            % single ' => '\'',

t(1,[X],[39,X,39,44|T]-T,1):-                % X        => 'X', where X is punct.
%	punct_not_period_or_comma(X).
%	punct_not_period(X).
	punctuation_char(X).

t(1,[X],[39,X|T]-T,2) :-                     % put ' at beginning of new token
        \+(X=32).


t(2, [60],[39,44,39,60|T]-T,3).              % < - close previous, start recognising html tag

t(2,[10],[39,44,39,10,39,44|T]-T,1).         % newline  => ','\n',   - closes off previous token

t(2,[13],[39,44,39,10,39,44|T]-T,1).         % cr  => ','\n',   - closes off previous token

t(2,[9],[39,44,39,9,39,44|T]-T,1).         % tab  => ','\t',   - closes off previous token

t(2,[32],[39,44,39,32,39,44|T]-T,1).	     % space    = ',' ',   - close off previous token,
                                             %                       quote space

t(2,[39],[39,44,39,92,39,39,44|T]-T,1).      % single ' => ','\'',

%t(2,[46],[39,44,39,46,39,44|T]-T,5).         % . => ','.', if followed by tab

t(2,[46],[46,39,44|T]-T,5).                 % . => .', if followed by tab


t(2,[X],[39,44,39,X,39,44|T]-T,1) :-         % X        => ','X', where X is punct
%	punct_not_period_or_comma(X).
%	punct_not_period(X).
	punctuation_char(X).

t(2,[X],[X|T]-T,2) :-                        % default
	\+(member(X,[32,39,10])).


t(3,[39],[92,39|T]-T,3).                      % single ' => \'

t(3,[62], [62,39,44|T]-T, 1).                 % found >, return from html tag

t(3,[X],[X|T]-T,3) :-                         % echo
	\+X=62.


t(4,[59],[59,39,44|T]-T,1).                      % found ;, return from html tag

t(4,[32],[39,44,39,32,39,44|T]-T,1).	     % space    = ',' ',   - close off previous token,
                                             %                       quote space, wasn't an html tag

t(4,[X],[X|T]-T,4) :-                        % echo
	\+X=59.



t(5,[9],[39,9,39,44|T]-T,1).                % tab

% 1 is initial state and:
%------------------------
tfinal(1).
tfinal(2).

% run the transducer:

transduce(S,[],[]-[]):- tfinal(S).

transduce(State,[H|T],Out-NewTail) :-
	t(State,[H],Out-Tail,Next),
	transduce(Next,T,Tail-NewTail).





% get_a_sentence(+ListOfTokens,-Sentence,-RemainderOfTokens)
% DGF 2016/09: Start at the beginning of the list and look for sentence boundary markers
%-----------------------------------------------------------

% eof ends the process and produce an empty sentence:

get_a_sentence([eof],[],[]):- !.

% allow for other types of input:

get_a_sentence([],[],[]):- !.

% punct followed by commas ends a sentence:

get_a_sentence([H,'"'|T],[H,'"'],T) :-
	member(H,['?','!','.']).

% ? and ! are usually good cues:

get_a_sentence([H|T],[H],T) :-
	member(H,['?','!']).

% two newlines:

get_a_sentence(['\n','\n'|T],['\n','\n'],T).

% full stop a cue if not in an abbreviation:
/*---------------------------------------------------------------------
get_a_sentence([Word,'.',' ',Next|T],[Word,'.',' '],[Next|T]) :-
	\+abbrev(Word),
	begins_with_uppercase(Next).
----------------------------------------------------------------------*/

get_a_sentence([Word,' ',Next|T],[Word,' '],[Next|T]) :-
	ends_with_dot_or_comma(Word,'.',_),
	\+abbreviation(Word),
	begins_with_uppercase(Next).


% full stop, space, 2 newlines:

get_a_sentence(['.',' ','\n','\n'|T],['.',' ','\n','\n'],T).

% full stop, space, newline:

get_a_sentence(['.',' ','\n'|T],['.',' ','\n'],T).

% full stop, tab:

get_a_sentence(['.','\t'|T],['.',' ','\n'],T).

% otherwise keep going:

get_a_sentence([H|T],[H|S],R) :-
	get_a_sentence(T,S,R).


/*---------------------------------------------------------------------
 %%% alternative definition which treats whole file as a single sentence.

get_a_sentence(List,RTail,[]):-
	reverse(List,[eof|Tail]),
	reverse(Tail,RTail).
----------------------------------------------------------------------*/

% make_tokenisation_edges(+EdgeIds,+Vertexes,+ListOfTokens,-ListToBeTagged,-ListOfEdgeIdsAndVertexes)
%----------------------------------------------------------------------------------------------

% at the end. Pass up the current edge id as the final one, and for the vertexes:

make_tokenisation_edges(EdgeId-EdgeId,LastVertex-LastVertex,[],[],[]).

% find the kind of thing that Next is, and assert the appropriate type
% of edge. Thread the edge and vertex counters. ***If space or newline,
% just assert the edge but don't keep the token or its edge id in the list to be tagged:*** changed???



make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,[Aux,'\'',T|Rest],[NegAux|Tokens],
			[EdgeId-Vertex-NextVertex1|TokEdges]) :-
	member(T,[t,'T']),
	atom_codes(Aux,AuxCodes),
	atom_codes(T,[TCode]),
	append(AuxCodes,[39,TCode],NegAuxCodes),
	atom_codes(NegAux,NegAuxCodes),
	NextVertex1 is Vertex+1,
	assert(edge(Vertex,NextVertex1,EdgeId,tok,NegAux,[],NegAux)),
	NewEdgeId1 is EdgeId+1,
	!,
	make_tokenisation_edges(NewEdgeId1-FinalEdgeId,NextVertex1-FinalVertex,Rest,Tokens,TokEdges).

% special case to make can't won't etc into one word. Raw tokenisation gives can+'+t, Treebank expects
% ca+n't; some taggers want can't: ours does.

make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,[Aux,'\'',Next|Rest],[NegAux,Ending|Tokens],
			[EdgeId-Vertex-NextVertex1,NewEdgeId1-NextVertex1-NextVertex2|TokEdges]) :-
	ends_with_dot_or_comma(Next,Ending,T),
	member(T,[t,'T']),
	atom_codes(Aux,AuxCodes),
	atom_codes(T,[TCode]),
	append(AuxCodes,[39,TCode],NegAuxCodes),
	atom_codes(NegAux,NegAuxCodes),
	NextVertex1 is Vertex+1,
	assert(edge(Vertex,NextVertex1,EdgeId,tok,negaux,[],NegAux)),
	NewEdgeId1 is EdgeId+1,
	NextVertex2 is NextVertex1+1,
	assert(edge(NextVertex1,NextVertex2,NewEdgeId1,pnct,Ending,[],Ending)),
	NewEdgeId2 is NewEdgeId1+1,
	NextVertex3 is NextVertex2+1,
	!,
	make_tokenisation_edges(NewEdgeId2-FinalEdgeId,NextVertex3-FinalVertex,Rest,Tokens,TokEdges).

% special case to make can't won't etc into one word. Raw tokenisation gives can+'+t, Treebank expects
% ca+n't; some taggers want can't: ours does. Version where followed by . or ,

make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,['\'',C|Rest],[Poss|Tokens],
			[NewEdgeId2-Vertex-NextVertex2|TokEdges]) :-
	member(C,[s,'S',d,'D',m,'M','ve','VE',ll,'LL',re,'RE']),
	NextVertex1 is Vertex+1,
	assert(edge(Vertex,NextVertex1,EdgeId,tok,pnct,[],'\'')),
	NewEdgeId1 is EdgeId+1,
	NextVertex2 is NextVertex1+1,
	assert(edge(NextVertex1,NextVertex2,NewEdgeId1,tok,C,[],C)),
	NewEdgeId2 is NewEdgeId1+1,
	atom_codes(C,CCode),
	atom_codes(Poss,[39|CCode]),
	assert(edge(Vertex,NextVertex2,NewEdgeId2,tok,Poss,[],Poss)),
	NewEdgeId3 is NewEdgeId2+1,
	!,
	make_tokenisation_edges(NewEdgeId3-FinalEdgeId,NextVertex2-FinalVertex,Rest,Tokens,TokEdges).


% special case to produce extra edge encoding tokenisation
% of 's possessives/vbz, 'd, 'm expected by Penn Treebank.
% Without this would get: e.g. dog+'+s rather than dog+'s

make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,['\'',Next|Rest],[Poss,Ending|Tokens],
			[NewEdgeId2-Vertex-NextVertex2,NewEdgeId3-NextVertex2-NextVertex3|TokEdges]) :-
	ends_with_dot_or_comma(Next,Ending,C),
	member(C,[s,'S',d,'D',m,'M','ve','VE',ll,'LL',re,'RE']),
	NextVertex1 is Vertex+1,
	assert(edge(Vertex,NextVertex1,EdgeId,pnct,'\'',[],'\'')),
	NewEdgeId1 is EdgeId+1,
	NextVertex2 is NextVertex1+1,
	assert(edge(NextVertex1,NextVertex2,NewEdgeId1,tok,C,[],C)),
	NewEdgeId2 is NewEdgeId1+1,
	atom_codes(C,CCode),
	atom_codes(Poss,[39|CCode]),
	assert(edge(Vertex,NextVertex2,NewEdgeId2,tok,Poss,[],Poss)),
	NewEdgeId3 is NewEdgeId2+1,
	NextVertex3 is NextVertex2+1,
	assert(edge(NextVertex2,NextVertex3,NewEdgeId3,pnct,Ending,[],Ending)),
	NewEdgeId4 is NewEdgeId3+1,
	!,
	make_tokenisation_edges(NewEdgeId4-FinalEdgeId,NextVertex3-FinalVertex,Rest,Tokens,TokEdges).


% special case to produce extra edge encoding tokenisation of 's possessives/vbz, 'd, 'm expected by Penn Treebank.
% Without this would get: e.g. dog+'+s rather than dog+'s. Case where poss etc ends in . or ,



make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,[Item|Rest],[ItemWithoutEnding,Ending|Tokens],
			[EdgeId-Vertex-NextVertex1,NewEdgeId1-NextVertex1-NextVertex2|TokEdges]) :-
	ends_with_dot_or_comma(Item,Ending,ItemWithoutEnding),
        (Ending='.' -> \+abbreviation(Item);Ending=','),
	NextVertex1 is Vertex+1,
	assert(edge(Vertex,NextVertex1,EdgeId,tok,ItemWithoutEnding,[],ItemWithoutEnding)),
	NewEdgeId1 is EdgeId+1,
	NextVertex2 is NextVertex1+1,
	assert(edge(NextVertex1,NextVertex2,NewEdgeId1,pnct,Ending,[],Ending)),
	NewEdgeId2 is NewEdgeId1+1,
	!,
	make_tokenisation_edges(NewEdgeId2-FinalEdgeId,NextVertex2-FinalVertex,Rest,Tokens,TokEdges).

% xxxx special case for a space, new line, html and tab char
make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,[Next|Rest],TokenList,TokEdgesAssertedList):-
	get_type(Next,Type), % xxxx Is the item Next a space, a new line, an html, a tab, a punctuation, or a word ('tok') char?
	member(Type,[spc,nl,html,tab]),
        assert(invisible(Vertex,Type,Next)),
	!,
	make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,Rest,TokenList,TokEdgesAssertedList).

				% if tab spc or nl or html tag, don't add to list of tokens for tagging

% xxxx the general case (for a word (tok))
make_tokenisation_edges(EdgeId-FinalEdgeId,Vertex-FinalVertex,[Next|Rest],[Next|Tokens],
                        [EdgeId-Vertex-NextVertex|TokEdgesAsserted]):-
	get_type(Next,Type), % xxxx Is the item Next a space, a new line, an html, a tab, a punctuation, or a word ('tok') char?
	      % else must be (member(Cat,[tok,pnct]), so do add to list
	NextVertex is Vertex+1,
	assert(edge(Vertex,NextVertex,EdgeId,Type,Next,[],Next)),
	NewEdgeId is EdgeId+1,
	!,
	make_tokenisation_edges(NewEdgeId-FinalEdgeId,NextVertex-FinalVertex,Rest,Tokens,TokEdgesAsserted).



% get_type(+Item,-AtomDescribingIt).
%---------------------------------------
% xxxx Is Item a space, a new line, an html, a tab, a punctuation, or a word ('tok') char?

get_type(' ',spc).

get_type('\n',nl).

get_type('\t',tab).

get_type(Item,pnct) :-
	atom_length(Item,1),
	char_code(Item,Char),
	punctuation_char(Char).

get_type(Item,html) :-
	atom_codes(Item,[60|_]).   % starts with <

get_type(Item,html) :-
	atom_codes(Item,Codes),
	Codes=[38|_],               % starts with &
	reverse(Codes,[59|_]).      % ends with ;

get_type(_Item,tok).



tokenise_clean_up :-
	retractall(edge(_,_,_,_,_,_,_)),
	retractall(edgeid(_)),
        retractall(invisible(_,_,_)).


number_as_atom(X) :-
	atom_codes(X,C),
	\+((member(Y,C),(Y<48;Y>57))).


% recognise abbreviation. An abbreviation is something
% that is either listed, or satisfies the
% condition below. Note any lower case abbreviation, or
% one longer than 4 chars needs to
% be listed.

% NB abbreviation will only be called on something that is known to end with `.'


abbreviation('etc.').
abbreviation('i.e.').
abbreviation('e.g.').
abbreviation(ie).
abbreviation(eg).
abbreviation('c.').
abbreviation('cf.').
abbreviation('al.').
abbreviation('q.v.').
abbreviation('oz.').
abbreviation('lb.').
abbreviation('in.').
abbreviation('cm.').
abbreviation('m.').
abbreviation('viz.').
abbreviation('D.N.A.').
abbreviation('d.n.a.').
abbreviation('DNA.').

% not less than 5 chars:
abbreviation('M.Litt.').
abbreviation('M.Phil.').
abbreviation('D.Phil.').

abbreviation('Inst.').
abbreviation('Amer.').
abbreviation('Acad.').
abbreviation('Comp.').
abbreviation('Corp.').



% heuristic:

abbreviation(X) :-
  atom_codes(X,List),
  (contains_internal_full_stop(List),!
  ;
  (   length(List,L),
      L<5,
      member(U,List),
      is_uppercase(U))).

                    % or is short and contains a full stop and an upper case letter

ends_with_dot_or_comma(Item,Ending,ItemWithoutEnding):-
	atom_codes(Item,List),
	length(List,L),
	L>1,
	reverse(List,[X|Rest]),
	member(X,[46,44]),
	atom_codes(Ending,[X]),
	reverse(Rest,Reversed),
	atom_codes(ItemWithoutEnding,Reversed).


contains_internal_full_stop(List) :- append([_|_],[46,_|_],List).
