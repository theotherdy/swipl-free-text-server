% edit_distance.pl
%----------------


:- ensure_loaded(library(lists)).

/*
:- multifile stateset/2.
:- multifile l/3.
:- multifile lfinal/2.
*/

/*---------------------------------------------------------------------

Edit distance: compute edit distances between a string and
a lexicon represented as a trie-finite-state machine, such
as is built by make_fsm/0.

Version 2 Jan 2005

SGP


We are constructing a matrix States x length of string.
If we visualise the usual edit distance matrix between a
string and a word as:

    s t r i n g
  0 1 2 3 4 5 6
w 1 
o 2
r 3
d 4

then we are building rows for each state/transition in the trie.

First we represent the states of the trie as a set of sets of states
ordered by distance from the initial state: these distances correspond to the
row numbers. Let stateset(j) denote the set of states corresponding
to a particular distance down the trie.

Let s0 be the initial state, and for any state s let
transition(s) denote the symbol on the transition leaving s,
and previous(s) denote the state leading to s. Both of
these will be unique because we are dealing with a trie.

initialise:

m(s0,0,0)

for i = 1 to length(string) m(s0,i,i).

for j = 1 to n in statesets,
   for s in stateset(j)
       m(s(j),0,j)      - first entry in row
       for i = 1 to length(string)
         if transition(previous(s)) = string(i) then Cost = 0 else Cost = 1
	 m(s(j),i,Score) where Score is min of
	    m(previous(s(j)),i-1,OldScore+Cost)
	    m(previous(s(j)),i,OldScore+1)
	    m(s(j),i-1,OldScore+1)

----------------------------------------------------------------------*/




:- dynamic m/5,
%	stateset/2, l/3, lfinal/2,	% these three should be static, but this
	spelling_correction/2.          % causes a segmentation fault

% matrix m(FSMState,StringPos,Score,PreviousState-PreviousStringPos,
%                             LastStringCharSeen:LastWordCharSeen)

/*---------------------------------------------------------------------
spell_check3(+String,-Alignment,-Distance)

clean up from last time, if necessary,
initialise,
compute edit distance over the whole trie, except where
edit distance threshold is exceeded
sort all matrix entries based on final states, lowest distance(s) first,
trace back the alignment
----------------------------------------------------------------------*/




% succeed trivially for numbers:
	
spell_check3(Number,[],_) :-
	number(Number),
	!.
	
spell_check3(String,Words,Distance) :-
	change_all_to_lower_case(String,Lower),
	retractall(m(_,_,_,_,_)),
	explode_atom(Lower,List),
	length(List,L),
	L > 3,                                      % don't bother for words of up to 3 chars
	initialise(L,List),
%	(L < 8 -> Threshold = 2 ; Threshold = 3),   % vary threshold
	edit_distance(1,L,List,4),                  % set threshold (actually ignored below)
	findall(Score-State,
		(m(State,L,Score,_,_),Score =< 3, lfinal(State,_)),
		All),
	keysort(All,Sorted),
	%Sorted = [First,Second,Third|_],
	findall(LowerGood,
	      (member(Distance-Final,Sorted), %[First,Second,Third]),
               traceb(Final,L,Alignment),
	       make_word(Alignment,[],Word),
	       change_all_to_lower_case(Word,LowerGood)
	      ),
		Lowers),
	remove_duplicates(Lowers,Words).
	

% an alignment is a list of PossiblyIncorrect:Correct paired chars: need to concatenate the
% Correct ones to make the intended word:

% at end of recursion have the list of chars:

make_word([],Chars,Word) :-
	implode_atom(Word,Chars).

% ignore empty string and recurse:

make_word([_:0|R],R1,W):-
	!,
	make_word(R,R1,W).

% keep correct char and recurse:

make_word([_:C|R],R1,W):-
	!,
	make_word(R,[C|R1],W).

/*---------------------------------------------------------------------
get_state_sets(+CurrentSetOfStates,-NextSet,+DepthInTrie)

Collect states at each depth of trie into sets indexed by depth.
We could compute these on the fly, but at the moment, if we
are not using the whole lexicon to spell check against, processing
is faster this way.
----------------------------------------------------------------------*/

get_state_sets(LastStates,NextStates,N) :-
	setof(S-Transition-State, Last^T^(member(Last-T-S,LastStates),
				         l(S,Transition,State)),
	      NextStates),
	assert(stateset(N,NextStates)),
	M is N+1,
	!,
	get_state_sets(NextStates,_,M).

get_state_sets(_,_,_).

% retain only those states that are already
% known to be on a path with edit distance less
% than the threshold:

