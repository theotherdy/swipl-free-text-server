% rules for question 2(b)(ii) higher tier paper 2003

%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).


/*------------------------------------------------------
 question : describe HOW these valves carry out their job
(two sets of valves are shown in the diagram)
% full mark is 2
--------------------------------------------------------*/
% equivalence class 1
%5, 6,8,9,10 subsumes some of the rest  --- put them first and see how much they overgenerate
% [if blood flows backwards/ ventricle contracts then valves shut]


%1.	(the/these) valve(s)/they/flaps/it/these (then) (will/would) (automatically/immediately) close(s)/shut(s)/closed/shut/lock

/*
question(2,b,ii): rule(1,1,1):: complete ==> [(c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP'),?(w(then)), (c(vg:[pol=pos,stem=S]):member(S,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].

*/
question(2,b,ii): rule(1,1,1):: complete ==> [c(np:[stem=V]):member(V,[valve,flap,these,this]),?(w(then)), (c(vg:[pol=pos,stem=S]):member(S,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].

question(2,b,ii): rule(1,'1_1',1):: complete ==> [_/'PRP',?(w(then)), (c(vg:[pol=pos,stem=S]):member(S,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].
% 2.	the/these) valve(s)/they/flaps/it/these (then) (will) (automatically) contract and close(s)/shut(s)/closed/shut/lock

/*
question(2,b,ii): rule(1,2,1):: complete ==> [(c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP'),?(w(then)),c(vg:[pol=pos,stem=S]):member(S,[contract]),_/'CC',?(w(then)), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].
*/
question(2,b,ii): rule(1,2,1):: complete ==> [c(np:[stem=V]):member(V,[valve,flap,these,this]),?(w(then)),c(vg:[pol=pos,stem=S]):member(S,[contract]),_/'CC',?(w(then)), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].

question(2,b,ii): rule(1,'2_1',1):: complete ==> [_/'PRP',?(w(then)),c(vg:[pol=pos,stem=S]):member(S,[contract]),_/'CC',?(w(then)), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].

%3.	two flaps (which) (then) close/shut/lock
%4.	(forces) valve(s)/they/it/these to (then) close/shut/lock
%5.	valve(s)/they/it/these (it/they) (then) syn(snap/snaps/slams/back/squeeze) shut/close/lock
%6.	valve(s)/they/it/these are forced [to shut/close]/[shut/closed/locked]

/*
question(2,b,ii): rule(1,3,1):: complete ==> [(c(np:[stem=V]):member(V,[valve,flap,these]);_/'PRP'),?(_/'WDT'),?(w(then)),?(c(vg:[pol=pos,stem=O]):member(O,[force])),?(w(W):member(W,[snap,snaps,slams,back,squeeze,squeezes])), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].
*/

question(2,b,ii): rule(1,3,1):: complete ==> [c(np:[stem=V]):member(V,[valve,flap,these]),?(_/'WDT'),?(w(then)),?(c(vg:[pol=pos,stem=O]):member(O,[force])),?(w(W):member(W,[snap,snaps,slams,back,squeeze,squeezes])), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].


question(2,b,ii): rule(1,'3_1',1):: complete ==> [_/'PRP',?(_/'WDT'),?(w(then)),?(c(vg:[pol=pos,stem=O]):member(O,[force])),?(w(W):member(W,[snap,snaps,slams,back,squeeze,squeezes])), (c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].



%7.	(it) close/closes/shut/lock [the valves/flaps/them/it]

/*
question(2,b,ii): rule(1,4,1):: complete ==>[(c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock])), (c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')].
*/

question(2,b,ii): rule(1,4,1):: complete ==>[c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]), (c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')].

question(2,b,ii): rule(1,'4_1',1):: complete ==>[w(G):member(G,[close,shut,lock]), (c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')].

% 8.	close/shut (tightly together)  
% 9.	are (forced) closed/shut/locked
%10.	remain/stay (then) shut/closed/locked

/*
question(2,b,ii): rule(1,5,1):: complete ==> [(c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock]); w(G):member(G,[close,shut,lock]))].
*/


question(2,b,ii): rule(1,5,1):: complete ==> [c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock])].

question(2,b,ii): rule(1,'5_1',1):: complete ==> [w(G):member(G,[close,shut,lock])].

%11.	valve(s)/they/it/these would (then) be pushed/joined together/back
% 15.	valve(s)/they/it/these are (then) pushed back and join, closing off the atria

/*
question(2,b,ii): rule(1,6,1):: complete ==> [(c(np:[stem=V]):member(V,[valve,flap,these]);_/'PRP'),?(w(then)),c(vg:[pol=pos,stem=P, passive=yes]):member(P,[push,join]),w(T):member(T,[together,back])].
*/

question(2,b,ii): rule(1,6,1):: complete ==> [c(np:[stem=V]):member(V,[valve,flap,these]),?(w(then)),c(vg:[pol=pos,stem=P, passive=yes]):member(P,[push,join]),w(T):member(T,[together,back])].


question(2,b,ii): rule(1,'6_1',1):: complete ==> [_/'PRP',?(w(then)),c(vg:[pol=pos,stem=P, passive=yes]):member(P,[push,join]),w(T):member(T,[together,back])].

%12.	(by) [being pushed/moved/locked together]/[locking/joining/moving/move/come together]
%13.	(the flaps of) the valve(s) come/push/move/lock/join together

/*
question(2,b,ii): rule(1,7,1):: complete ==> [(c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock,join,move,come,push]); w(G):member(G,[close,shut,lock,join,move,come,push])),w(together)].
*/

question(2,b,ii): rule(1,7,1):: complete ==> [c(vg:[pol=pos,stem=F]):member(F,[close,shut,lock,join,move,come,push]),w(together)].


question(2,b,ii): rule(1,'7_1',1):: complete ==> [w(G):member(G,[close,shut,lock,join,move,come,push]),w(together)].

%14.	pushed/push/hold/holds (them/these/the valve(s)/it) closed/shut/down

/*
question(2,b,ii): rule(1,8,1):: complete ==> [(c(vg:[pol=pos,stem=F]):member(F,[push,hold,move,join]);w(S):member(S,[push,hold,move,join])), ?((c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')),w(C):member(C,[close,closed,shut,down])].
*/

question(2,b,ii): rule(1,8,1):: complete ==> [c(vg:[pol=pos,stem=F]):member(F,[push,hold,move,join]), ?((c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')),w(C):member(C,[close,closed,shut,down])].

question(2,b,ii): rule(1,'8_1',1):: complete ==> [w(S):member(S,[push,hold,move,join]), ?((c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')),w(C):member(C,[close,closed,shut,down])].
% equivalence class 2

%[forced shut by pressure of blood]

%1.	(high) blood pressure (in the ventricles)
% 2.	(by) blood pressure
%6.	a high pressure is created
question(2,b,ii): rule(2,1,1)::complete ==> [c(np:[stem=pressure,mods=L]):(member(G,L),member(G,[blood,high,big]))].


% 3.	(by) (the) pressure of/from (the) blood
question(2,b,ii): rule(2,2,1)::complete ==> [c(np:[stem=pressure]),w(O):member(O,[from,of]),c(np:[stem=blood])].

%4.	blood is at pressure
question(2,b,ii): rule(2,3,1)::complete ==> [c(np:[stem=blood]),c(vg:[pol=pos,stem=_M]),_/'IN',c(np:[stem=pressure])].

%5.	pressure is put/made/pushed on them/it/valve(s)/flap(s)

question(2,b,ii): rule(2,4,1)::complete ==> [c(np:[stem=pressure]), c(vg:[pol=pos,passive=yes,stem=P]):member(P,[put,make,push]),_/'IN', (c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP')].


% equivalence class 3
% [tendons stop them (from) inverting]

question(2,b,ii): rule(3,1,1)::complete ==> [c(np:[stem=tendon]),(c(vg:[stem=S,pol=pos]):member(S,[stop,prevent]);w(E):member(E,[stop,prevent])), (c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP'),?(w(from)),w(I):member(I,[inverting])].

% tendons don't allow them to invert/inverting
question(2,b,ii): rule(3,2,1)::complete ==> [c(np:[stem=tendon]),c(vg:[stem=S,pol=neg]):member(S,[allow,permit,let]),(c(np:[stem=V]):member(V,[valve,flap,these,this]);_/'PRP'), (c(vg:[stem=invert,pol=pos]);w(I):member(I,[inverting,invert]))].
					    
full_mark(question(2,b,ii),2).