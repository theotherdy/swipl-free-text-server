/*---------------------------------------------------------------------
find_phrases.pl

Applies finite state machines (eg in npvgfsm.pl) to edges in a chart as
built by tokenise.pl. Currently produces one solution only, following
a longest-match strategy.

This version was rewritten to accommodate the changes in tokenise.pl,
April 2002.

Further changes made July 2003: to accommodate FSMs with empty
transitions, since now it is more complicated to
ensure a longest match. So we find all of them and choose
the longest. It doesn't seem to be much less efficient.

Also, different treatment of spc, nl, and html means that
they can be ignored.

(C) Stephen Pulman


Changes to extend make_category to more types of NP, Aug 2004.
May still produce uninstantiated categories on types
of NP not yet covered.

Sept 2004:
1. Changes to format when NP is a proper name: instead
of list of atoms as value of head, the atoms are joined
up with underscore: thus 'John_Smith' instead of ['John','Smith'],
so that value of this ffeature is always an atom.

2. Added `stem' feature to NP and VG categories, filled by
code in stemmer.pl
----------------------------------------------------------------------*/

% find_phrases(+ListOfFSMStartStates,+StartVertex,+EndVertex)
%------------------------------------------------------------

% startstates are called after the network they represent, e.g. np, vg.
% FSMs like this are built by make_fsm.pl from a corpus, or by hand

find_phrases(Phrases,StartVertex,EndVertex) :-
	member(StartState,Phrases),
	findall(Score-(NextVertex,EdgeIds),
		(find_a_phrase(StartState,StartVertex,NextVertex,EndVertex,EdgeIds),
	%	 length(EdgeIds,L),Score is -L),
		Score is -(NextVertex-StartVertex)),
		Candidates),
	keysort(Candidates,[_-(NextV,Winner)|_]),
	new_edge_id(Id),
	make_category(StartState,Winner,Category),   % Category can be a tag from idioms
%	(Category=StartState -> Type = tag; Type = phrase),
%	assert(edge(StartVertex,NextV,Id,Type,Category,[],Winner)),
	(Category=StartState ->
	    (                   % also add a tok edge for a new complex word:
         	
		collect_words_from_edges(Winner,NewWords),
		make_single_atom(NewWords,NewWord),
		new_edge_id(TokEdgeId),
		assert(edge(StartVertex,NextV,TokEdgeId,tok,NewWord,[],NewWord)),
	        assert(edge(StartVertex,NextV,Id,tag,Category,[],[TokEdgeId]))
		     
	    )
	  ;
	 assert(edge(StartVertex,NextV,Id,phrase,Category,[],Winner))
	),
	!,
	find_phrases(Phrases,NextV,EndVertex).

% find all the phrases, choose the longest, one phrase, assert the edge, and recurse

find_phrases(Phrases,Start,End) :-
	edge(Start,Next,_Id,Type,_,_,_),
	\+Type=tagged_sentence,   
	!,
	find_phrases(Phrases,Next,End).

% no phrase here so skip an edge

find_phrases(_,S,E) :- S >= E.

% stop when you reach the end vertex.



% two different conventions for final state:
	
final_state(final/_).

final_state(F) :- final(F).

/*---------------------------------------------------------------------	
make_category(+StartState,+EdgeIds,-Category)

Instantiate features on NP or VG by looking at the words
and tags contained in them.
----------------------------------------------------------------------*/

% NP case:

make_category(np,EdgeIds,Category):-
	 collect_tagged_words(EdgeIds,TaggedWords),
	 find_components(np,TaggedWords,[Determiner,Mods,Head/HeadTag]),
	 find_stem(Head,HeadTag,Stem),
	 get_morphology(HeadTag,Number),
	 change_all_to_lower_case(Determiner,DetLC),
	 compile_cat(np:[det=DetLC,mods=Mods,head=Head,mor=Number,
			 sem=[DetLC,Head],stem=Stem],Category),
	 !.