filter(StateSetIn,StateSetOut,Threshold) :-
	setof(State-Transition-Next,
	        A^B^C^(member(State-Transition-Next,StateSetIn),
                       m(State,A,Score,B,C),
	               Score =< Threshold
		       ),
		StateSetOut).



% for j = 1 to n in statesets:

edit_distance(N,L,String,Threshold) :-
	stateset(N,StateSet),
/*	(N > 2 -> filter(StateSet,Filtered,Threshold)    % this will filter out
	; Filtered = StateSet),                          % candidates too far out.
	fill_state_entries(Filtered,N,L,String),         % we don't use it in this version
*/	fill_state_entries(StateSet,N,L,String),
	M is N+1,
	!,
	edit_distance(M,L,String,Threshold).

edit_distance(_,_,_,_).  % no more statesets


% for s in stateset(j): (columns)

fill_state_entries([],_,_,_).

fill_state_entries([Last-Trans-State|StateSet],N,L,String) :-
	assert(m(State,0,N,Last-0,_:Trans)),
        fill_row(Last,Trans,State,1,L,String),
	!,
	fill_state_entries(StateSet,N,L,String).



% for i = 1 to length(string):

fill_row(_Last,_Trans,_State,K,L,_String):-
	K > L,
	!.

fill_row(Last,Trans,State,StringPos,L,String) :-
	nth1(StringPos,String,Char),
	(Char == Trans -> Cost is 0 ; Cost is 1),
	find_min_and_coords(Last,State,StringPos,Cost,Min,
			    Coords),
	assert(m(State,StringPos,Min,Coords,Char:Trans)),
	M is StringPos+1,
	!,
	fill_row(Last,Trans,State,M,L,String).

/*---------------------------------------------------------------------
find_min_and_coords(+LastState,+CurrentState,+StringPos,+Cost,-Min,-Coords)

 cost is a flag recording whether the current word and string chars match
 find the minimum of cell above, diagonally left, or left
 and record value and back reference (Coords)
----------------------------------------------------------------------*/

find_min_and_coords(Last,Current,StringPos,Cost,Min,Coords):-
	LastStringPos is StringPos-1,
	m(Last,LastStringPos,Score,_,_),
	Score1 is Score+Cost,
	m(Last,StringPos,ScoreA,_,_),
	m(Current,LastStringPos,ScoreB,_,_),
	Score2 is ScoreA+1,
	Score3 is ScoreB+1,
	keysort([Score1-(Last-LastStringPos),
		 Score2-(Last-StringPos),
		 Score3-(Current-LastStringPos)],
		[Min-Coords|_]).

/*---------------------------------------------------------------------
initialise(+LengthOfString,+ListOfStringChars)

put in top left entry
start column for each position in string
----------------------------------------------------------------------*/

initialise(L,List) :-
	assert(m(0,0,0,start-start,_)),
	assert_columns(L,0,List).

assert_columns(0,_,_) :- !.

assert_columns(L,State,CharList) :-
	Last is L-1,
	nth1(L,CharList,Char),
	assert(m(State,L,L,0-Last,Char:_)),
	M is L-1,
	!,
	assert_columns(M,State,CharList).

/*---------------------------------------------------------------------
traceb(+State,+StringPos,-Alignment)

recover the alignment by retracing from a final state matrix
entry, using the `coordinate' field which tells what the previous one
was.
----------------------------------------------------------------------*/


traceb(0,0,[]).

traceb(State,StrPos,[Alignment|R]):-
	m(State,StrPos,_Score,PrevSt-PrevPos,StrChar:WordChar),
	m(PrevSt,PrevPos,_PrevScore,_,_),

	    % if we have advanced both state and string pos, then
	    % chars can be aligned, whether they matched or not:

	((State > PrevSt,StrPos > PrevPos) -> Alignment=StrChar:WordChar
	 ;

	    % if previous state = this state insert 0 in word:
	    
	    (State = PrevSt -> Alignment = StrChar:0
	    ;

            % if previous string pos = this string pos, insert 0 in string:
		
		(StrPos = PrevPos -> Alignment = 0:WordChar
		;
		    
	    % otherwise something has gone wrong:
		    
		    write('Help!'),nl
		)
	    )
	),
	!,
	traceb(PrevSt,PrevPos,R).
        


/*---------------------------------------------------------------------
% MAKING A LEXICAL FSM

% l(?FromState,?Transition,?ToState).
----------------------------------------------------------------------*/

% states are atoms, or f(Cat) where Cat is the cat associated with a
% morpheme. f is for final. 


:- dynamic counter/1.

% initialised as:


counter(1).


% make up a new state number:

newstate(X) :-
 counter(X),
 retract(counter(X)),
 Y is X+1,
 assert(counter(Y)).


