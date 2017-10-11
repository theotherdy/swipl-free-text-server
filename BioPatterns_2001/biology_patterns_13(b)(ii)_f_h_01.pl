/*------------------------------------------------------
question 13(b)(ii) - foundation+ higher tier 2001
QUESTION:  Sunlight falls on plant leaves.
Leaves can turn to any angle so that they are facing the sun,
edge to the sun or somewhere in between. Students went into a shaded
area and into an open area. They were careful to choose plants
of the same type. The charts show their results.
 
            (two charts are given)

 i.	describe the pattern of results shown in chart1 and chart 2
 ii.	The leaf positions were different in the two areas. Use your
 biological knowledge about photosynthesis and transpiration to explain why.


ANSWER KEY :
I.  A. In full light, less surface area exposed to sun
 B. In full light, leaves don't face the sun as this:
   (a) reduces transpiration
   (b) reduces water loss
   (c) prevent wilting 
II. A. In shade, leaves face sun to obtain max. light
 B. In shade, leaves face sun for 
   (a) photosynthesis
   (b) to make food

---------------------------------------------------------*/
%:-multifile answer/4.
:-multifile or_rule/2.
:-multifile full_mark/2.


:- multifile ::/2.
:- multifile ==>/2.

:- multifile alternative/2.

/*
:- multifile category/2.
:- multifile boolean_feature/2.
:- multifile feature_value/2.
:- multifile lattice_feature/2.
*/
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).
/*
% the following features are instantiated by the FSM interpreter:
category(np,[det,head,mor,mods,sem]).

% det takes as value any determiner that is present, or `nulldet' if none
% head is the (possibly inflected) head noun, or a list if a name
% mor is a boolean morphology feature, just as in the FraCaS grammar
% mods is a list of anything coming between a det and the head, if the NP is not
% a name
% sem is intended to be used to build a simple semantics for an NP etc


category(vg,[pol,head,mor,passive,modal,adv]).

% pol = polarity and has as value neg or pos. Will be neg if VG contains n't or not.
% passive = yes or no: test is whether VG contains a VBN + some form of `be'
% modal - value is that of (first) MD tagged word, or `null'
% adv is (first) VG internal adverb, or `null'

% any further features are only present in patterns:
% these features are experimental and subject to change:

category(s,[pred,arg1,arg2,mods,pol]).   
category(pp,[head,arg1,arg2,sem]).

% some upper level categories
category(cat1,[]).
category(cat2,[]).
category(cat3,[]).

% declarations needed by gcompile.pl:

boolean_feature(mor,[[s1,s2,s3,pl,inf,ing,en,to,psv]]).

lattice_feature(none,dummy).

hol_feature(none).

ignore_feature(dummy).

flist_feature(dummy,_).

% infix operators to make patterns more readable:

:- op(900, xfx, '::').
:- op(800, xfx, '==>').

*/

% Id is of the form :
% question(number,part,subpart): rule(Set_number,rule_number, level)
%    if more than one level then additional argument is added to differentiate
% between the rules
:- multifile equivalence_class/2.



% question 13(b)(ii) foundation/ higher tier paper 2001 -

% equivalence class 1
%[In full light, less surface area exposed to sun]

question(13,b,ii): rule(1,1,1):: complete ==>[w(W), w(temperature), w(V)]:-
	member(W,[core, body,blood]),
	member(V,[detected,noticed,felt,monitored,checked]).



% equivalence class 2
% In full light, leaves don't face the sun as this:
%   [(a) reduces transpiration/(b) reduces water loss/(c) prevent wilting] 

% set 1
% [reduces transpiration]

% set 2
% [reduces water loss]


% set 3
% [prevent wilting]




% equivalence class 3
% [ In shade, leaves face sun to obtain max. light]
% assuming that implicitly students are talking about shaded area!!

question(13,b,ii): rule(3,1,1):: complete ==>[w(to), w(V), w(M), w(L)]:-
	member(V,[obtain,get]),
	member(M,['max.',max,maximum]),
	member(L,[light,sunlight]).

% to obtain/get all the /some light (possible) (they can)
question(13,b,ii): rule(3,2,1):: complete ==>[w(to), w(V), ?(w(M)), c(np:[head=L]), (w(possible); c(vg:[head=can])]:-
	member(V,[obtain,get]),
	member(M,[all]),
	member(L,[light,sunlight]).

question(13,b,ii): rule(3,3,1):: complete ==>[w(V), w(M), w(L)]:-
	member(V,[for]),
	member(M,['max.',max,maximum]),
	member(L,[light,sunlight]).


question(13,b,ii): rule(3,4,1):: complete ==>[w(as), w(much), w(L)]:-
	member(L,[light,sunlight]).


question(13,b,ii): rule(3,5,1):: complete ==>[w(as), w(much), w(L)]:-
	member(L,[light,sunlight]).

% equivalence class 4
%  In shade, leaves face sun for 
%   [(a) photosynthesis/(b) to make food]

% set 1
% [photosynthesis]



question(13,b,ii): rule(4,1,1):: complete ==>[w(W), w(V)]:-
	member(W,[to,for]),
	member(V,[photosynthesize,photosynthesis,photosynthesise]).


%
question(13,b,ii): rule(4,2,1):: complete ==>[w(so), ?(w(that)),(w(V); c(np:[head=K])),c(vg:[head=W])]:-
	member(V,[it,they]),
	member(K,[leaf,leaves]),
	member(W,[photosynthesize,photosynthesise]).

question(13,b,ii): rule(4,3,1):: complete ==>[w(so), ?(w(that)),(w(V); c(np:[head=K])),c(vg:[head=perform]), w(photosynthesis)]:-
 member(V,[it,they]),
 member(K,[leaf,leaves]).

% set 4
% [to make food]

  question(13,b,ii): rule(4,4,1):: complete ==>[w(W), ?(w(U)),w(V)]:-
 member(W,[to,for]),
 member(U,[more]),
 member(V,[food,growing,grow]).


  question(13,b,ii): rule(4,5,1):: complete ==>[w(to), w(U),?(w(more)),w(V)]:-
 member(U,[make,produce]),
 member(V,[food]).

  question(13,b,ii): rule(4,5,1):: complete ==>[w(for), w(U),?(w(more)),w(V)]:-
 member(U,[making,producing]),
 member(V,[food]).

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/13(b)(ii).pl').
