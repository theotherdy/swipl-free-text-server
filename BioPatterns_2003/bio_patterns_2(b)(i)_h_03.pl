% rules for question 2(b)(i) higher tier paper 2003

%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).


/*-----------------------------------------------
 question : write down the job of these valves
(two sets of valves are shown in the diagram)
% full mark is 1
-------------------------------------------------*/
% equivalence class 1

% to prevent backflow
%1.	[A= (to) Syn(prevent)/Syn(stop)] (the/any/a) [C=backflow/back flow/ back-flow/backward(s) flow/backflowing/back flowing]
% 1'. .... there from being a backflow
% due to some mistakes in tagging flow/NN and flow/VG we decided to specify them as words

/*
question(2,b,i): rule(1,1,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,back-flow,backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].  

*/

question(2,b,i): rule(1,1,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),?(w(_)),?(w(blood)),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

question(2,b,i): rule(1,'1_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),?(w(blood)),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

% [J=neg(Syn(allow/let/permit))] (the/any/a) [C=backflow/back flow/ back-flow/backward(s) flow/backflowing/back flowing]
% 1'. ... there from being a backflow

/*
question(2,b,i): rule(1,2,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,back-flow,backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].  
*/

question(2,b,i): rule(1,2,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]),?(w(blood)),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

question(2,b,i): rule(1,'2_1',1):: complete ==> [w(not),w(J):member(J,[allow,permit,let,allowing,permitting,letting]),?(w(blood)),?(w(there)),?(w(from)),?(w(being)),?(_/'DT'),w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

% 2. A (the/any) blood/it (in/from ventricles) (from) (being) [B=syn(flows/flowing/flown/to flow/moving/moved/to move/going/gone/to go/circulating/circulated/to circulate/pushing/pushed/to push/pumping/pumped/to pump/travel/transported/entering/re-entering/returning/retreating)] back/backwards

/*
question(2,b,i): rule(1,3,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])), w(B):member(B,[back,backward,backwards])].
*/

/*
question(2,b,i): rule(1,3,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),(c(vg:[pol=pos,stem=H,adv=N]):(member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]), member(N,[back,backward,backwards]));w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat, come,coming,flowing,moving,going,circulating,pushing,pumping,travelling,transporting,entering,'re-entering',returning,retreating])), ?(w(B):member(B,[back,backward,backwards]))].
% optional at the end for completion -- these should be written in 2 rules
*/

question(2,b,i): rule(1,3,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),c(vg:[pol=pos,stem=H,adv=N]):(member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]),member(N,[back,backward,backwards]))].


question(2,b,i): rule(1,'3_1',1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat, come,coming,flowing,moving,going,circulating,pushing,pumping,travelling,transporting,entering,'re-entering',returning,retreating]), w(B):member(B,[back,backward,backwards])].

question(2,b,i): rule(1,'3_2',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),c(vg:[pol=pos,stem=H,adv=B]):(member(H,[flow,move,go,circulate,come,push,pump,travel,transport,enter,'re-enter',return,retreat]),member(B,[back,backward,backwards]))].


question(2,b,i): rule(1,'3_3',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come,coming,flowing,moving,going,circulating,pushing,pumping,travelling,transporting,entering,'re-entering',returning,retreating]), w(B):member(B,[back,backward,backwards])].
% J ... (same as above)

/*
question(2,b,i): rule(1,4,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),w(B):member(B,[back,backward,backwards])].
*/

% again we need to split this rule into 2 because the adverb is included
% sometimes in the verb
/*
question(2,b,i): rule(1,4,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),?(w(_)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),w(B):member(B,[back,backward,backwards])].
*/

question(2,b,i): rule(1,4,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),?(w(_)),c(vg:[pol=pos,stem=H,adv=B]):(member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]),member(B,[back,backward,backwards]))].


question(2,b,i): rule(1,'4_1',1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),?(w(_)),w(K):member(K,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),w(B):member(B,[back,backward,backwards])].


question(2,b,i): rule(1,'4_2',1):: complete ==> [w(not),w(J):member(J,[allow,permit,let,enable,allowing,letting,permitting,enabling]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),?(w(_)),c(vg:[pol=pos,stem=H,adv=B]):(member(H,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),member(B,[back,backward,backwards]))].


