
/*---------------------------------------------------------------------

pattern_chart.pl

A chart parser for the pattern formalism. 

Version 1, July 2003. 

Version of June 2005. 

----------------------------------------------------------------------*/


/*---------------------------------------------------------------------
% apply_patterns_chart(+PatternGroupId)
%--------------------------------------

Applies patterns from named group (which can be uninstantiated,
getting everything) in every possible way (I hope) adding edges to the
chart. Does a sentence at a time.

Sept 2003 Changed to use compiled form of patterns

Sept 2004 Changed treatment of ? options in patterns, which was incorrect.
          Removed kleene star notation as it was not used.

----------------------------------------------------------------------*/

% for each sequence of words counted as a sentence, apply patterns to it:

apply_patterns_chart(Id) :-
   edge(From,To,_,tagged_sentence,_,_,[_|_]),
   initial_agenda(Id,From,To,Agenda),
   main_loop(Id,From,To,Agenda),
   fail.

apply_patterns_chart(_).

/*---------------------------------------------------------------------
initial_agenda(+PatternGroupId,+LeftMostVertex,+RightmostVertex,-Agenda)
-----------------------------------------------------------------------

Create the initial agenda. Note that patterns must START with an atomic
element as defined in pattern_spec.txt so that they can be found
efficiently.
----------------------------------------------------------------------*/


initial_agenda(Id,From,To,Agenda) :-
      findall(X,(cmp_pattern(Id, LHS, [First|RHS]),
                 find_left_anchor(From,To,First,Left,Right,EdgeId),
                 new_edge_id(NewId),
	         X=edge(Left,Right,NewId,phrase(Id),LHS,RHS,[EdgeId])),
	    Agenda).



% main_loop(+PatternGroupId,+LeftMostVertex,+RightmostVertex,+Agenda)
%--------------------------------------------------------------------

main_loop(_Id,_From,_To,[]).

main_loop(Id,From,To,[Edge|OtherEdges]) :-
	assert_next_edge(Edge,Assertable,Alternatives),
	combine(From,To,Assertable,NewEdges1),
	propose(Id,Edge,NewEdges2),
	append(NewEdges2,NewEdges1,Tmp),
	append(Tmp,OtherEdges,NewAgen),
	append(Alternatives,NewAgen,NewAgenda),
	!,
	main_loop(Id,From,To,NewAgenda).

% assert_next_edge(+Edge,-VersionOfEdgeForCombineEtc,-EdgesForOptions)
%--------------------------------------------------------------------
/* If edge begins with an optional element ?(X), then create a version
of the edge where (non-optional) X is next on the Needed list.
Assert this edge and use this for combine and propose etc.
Also create a new edge, with the ?(X) removed, to add to the agenda.
The advantage of this is that combine now can be just as for
a standard parser, since it will never see the ? symbol
*/

assert_next_edge(edge(From,To,Id,Type,Cat,[?(Next)|Rest],Contents),
		 edge(From,To,Id,Type,Cat,[Next|Rest],Contents),
		 [edge(From,To,Id,Type,Cat,Rest,Contents)]) :-
	new_edge_id(NewId),
	assert(edge(From,To,NewId,Type,Cat,[Next|Rest],Contents)),
	!.

% not an optional element so just deal with it

/*---------------------------------------------------------------------
assert_next_edge(edge(From,To,Id,Type,Cat,Needed,Contents),
		 edge(From,To,Id,Type,Cat,Needed,Contents),[]) :-
	edge(From,To,_Id,Type,Cat,Needed,Contents),
	!.
----------------------------------------------------------------------*/



assert_next_edge(edge(From,To,Id,Type,Cat,Needed,Contents),
		 edge(From,To,Id,Type,Cat,Needed,Contents),[]) :-
	
	assert(edge(From,To,Id,Type,Cat,Needed,Contents)).


	


%combine(+LeftMostVertex,+RightmostVertex,+Edge,-NewEdges)
%--------------------------------------------------------


/*---------------------------------------------------------------------
Combines an edge from the agenda with edges already in the chart.


need to check that edge types match up: otherwise word patterns
can be satisfied by a tag edge in those cases (punctuation, in particular)
where the tag is the same as the word. For now just require w(X) to be
used only where X is a genuine word.
----------------------------------------------------------------------*/


% edge added to chart is complete:

combine(Start,_End,edge(From,To,H,_,Cat,[],_),New) :-
 findall(X,(edge(Left,From,_Id,Orig,Cat1,[First|Rest],Cnts),
	    Left >= Start,
	    match(Cat,First,H),
            new_edge_id(I),
            X=edge(Left,To,I,Orig,Cat1,Rest,[H|Cnts])
	   ), New).


% edge is incomplete: 

combine(_Start,End,edge(From,To,_,Orig,Cat,[First|Rest],Con),New) :-
 findall(X,(edge(To,Right,Id,_,Cat1,[],_),
	    Right =< End,
	    match(Cat1,First,Id),
            new_edge_id(I),
            X=edge(From,Right,I,Orig,Cat,Rest,[Id|Con])
	   ), New).


% propose(+PatternGroupId,+CompleteEdge,-NewEdges).
%-------------------------------------------------
% find all new edges that this (complete) one can begin:

propose(Id,edge(From,To,I,_,Cat,[],_Con),New) :-
  findall(X,(cmp_pattern(Id,LHS,[First|RHS]),
	    match(Cat,First,I),
            new_edge_id(NewId),
            X=edge(From,To,NewId,phrase(Id),LHS,RHS,[I])
	   ),
           New),
  \+New=[],
  !.

propose(_,_,[]).
 

% find_left_anchor(+LeftmostV,+RightmostV,+PatternElement,-LeftVFound,-RightVFound,-EdgeIdFound)
%-----------------------------------------------------------------------------------------------
/*---------------------------------------------------------------------
We don't want to call propose on every edge already in the chart from tokenisation,
tagging, and find_phrases. So we just look for possible starting points for a pattern
to get things going.
----------------------------------------------------------------------*/


find_left_anchor(LeftLimit,RightLimit,c(Cat),Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId,_Type,Cat,[],_),
	Right =< RightLimit,
	Left >= LeftLimit.


find_left_anchor(LeftLimit,RightLimit,c(Cat):Condition,Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId,_Type,Cat,[],_),
	Right =< RightLimit,
	Left >= LeftLimit,
	call(Condition).



find_left_anchor(LeftLimit,RightLimit,w(Word),Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId,_Type,Word,[],Word),
	Right =< RightLimit,
	Left >= LeftLimit.


find_left_anchor(LeftLimit,RightLimit,w(Word):Condition,Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId,_Type,Word,[],Word),
	Right =< RightLimit,
	Left >= LeftLimit,
	call(Condition).


find_left_anchor(LeftLimit,RightLimit,Word/Cat,Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId1,_Type,Word,[],Word),
	edge(Left,Right,EdgeId,tag,Cat,[],[EdgeId1]),
	Right =< RightLimit,
	Left >= LeftLimit.


find_left_anchor(LeftLimit,RightLimit,Word/Cat:Condition,Left,Right,EdgeId) :-
	edge(Left,Right,EdgeId1,_Type,Word,[],Word),
	edge(Left,Right,EdgeId,tag,Cat,[],[EdgeId1]),
	Right =< RightLimit,
	Left >= LeftLimit,
	call(Condition).


%match(+Category,+NextPatternItem,+IdOfEdgeTested)
%------------------------------------------


% variable:
%----------

match(Cat,Cat,_Id).


% variable with condition:
%-------------------------

match(Cat,Cat:Condition,_Id):-
    call(Condition).


% category:
%----------

match(Cat,c(Cat),_Id).

% category with condition:
%-------------------------

match(Cat,c(Cat):Condition,_Id):-
    call(Condition).

% cat could be POS or phrase - we don't distinguish in patterns, though
% they are distinguished in the chart


% word (do not use for punctuation):
%----------------------------

match(Cat,w(Cat),_Id).

% word with condition:
%-------------------------

match(Cat,w(Cat):Condition,_Id):-
    call(Condition).



% word/cat combination 
%---------------------

match(Word,Word/Cat,Id):-
    edge(_From,_To,_EdgeId,tag,Cat,[],[Id]).


% word cat with condition
%---------------------------

match(Word,Word/Cat:Condition,Id):-
    edge(_From,_To,_EdgeId,tag,Cat,[],[Id]),
    call(Condition).


% disjunction, assumed to be mutually exclusive:
%----------------------------------------------

match(Cat,(X;_Y),Id) :-
	match(Cat,X,Id).


match(Cat,(_X;Y),Id) :-
	match(Cat,Y,Id).

% end of file
%------------