% VG case
make_category(vg,EdgeIds,Category):-
	 collect_tagged_words(EdgeIds,TaggedWords),
	 find_components(vg,TaggedWords,
			 [Polarity,Head/HeadTag,Modal,Passive,Adverb]),
	 reverse(TaggedWords,R),
	 find_morphology(R,Morph),
	 find_stem(Head,HeadTag,Stem),
	 compile_cat(vg:[pol=Polarity,head=Head,mor=Morph,stem=Stem,
			 passive=Passive,modal=Modal,adv=Adverb],Category),
	 !.

% so we don't just fail if I've forgotten something:
	
make_category(Other,EdgeIds,Compiled) :-
	category(Other,_),    % so should be being compiled
	EdgeIds = [First|Rest],
	edge(From,Nxt,First,_,_,_,_),
	(((\+(Rest=[]),reverse(Rest,[Last|_]),edge(_,To,Last,_,_,_,_)))
	  -> display_tags(From,To,_Output)
	  ; display_tags(From,Nxt,_Output)),	
%	write('make_category failed for'-Other-EdgeIds-Output),nl,
%	write(EdgeIds),nl,
	compile_cat(Other:[],Compiled),
	% instantiate with dummy values:
	(Compiled = np(xdet,xhead,xmor,xmods,xsem,xstem)
	;
	 Compiled = vg(xpol,xhead,xmor,xpassive,xmodal,xadv,xstem)
	),
	!.

% must be a tag or something without a category declaration:

make_category(Other,_EdgeIds,Other).



% collect up the words corresponding to a sequence of Word edges:

collect_tagged_words([],[]).

collect_tagged_words([NextId|Rest],[Word/Tag|RestWT]):-
	edge(_,_,NextId,tag,Tag,[],[WordEdgeId]),
	edge(_,_,WordEdgeId,tok,Word,[],Word),
	collect_tagged_words(Rest,RestWT).


% find_components(+Category,+ListOfWord/TagPairs, -[Determiner,ModsList,Head/HeadTag])
%------------------------------------------------------------------------------------
% if the NP consists of just a Det, it's elliptical:

find_components(np,[W/'DT'],[W,[],null/null]):-
	!.			% elliptical NP

% same if no noun:
find_components(np,[W1/T1,W2/T2], [W1,[W2],null/null]):-
	member(T1,['DT','PRP$','PDT','CD']),
	member(T2,['JJ','JJR','JJS','RB','RBR','RBS','DT']),
	!.



% things like `the exact same':

find_components(np,[W1/T1,W2/T2,W3/T3], [W1,[W2,W3],null/null]):-
	member(T1,['DT','PRP$','PDT','CD']),
	member(T2,['JJ','JJR','JJS','RB','RBR','RBS','DT']),
	member(T3,['JJ','JJR','JJS','RB','RBR','RBS','DT']),
	!.



find_components(np,[W1/'NN',W2/'CD'],[null,[W2],W1/'NN']):-
	!.                       % things like `table 2'


% the second, the fastest/faster etc:

find_components(np,[W1/'NN',W2/'JJ'],[null,[W2],W1/'NN']):-
	!.                       % things like `nothing new'


% one word NPs like `it' `there' etc:

find_components(np,[W/T],[W,[],W/T]):-
	member(T,['WDT','EX','PDT','PRP$','PRP']),
	!.

% otherwise split into Det, any modifiers, and the head:

find_components(np,TaggedWords,[Determiner,Mods,Head/HeadTag]):-
        split_into_det_mods_head(TaggedWords,[Determiner,SomeMods,H/HTag]),
	(HTag='CD'
	-> (Head=null,HeadTag=null,append(SomeMods,[H],Mods))
	;
	(Head=H,HeadTag=HTag,Mods=SomeMods)).

% added final CD possibility as elliptical NP


% VG case:

find_components(vg,TaggedWords,[Polarity,Head/HeadTag,Modal,Passive,Adverb]):-
	find_negative(TaggedWords,Polarity),
        is_it_passive(TaggedWords,Passive),
	reverse(TaggedWords,[W/T|Rest]),
	(\+member(T,['RP','RB']) -> Head/HeadTag=W/T ; Rest=[Head/HeadTag|_]),
	(member(M/'MD',TaggedWords) -> Modal=M ; Modal=null),
	((member(Adv/'RB',TaggedWords);
	  member(Adv/'RP',TaggedWords)) -> Adverb=Adv; Adverb=null).

