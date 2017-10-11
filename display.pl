/*---------------------------------------------------------------------
display.pl - various predicates for displaying the contents of a chart

Version 1, 2002.
This version June 2005: lots of irrelevant stuff
omitted.
SGP.
----------------------------------------------------------------------*/

% display_tags(+StartVertex,+EndVertex,-ListOfWordTagPairs)
%----------------------------------------------------------

display_tags(V,V,[]).

% at the end


display_tags(From,To,[Word/Tag|Tagged]) :-
	edge(From,Nxt,_,tag,Tag,[],[WordEdge]),
	edge(From,Nxt,WordEdge,_,Word,_,Word),
	!,
	display_tags(Nxt,To,Tagged).

% if there's a tag edge, there will be a word or punct tok edge
% between the same vertices.
% Relate the word to its tag and recurse

	     
display_tags(From,To,Tagged) :-
	edge(From,Next,_,_,_,[],_),
	!,
	display_tags(Next,To,Tagged).

% otherwise it must be space or nl so skip.

% simple code for displaying edges directly if you know
% which edge it is you want to look at:

display_edge(Id,Word/Tag) :-
	edge(_,_,Id,tag,Tag,[],[WordEdge]),
	edge(_,_,WordEdge,_,Word,_,Word),
	!.

display_edge(Id,Daughters/Cat) :-
        edge(_,_,Id,phrase,Cat,[],Contents),
	map_display_edge(Contents,Daughters),
	!.

display_edge(Id,Daughters/Cat) :-
        edge(_,_,Id,phrase(_),Cat,[],Contents),
	reverse(Contents,Reversed),
	map_display_edge(Reversed,Daughters),
	!.

display_edge(Id,Thing) :-
	 %edge(_,_,Id,_tok,_,[],Thing),
	 edge(_,_,Id,_,_,[],Thing),
	 !.

% mapping fn for display_edge/2:


map_display_edge([],[]).

map_display_edge([H|T],[Edge|Rest]):-
	display_edge(H,Edge),
	!,
	map_display_edge(T,Rest).


% display pattern edges

display_pattern_edges(Id:Rule,Edge):-
	edge(_,_,Id,phrase(Rule),_,_,_),
	display_edge(Id,Edge).

% find the longest edges (i.e. longest stretches of text analysed):

display_longest_edges(Tree) :-
        edge(Start,End,_,tagged_sentence,_,_,[_|_]),
	setof(Span-Id,
	      From^To^Name^Contents^Orig^(
					  edge(From,To,Id,phrase(Name),Orig,[],Contents),
					  From >= Start,
					  To =< End,
					  Span is To-From),
	      All),
	reverse(All,[_-Id|_Reversed]),
	display_edge(Id,Tree).



% display all edges, complete and incomplete:


edges :-
	listing(edge).

% display all complete NP and VG edges:

phrase_edges :-
	edge(From,To,Id,phrase,Orig,[],Contents),
	write(edge(From,To,Id,phrase,Orig,[],Contents)),nl,
	fail.

phrase_edges.


% display all complete pattern edges:

pattern_edges :-
	edge(From,To,Id,phrase(P),Orig,[],Contents),
	write(	edge(From,To,Id,phrase(P),Orig,[],Contents)),nl,
	fail.

pattern_edges.

% end of file
