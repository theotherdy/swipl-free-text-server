

/*-------------------------------------------------------------------------------
question 9(c)
where could you detect the pulse and what causes it ?
--------------------------------------------------------------------------------*/



%:-multifile answer/4.
:- multifile full_mark/2.


:- multifile alternative/2.
:- multifile alternatives/2.

:- multifile '::'/2.
:- multifile '==>'/2.

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

% equivalence class 1

% you detected/is detected in/on the wrist
question(9,c,0): rule(1,1,1):: complete ==> [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),?(c(np:[head=pulse])),?(_W/'IN'),c(np:[head=M]):alternative(M,wrist)].  % check for prepositions 

% how about if I did like the first version and just considered the word wrist
question(9,c,0): rule(1,11,1):: complete ==> [w(W):alternative(W,wrist)].

% you detected/is detected on the arm next to/near your the hand
question(9,c,0): rule(1,111,1):: complete ==> [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),?(c(np:[head=pulse])),?(_W/'IN'),w(arm),?(w(_W)),?(w(_O)),w(hand)].  
% on the arm next to/near your the hand
question(9,c,0): rule(1,1111,1):: complete ==> [w(arm),?(w(_W)),?(w(_O)),c(np:[head=H]):member(H,[hand,hands])].  

% ... temple
question(9,c,0): rule(1,2,1):: complete ==>  [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),w(in),c(np:[head=temple])].        
	
question(9,c,0): rule(1,21,1):: complete ==> [w(W):alternative(W,temple)].
% ... neck
question(9,c,0): rule(1,3,1):: complete ==>  [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),w(on),c(np:[head=M]):alternative(M,neck)].
	
question(9,c,0): rule(1,31,1):: complete ==> [w(W):alternative(W,neck)].

%(w(jugular),w(vein))]). 
question(9,c,0): rule(1,311,1):: complete ==> [w(jugular),w(vein)].

% ... forehead
question(9,c,0): rule(1,4,1):: complete ==> [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),w(on),c(np:[head=forehead])].
	

% ... bottom part of the jaw
question(9,c,0): rule(1,5,1):: complete ==> [c(vg:[head=V,pol=pos]):alternatives(V,[detected,detect]),?(w(_L)),w(bottom), w(part), ?(w(_L2)),?(w(_L3)), w(jaw)].
	
% bottom part of the jaw
question(9,c,0): rule(1,5,1):: complete ==> [w(bottom), w(part), ?(w(_L2)),?(w(_L3)), w(jaw)].
	
% where an artery close to the skin can be pressed against a bone or ankle for infants
question(9,c,0): rule(1,6,1):: complete ==> [w(W):member(W,[artery,arteries]), ?(w(close)),?(w(to)),?(c(np:[head=skin])),c(vg:[head=P,pol=pos]):member(P,[pressed,pushed]),w(against), c(np:[head=B]):member(B,[bone,ankle])].


/*
question(9,c,0): rule(1,7,1):: complete ==>  [w(W), k(8,_S1), w(against), k(1, _S2), w(ankle)]:-
	member(W,[artery,arteries]).
*/
/*
% wrong Biology taken into consideration also
question(9,c,0): rule(1,8,1):: reject_deduct==>[w(W):alternative(W,heart), k(5,_S1), w(B):alternative(B,beat),k(2,_S2), w(J):alternative(J,speed)].
	
	
	

question(9,c,0): rule(1,9,1):: reject_deduct ==> [w(B):alternative(B,beat),k(5,_S1), w(heart), w(J):alternative(J,speed)].
	
	

question(9,c,0): rule(1,10,1):: reject_deduct ==> [w(blood),k(1,_S1), w(B):alternative(B,beat), k(5,_S2), w(J):alternative(J,speed), w(heart)].
	
	

question(9,c,0): rule(1,11,1):: reject_deduct ==>[w(blood),k(2,_S1), w(B):	alternative(B,surge), k(2,_S2), w(artery), w(J):alternative(J,speed)].

	*/

%%%%%%
% due to considering the last few rules as a separate equivalence class
% this point i.e. whether to consider the above a separate equiv class or not
% need to be thought abotu when implementing the deduction
%%%%%%%

% commented out one option in following two rules to gain speed
% on one particular answer, where a pathological interaction
% caused a big slowdown. SGP June 2005
	
question(9,c,0): rule(3,1,1):: complete ==>
    [w(B):alternative(B,heart),?(w(_I)),?(w(_J)),?(w(_K)),?(w(_L)),%?(w(_M)),
     w(C):alternative(C,beat)].
	


question(9,c,0): rule(3,2,1)::complete ==>
    [w(C):alternative(C,beat),?(w(_I)),?(w(_J)),?(w(_K)),?(w(_L)),%?(w(_M)),
     w(heart)].
	

question(9,c,0): rule(3,3,1)::complete ==>[w(blood),?(w(_U)), w(C):alternative(C,beat), ?(w(_I)),?(w(_J)),?(w(_K)),?(w(_L)),?(w(_M)), w(heart)].
	

question(9,c,0): rule(3,4,1):: complete ==> [w(blood),?(w(_I)),?(w(_J)), w(A):alternative(A,surge), ?(w(_I)),?(w(_J)), w(artery)].
	

question(9,c,0): rule(3,5,1)::complete ==> [w(A):member(A,[artery,arteries]),?(w(_I)),?(w(_J)), w(blood), ?(w(_I)),?(w(_J)), w(pressure)].
	

% reject_deduct rules


% how fast/slow/the speed with which her/the heart was beating
question(9,c,0): rule(4,1,1)::reject_ignore_deduct ==> [w(F):member(F,[fast,slow]),c(np:[stem=heart]),?(c(vg:[pol=pos,stem=S]):member(S,[start])),c(vg:[pol=pos,stem=B]):member(B,[beat,pump])].

% the speed with which her/the heart was beating
% the speed of/with which the heart starts to beat/beating etc
question(9,c,0): rule(4,2,1)::reject_ignore_deduct ==> [c(np:[stem=speed]),?(_/'IN'),?(w(_U)),c(np:[stem=heart]),?(c(vg:[pol=pos,stem=S]):member(S,[start])),c(vg:[pol=pos,stem=B]):member(B,[beat,pump])].

% heart (starts) to beat/ beats/beat/beating/pumping/pump (blood) faster/slower/quicker/quickly/fast/rapidly/at a fast/slow rate/speed
question(9,c,0): rule(4,3,1)::reject_ignore_deduct ==> [c(np:[stem=heart]),?(c(vg:[pol=pos,stem=S]):member(S,[start])),c(vg:[pol=pos,stem=B]):member(B,[beat,pump]),?(c(np:[stem=blood])),?(w(at)),?(_/'DT'),w(W):member(W,[faster,slower,quicker,quickly,slow,fast,rapidly]),?(c(np:[stem=K]):member(K,[speed,rate]))].

% the speed of/with which blood being pumped around your body by your heart.
% the speed of/with which the heart is pumping/pumps etc
question(9,c,0): rule(4,4,1)::reject_ignore_deduct ==>[c(np:[stem=speed]),?(_L/'IN'), ?(w(_O)),c(np:[stem=J]):member(J,[blood,heart]),c(vg:[pol=pos,stem=pump])].




full_mark(question(9,c,0),2).

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/9(c).pl').