question(2,b,i): rule(1,'4_3',1):: complete ==> [w(not),w(J):member(J,[allow,permit,let,enable,allowing,permitting,letting,enabling]),(c(np:[stem=blood]);_/'PRP'),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),?(w(being)),?(w(_)),w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]),w(B):member(B,[back,backward,backwards])].
% 3. A (the) flow (of blood) back/backwards 

/*
question(2,b,i): rule(1,5,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].
*/
question(2,b,i): rule(1,5,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].

question(2,b,i): rule(1,'5_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].


 % J .. (same as above)

/*
question(2,b,i): rule(1,6,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].
*/

question(2,b,i): rule(1,6,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].

question(2,b,i): rule(1,'6_1',1):: complete ==> [w(not),w(J):member(J,[allow,permit,let,enable,allowing,permitting,letting,enabling]),c(np:[stem=flow]),?(w(of)),?(w(blood)),w(B):member(B,[back,backward,backwards])].

%4. A (the) blood/it (from) B (in) (the) syn(wrong/false) direction/way

/*
question(2,b,i): rule(1,7,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].
*/

question(2,b,i): rule(1,7,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,come,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].

question(2,b,i): rule(1,'7_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,come,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,come,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].


% J ... (same as above)

/*
question(2,b,i): rule(1,8,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,keep,send,push,move,circulate]);w(J):member(J,[allow,permit,let,keep, send,push,move,circulate])),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].
*/

question(2,b,i): rule(1,8,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,keep,send,push,move,circulate,make,enable]),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].

question(2,b,i): rule(1,'8_1',1):: complete ==> [w(not),w(J):member(J,[allow,permit,let,keep, send, push,move,circulate,make,enable,allowing,permitting,letting,keeping,sending,pushing,moving,circulating,making,enabling]),(c(np:[stem=blood]);_/'PRP'),?(w(from)), (c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].

% 4'. Negation of the last two rules! not


% 5. allow/let/keep/send/push/move/circulate (the) blood/it (flow NN) (to) (B) (in) (the) (only) syn(right/correct)/one/1 (particular) direction/way
% 5'. allow/keep/send/push/move/circulate (the) blood/it (flow) (to) (B) (in) (the)syn(same) direction/way


/*
question(2,b,i): rule(1,9,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,let,permit,keep,send,push,move,circulate]);w(J):member(J,[allow,permit,let,keep,send,push,move,circulate])),((c(np:[stem=blood]);_/'PRP');c(np:[stem=flow])),?(_/'IN'),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].
*/

/*
question(2,b,i): rule(1,9,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[allow,let,permit,keep,send,push,move,circulate,make,enable]),((c(np:[stem=blood]);_/'PRP');c(np:[stem=flow])),?(_/'IN'),?((c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]))),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].
*/


question(2,b,i): rule(1,9,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[allow,let,permit,keep,send,push,move,circulate,make,enable]),?(w(_)),((c(np:[stem=blood]);(_/'PRP';w(blood)));c(np:[stem=flow])),?(_/'IN'),?(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].

/*
question(2,b,i): rule(1,'9_1',1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[allow,let,permit,keep,send,push,move,circulate,make,enable]),(c(np:[stem=blood]);_/'PRP'),?((c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]))),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(one,L))].
*/

/*
% when i write ?((c(vg:...); w(K) ...)) it does not work - an edge disappears
% and I'll be looking for the right category but starting at the wrong edge
% hence I changed this into the next 9_2 rule   -- i did the same for rule 9 above
question(2,b,i): rule(1,'9_2',1):: complete ==> [w(J):member(J,[allow,permit,let,keep,send,push,move,circulate,make,enable]),((c(np:[stem=blood]);_/'PRP');c(np:[stem=flow])),?(_/'IN'),?((c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]))),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].
*/
question(2,b,i): rule(1,'9_2',1):: complete ==> [w(J):member(J,[allow,permit,let,keep,send,push,move,circulate,make,enable,allowing,permitting,letting,keeping,sending,moving,pushing,circulating,making,enabling]),?(w(_)),((c(np:[stem=blood]);_/'PRP');(w(blood);c(np:[stem=flow]))),?(_/'IN'),?(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].

question(2,b,i): rule(1,'9_3',1):: complete ==> [w(J):member(J,[allow,permit,let,keep,send,push,move,circulate,make,enable,allowing,permitting,letting,keeping,sending,moving,pushing,circulating,making,enabling]),?(w(_)),((c(np:[stem=blood]);_/'PRP');(w(blood);c(np:[stem=flow]))),?(_/'IN'),?(w(H):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),?(w(_)),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].

% 5''. Negation: not  -- see rule 1,8,1

%6. no C
question(2,b,i): rule(1,10,1):: complete ==> [w(no), w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

%7. no blood C
question(2,b,i): rule(1,11,1):: complete ==> [w(no), w(blood),w(G):member(G,[backflow,'back-flow',backward,backwards,back,backflowing]),?(w(U):member(U,[flow,flowing]))].

% 8. no blood B back/backwards
question(2,b,i): rule(1,12,1):: complete ==> [w(no), w(blood),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])), w(B):member(B,[back,backward,backwards])].