% treat RP like RB - not really right for truly phrasal verbs


% just hack through the different cases: this is not very intelligent:

split_into_det_mods_head(TaggedWords,[Determiner,Mods,Head/HeadTag]) :-
	TaggedWords=[Determiner/'DT'|Rest],
	reverse(Rest,[Head/HeadTag|Mods1]),
	reverse(Mods1,Mods2),
	collect_words(Mods2,Mods),
	!.

split_into_det_mods_head(TaggedWords,[nulldet,[],Name/'NNP']):-
	is_a_name(TaggedWords,NameList),
	make_single_atom(NameList,Name),
	!.

split_into_det_mods_head(TaggedWords,[nulldet,Mods,Head/HeadTag]):-
	reverse(TaggedWords,[Head/HeadTag|Mods1]),
	reverse(Mods1,Mods2),
	collect_words(Mods2,Mods),
	!.

split_into_det_mods_head(NP,_) :- write(np_split_failed:NP),nl.

% strip off tags, collect words:

collect_words([],[]).
collect_words([W/_T|R],[W|R1]):-
	collect_words(R,R1).

% succeeds if all the tags in a list are names:

is_a_name([],[]).

is_a_name([W/T|Rest],[W|R]):-
	member(T,['NNP','NNPS']),
	is_a_name(Rest,R).