/*---------------------------------------------------------------------
% utilities:
----------------------------------------------------------------------*/

% word or number -> charlist

 explode(Word,Charlist):-
	 (number(Word) -> number_codes(Word,AsciiList)
	 ;
         atom_codes(Word,AsciiList)
	 ),
          ascii_to_chars(AsciiList,Charlist).



% charlist -> word or number

 implode(Word,CharList):-
  ascii_to_chars(AsciiList,CharList),
  (all_number_codes(AsciiList) -> number_codes(Word,AsciiList)
  ;
  atom_codes(Word,AsciiList)
  ).


% word to charlist:

 explode_atom(Word,Charlist):-
       atom_codes(Word,AsciiList),
       ascii_to_chars(AsciiList,Charlist).

% charlist to word:

 implode_atom(Word,CharList):-
  ascii_to_chars(AsciiList,CharList),
  atom_codes(Word,AsciiList).

% codelist to and from charlist

ascii_to_chars([],[]).

ascii_to_chars([H|T],[H1|T1]):-
  char_code(H1,H),
  ascii_to_chars(T,T1).



all_number_codes([H|T]):-
	member(H,[46,49,50,51,52,53,54,55,56,57,48]), % include . for decimals
	!,
	all_number_codes(T).

all_number_codes([]).

/*---------------------------------------------------------------------
make_fsm/0.

given a suitable list of morphemes, stored as m/2,
will construct the fsm representing the lexical character tree
----------------------------------------------------------------------*/

make_fsm:- 
     retractall(l(_,_,_)),
     retractall(counter(_)),   % clean up from last time
     retractall(lfinal(_,_)),
     assert(counter(1)),
     add_morphemes.

/*---------------------------------------------------------------------
% add_morphemes/0 to the fsm one by one: a failure driven loop.
----------------------------------------------------------------------*/

add_morphemes :-
 m(Morph,MorphCat),
 add_morph(Morph,MorphCat),
% nl,write('------------':adding(Morph)),nl, listing(s),listing(entry),
 fail.

add_morphemes.

/*---------------------------------------------------------------------
% add_morph(+Morpheme,+Category)

adds a single morpheme: will ignore numbers
----------------------------------------------------------------------*/

add_morph(Morph,MorphCat):-
% atom(Morph),
 explode(Morph,List),
 add_to_fsm(0,List,MorphCat),  
 !.

/*---------------------------------------------------------------------
% add_to_fsm(+CurrentState,+ListOfChars,+EntryForWord).

% basically this goes through the existing fsm
% matching the word character by character.
% If no match can be found then new transitions are created.
----------------------------------------------------------------------*/


add_to_fsm(State,[],MorphCat) :-
       lfinal(State,MorphCat),
       !.

add_to_fsm(State,[],MorphCat) :-
       assert(lfinal(State,MorphCat)).

% at end of word, add final state with entry

add_to_fsm(State,[X|Xs],MorphCat):- 
     l(State,X,Nextstate), !,
     add_to_fsm(Nextstate,Xs,MorphCat).

% see if a transition already exists. if it does, recurse

add_to_fsm(State,[X|Xs],MorphCat):- 
     newstate(Newstate), 
     assert(l(State,X,Newstate)), 
     add_to_fsm(Newstate,Xs,MorphCat). 
 
% if not,  create a new one and recurse

/*---------------------------------------------------------------------

Getting a lexicon to spell-check against.

Generally, you don't what to check against a huge lexicon
unless you have a good language model to filter the
suggestions. So we build an app-specific lexicon.

For the Shauto-marking system, edit in the `assert(used/2)' line
in tagger.pl. This will add a record for each word used.
List these to a file, and do the same for spelling_correction/2.
Do `sort -u' on them to eliminate duplicates. Now make
a special lexicon of lx/2 records for them,
where each word is represented
as lx(Word,[dummy]). Load this lexicon and then do:

compile_tag_lexicon_for_spell_check(yourfile).
----------------------------------------------------------------------*/

% make_fsm/0 expects m/2 rather than lx/2.

m(Morph,Tags) :- lx(Morph,Tags).

compile_tag_lexicon_for_spell_check(OutFile):-
      setup,
      tell(OutFile),
      listing(l/3),
      listing(stateset/2),
      listing(lfinal/2),
      told.
      
	

setup :-
	make_fsm,
	get_state_sets([dummy-dummy-0],_,1).


				% provided in Sicstus bit not in SWI:

remove_duplicates([],[]).

remove_duplicates([H|T],Pruned) :-
	memberchk(H,T),
	!,
	remove_duplicates(T,Pruned).

remove_duplicates([H|T],[H|Pruned]) :-
	remove_duplicates(T,Pruned).
	