% 8'. no blood B (in) (the) wrong direction
question(2,b,i): rule(1,13,1):: complete ==> [w(no), w(blood),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'),c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].
 
%9. [D=syn(ensure/make sure/keep/make/enable)] (that) (the) blood/it  (only) B (in) (the) (only) syn(right/correct)/one/1 (particular) direction/way
% ... the blood is being pushed ...
 question(2,b,i): rule(1,14,1):: complete ==> [w(V):member(V,[ensure,make,keep,enable,ensuring,making,keeping,enabling]),?(w(sure)),?(w(that)),(c(np:[stem=blood]);_/'PRP'),?(w(only)),(c(vg:[pol=pos,stem=H]):member(H,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'),c(np:[stem=W,mods=L]):(member(W,[direction,way,path]),member(G,[only,right,correct,one,'1',particular,same]),member(G,L))].
					       

%10. D (that) blood does not B (in) more than one way/direction
question(2,b,i): rule(1,15,1):: complete ==> [w(V):member(V,[ensure,make,keep,enable,ensuring,making,keeping,enabling]),?(w(that)),c(np:[stem=blood]), c(vg:[pol=neg,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]),?(_/'IN'),w(more),w(than),c(np:[stem=N,mods=L]):(member(N,[way,direction]),member(G,L),member(G,[one,'1']))].

%11. D (that) blood does not B (in) (the) wrong direction/way
question(2,b,i): rule(1,16,1):: complete ==> [w(V):member(V,[ensure,make,keep,enable,ensuring,making,keeping,enabling]),?(w(that)),c(np:[stem=blood]), c(vg:[pol=neg,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]),?(_/'IN'), c(np:[stem=D,mods=L]):(member(D,[way,direction,path]),member(G,[wrong,false]),member(G,L))].

% 12. syn(control) the direction/way in which the blood B
question(2,b,i): rule(1,17,1):: complete ==> [w(control),c(np:[stem=W]):member(W,[direction,way,path]),?(_/'IN'),?(_/'WDT'),(c(np:[stem=blood]);_/'PRP'),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]))].

%13. A (the) blood/it (from/in ventricles) (from) B (up/upwards) (from the ventricles) (straight back) (into/in) the (left/right/left and right) atria/Atria/atrium 

/*
question(2,b,i): rule(1,18,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].
*/

question(2,b,i): rule(1,18,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);(_/'PRP';w(blood))),?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,comeflowing,moving,travelling,transporting,entering,'re-entering',returning,retreating,coming,going])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),?(_/'CC'),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].
%?(_/'IN')