% join up atoms with `_' to make one:
make_single_atom(NameList,Name):-
	get_code_list(NameList,CodeList),
	atom_codes(Name,CodeList),
	!.

% append codelists of all atoms in list:

get_code_list([Last],Codes):-
	atom_codes(Last,Codes).

get_code_list([H|T],List):-
	atom_codes(H,HCodes),
	get_code_list(T,Rst),
	append(HCodes,[32|Rst],List). % 95= '_'; 32 = ' '

% dumb tests:
is_it_passive(TaggedWords,yes) :-
        member(W/_,TaggedWords),
	member(W,[is,'isn\'t',was,'wasn\'t',am,are,'aren\'t',were,'weren\'t',be,been,
		  being,be,
		  'Is','Isn\'t','Was','Wasn\'t','Am','Are','Aren\'t','Were','Weren\'t',
		  'Been','Being','Be']),
	member(W2/'VBN',TaggedWords),
	\+W=W2,
	!.

is_it_passive(_,no).



find_negative(TaggedWords,neg) :-
	(member(not/_,TaggedWords)
	;
	member('isn\'t'/_,TaggedWords)
	;
	member('aren\'t'/_,TaggedWords)
	;
	member('wasn\'t'/_,TaggedWords)
	;
	member('weren\'t'/_,TaggedWords)
	;
	member('don\'t'/_,TaggedWords)
	;
	member('doesn\'t'/_,TaggedWords)
	;
	member('didn\'t'/_,TaggedWords)
	;
	member('haven\'t'/_,TaggedWords)
	;
	member('hasn\'t'/_,TaggedWords)
	;
	member('hadn\'t'/_,TaggedWords)
	;
	member('can\'t'/_,TaggedWords)
	;
  	member('cannot'/_,TaggedWords)
	;
	member('couldn\'t'/_,TaggedWords)
	;
	member('won\'t'/_,TaggedWords)
	;
	member('wouldn\'t'/_,TaggedWords)
	;
	member('shouldn\'t'/_,TaggedWords)
	;
	member('mightn\'t'/_,TaggedWords)
	;
	member('needn\'t'/_,TaggedWords)
	;
        member('Not'/_,TaggedWords)
	;
	member('Isn\'t'/_,TaggedWords)
	;
	member('Aren\'t'/_,TaggedWords)
	;
	member('Wasn\'t'/_,TaggedWords)
	;
	member('Weren\'t'/_,TaggedWords)
	;
	member('Don\'t'/_,TaggedWords)
	;
	member('Doesn\'t'/_,TaggedWords)
	;
	member('Didn\'t'/_,TaggedWords)
	;
	member('Haven\'t'/_,TaggedWords)
	;
	member('Hasn\'t'/_,TaggedWords)
	;
	member('Hadn\'t'/_,TaggedWords)
	;
	member('Can\'t'/_,TaggedWords)
	;
	 member('Cannot'/_,TaggedWords)
	;
	member('Couldn\'t'/_,TaggedWords)
	;
	member('Won\'t'/_,TaggedWords)
	;
	member('Wouldn\'t'/_,TaggedWords)
	;
	member('Shouldn\'t'/_,TaggedWords)
	;
	member('Mightn\'t'/_,TaggedWords)
	;
	member('Needn\'t'/_,TaggedWords)
	),
	!.

	
	
find_negative(_TaggedWords,pos).

% convert tags to morophology features as recognised in NP and VG patterns:

get_morphology(Tag,s3) :-
	member(Tag,['NN','NNP']).

get_morphology(Tag,pl) :-
	member(Tag,['NNS','NNPS']).

get_morphology(Tag,or(s3,pl)):-
	member(Tag,[null,'WP','PRP']).

get_morphology('VBD',or(s3,pl)).

get_morphology('VBN',or(en,psv)).

get_morphology('VBZ',s3).

get_morphology('VBG',ing).

get_morphology('VBP',pl).

get_morphology('VB',or(pl,inf)).


get_morphology('TO',to).  % ????

get_morphology(T,or(s3,pl)) :- member(T,['EX','WDT','PDT','PRP$']).

% find the first thing that has morph marking:

find_morphology([],_).

find_morphology([_/Tag|_T],M) :-
	get_morphology(Tag,M),
	!.

find_morphology([_|T],M):-
	find_morphology(T,M).
	

/*---------------------------------------------------------------------
% find a phrase(+FSMState,+CurrentV,-NextV,+EndV,+ListOfEdgeIdsInPhrase)
%-----------------------------------------------------------------------

no cuts because this predicate needs to backtrack.
----------------------------------------------------------------------*/


% the terminating clauses:

find_a_phrase(State,Vertex,Vertex,EndVertex,[]):-
	final_state(State),
	Vertex =< EndVertex.


% empty arcs:

find_a_phrase(State,StartVertex,LastVertex,EndVertex,Ids):-
        s(State,jump,Next),
%	write('jumped from'-State-to-Next),nl,
	find_a_phrase(Next,StartVertex,LastVertex,EndVertex,Ids).
	


find_a_phrase(State,StartVertex,LastVertex,EndVertex,[Id|RestIds]):-
        edge(StartVertex,NextV,Id,tag,Cat,[],[WordEdgeId]),
	edge(StartVertex,NextV,WordEdgeId,Type,Word,[],Word),
	member(Type,[tok,pnct]),
	NextV =< EndVertex,
	s(State,Word/Cat,NextState),
	find_a_phrase(NextState,NextV,LastVertex,EndVertex,RestIds).


/*---------------------------------------------------------------------
find_a_phrase(State,StartVertex,LastVertex,EndVertex,[Id|RestIds]):-
        edge(StartVertex,NextV,Id,tag,Cat,[],WordEdgeIds),
	find_or_make_word(WordEdgeIds,Word),
	NextV =< EndVertex,
	s(State,Word/Cat,NextState),
	find_a_phrase(NextState,NextV,LastVertex,EndVertex,RestIds).
----------------------------------------------------------------------*/

/*---------------------------------------------------------------------
% found a tag edge, pull out the word because
% the FSMs can refer to words as well as tags (e.g. for idioms), then recurse.
----------------------------------------------------------------------*/


find_a_phrase(State,StartVertex,LastVertex,EndVertex,[Id|RestIds]):-
        edge(StartVertex,NextV,Id,phrase,Cat,[],_),
	NextV =< EndVertex,
	s(State,_Word/Cat,NextState),
	find_a_phrase(NextState,NextV,LastVertex,EndVertex,RestIds).

/*---------------------------------------------------------------------
% words aren't relevant for phrases (not really true). 
----------------------------------------------------------------------*/

find_or_make_word([WordEdgeId],Word) :-
	edge(_StartVertex,_NextV,WordEdgeId,_Type,Word,[],Word),
	!.

find_or_make_word(WordEdgeIds,Word):-
	collect_words_from_edges(WordEdgeIds,Words),
	make_single_atom(Words,Word).