question(2,b,i): rule(1,'18_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);(_/'PRP'; w(blood))), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come,flowing,moving,travelling,transporting,entering,'re-entering',returning,retreating,coming,going])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),?(_/'CC'),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].

% J .... (same as above)

/*
question(2,b,i): rule(1,19,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].

*/

question(2,b,i): rule(1,19,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].


question(2,b,i): rule(1,'19_1',1):: complete ==> [w(J):member(J,[allow,permit,let,enable,allowing,permitting,letting,enabling]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(w(U):member(U,[up,upward,upwards])), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(straight)),?(w(back)),?(_/'IN'),?(c(np:[stem=L]):member(L,[left,right])),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium'])].


% 14. A (any/the) blood/it (from) B in/into the wrong vessels i.e. back where it came from
% I split the last statement into two

/*
question(2,b,i): rule(1,20,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].
*/


question(2,b,i): rule(1,20,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].

question(2,b,i): rule(1,'20_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].

% J ... (same as above)

/*
question(2,b,i): rule(1,21,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].
*/

question(2,b,i): rule(1,21,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].

question(2,b,i): rule(1,'21_1',1):: complete ==> [w(J):member(J,[allow,permit,let,enable,allowing,permitting,letting,enabling]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(_/'IN'), c(np:[stem=vessel,mods=L]):(member(G,L),member(G,[wrong,false]))].

% A ... (back) where it came from (see rule(1,20,1))

/*
question(2,b,i): rule(1,22,1):: complete ==> [(c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]);w(J):member(J,[prevent,stop])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].
*/

question(2,b,i): rule(1,22,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[prevent,stop]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].

question(2,b,i): rule(1,'22_1',1):: complete ==> [w(J):member(J,[prevent,stop,preventing,stopping]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,come])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].

% J ....(back) where it came from
/*
question(2,b,i): rule(1,23,1):: complete ==> [(c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let]);w(J):member(J,[allow,permit,let])),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].
*/

question(2,b,i): rule(1,23,1):: complete ==> [c(vg:[stem=V,pol=neg]):member(V,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[come,flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].

question(2,b,i): rule(1,'23_1',1):: complete ==> [w(J):member(J,[allow,permit,let,enable]),(c(np:[stem=blood]);_/'PRP'), ?(_/'IN'),?(c(np:[stem=ventricle])),?(w(from)),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])),?(w(back)),w(where),_/'PRP',c(vg:[pol=pos,stem=C]):member(C,[come,flow])].

% 15. D (the) blood B from the atrium/atria into the ventricles and not vice-versa
question(2,b,i): rule(1,24,1):: complete ==> [w(V):member(V,[ensure,make,keep,enable,ensuring,making,keeping,enabling]), (c(np:[stem=blood]);_/'PRP'),(c(vg:[pol=pos,stem=H]):member(H,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]);w(K):member(K,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat])), w(from), ?(c(np:[stem=L]):member(L,[left,right])),c(np:[stem=T]):member(T,[atrium,atria,'Atria','Atrium']),_/'PRP', c(np:[stem=ventricle])].

% let/permit ... blood into the heart one way but not out the same way
question(2,b,i): rule(1,25,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[allow,let,permit,keep,send,push,move,circulate,make,enable]),c(np:[stem=blood]), ?(_/'IN'),?(c(np:[stem=heart])),w(one),w(W):member(W,[way,direction,path]),_/'CC',w(not),w(out),c(np:[stem=K,mods=P]):(member(K,[way,direction,path]),member(same,P))].

% an np with stem=heart is not being formed hence we add 25_1
question(2,b,i): rule(1,'25_1',1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[allow,let,permit,keep,send,push,move,circulate,make,enable]),c(np:[stem=blood]), ?(_/'IN'),?(w(_)),?(w(heart)),w(one),w(W):member(W,[way,direction,path]),_/'CC',w(not),w(out),c(np:[stem=K,mods=P]):(member(K,[way,direction,path]),member(same,P))].

% blood does not flow back
question(2,b,i): rule(1,26,1):: complete ==> [c(np:[stem=blood]),c(vg:[stem=F,pol=neg]):member(F,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),w(B):member(B,[back,backward,backwards])].

% there is no access to the adverb after the verb in the previous rule
% hence we added 26_1

question(2,b,i): rule(1,'26_1',1):: complete ==> [c(np:[stem=blood]),?(w(_)),w(not),w(F):member(F,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),w(B):member(B,[back,backward,backwards])].

question(2,b,i): rule(1,'26_2',1):: complete ==> [c(np:[stem=blood]),w(W):member(W,['doesn\'t','won\'t']),w(F):member(F,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),w(B):member(B,[back,backward,backwards])].

% this could overgenerate but we added it for lack of pronoun resolution

question(2,b,i): rule(1,'26_3',1):: complete ==> [w(not),w(F):member(F,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat,flowing,moving,going,coming,circulating,pushing,pumping,travelling,transporting,entering,'re-entering']),w(B):member(B,[back,backward,backwards])].


question(2,b,i): rule(1,'26_4',1):: complete ==> [w(W):member(W,['doesn\'t','won\'t']),w(F):member(F,[flow,move,go,come,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat]),w(B):member(B,[back,backward,backwards])].


% the blood goes from the atrium into the ventricles (and not vice-versa)
question(2,b,i): rule(1,27,1):: complete ==> [c(np:[stem=blood]),c(vg:[pol=pos,stem=K]):member(K,[flow,move,go,circulate,push,pump,travel,transport,enter,'re-enter',return,retreat, come]),w(from),c(np:[head=A]):member(A,[atrium,atria]),_/'IN',c(np:[stem=ventricle])].

full_mark(question(2,b,i),1).


