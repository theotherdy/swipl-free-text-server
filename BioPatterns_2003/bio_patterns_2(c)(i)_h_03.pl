% rules for question 2(c)(i) higher tier paper 2003

%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).


/*----------------------------------------------------------------
 question : Describe how William Harvey's ideas on circulation
 differed from Galen's?

% full mark is 2
-----------------------------------------------------------------*/
% equivalence class 1

%[observed blood flowed/ circulated round the body/ flowed in one direction]
% ignore circulation unless qualified
%1.	blood carried circulation system
question(2,c,i): rule(1,1,1)::complete ==> [c(np:[stem=blood]),(c(vg:[stem=C]):member(C,[carry]); w(V):member(V,[carry])), c(np:[stem=system,mods=P]):(member(G,P),member(G,[circulation,circulatory]))].

% 2.	blood circulated (continuously)
question(2,c,i): rule(1,2,1)::complete ==> [c(np:[stem=blood]), (c(vg:[pol=pos,stem=C]):member(C,[circulate]);w(J):member(J,[circulate]))]. 

%3.	one/1 circulation around/round the body
question(2,c,i): rule(1,3,1)::complete ==> [c(np:[stem=circulation,mods=L]):(member(G,L),member(G,[one,'1'])),w(A):member(A,[round,around]),c(np:[stem=body])].

% 4a.	(blood) (can) (only) (to) flow/flowed/circulated/travel/move/cycle/go/went/transport (in) (only/the) one/same direction/way
question(2,c,i): rule(1,'4a',1)::complete ==> [c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]),?(_/'IN'),?(w(only)),c(np:[stem=W,mods=L]):(member(W,[direction,way]),member(G,[one,'1',same]),member(G,L))].

% 4b. (blood) (can) (only) (to) flow/flowed/circulated/travel/move/cycle/go/went/transport (in) (only/the) one/same direction/way
question(2,c,i): rule(1,'4b',1)::complete ==>[w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass]),?(_/'IN'),?(w(only)),c(np:[stem=W,mods=L]):(member(W,[direction,way]),member(G,[one,'1',same]),member(G,L))].

%5.	blood flow/circulation (is/was) (only) (a) one-way/one way/direction/directional
question(2,c,i): rule(1,5,1)::complete ==> [c(np:[stem=F]):member(F,[flow,circulation]), c(vg:[pol=pos,stem=_O]),?(w(only)),?(w(a)),(w(U):member(U,['one-way','one-direction']);c(np:[stem=D,mods=Y]):(member(D,[direction,way]),member(G,Y),member(G,[one,'1'])))].

% 6.	flow/circulation of blood is/was (a) one-way/one way/direction
question(2,c,i): rule(1,6,1)::complete ==> [c(np:[stem=F]):member(F,[flow,circulation]),w(of),w(blood), c(vg:[pol=pos,stem=_O]),?(w(only)),?(w(a)),(w(U):member(U,['one-way','one-direction']);c(np:[stem=D,mods=Y]):(member(D,[direction,way]),member(G,Y),member(G,[one,'1'])))].


%7a.	cycle/circulate/move/go/flow/travel from your heart, round the body and back to your heart
question(2,c,i): rule(1,'7a',1)::complete ==> [c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]),w(from),c(np:[stem=heart]),?(','/_),w(W):member(W,[round,around]),c(np:[stem=body]),?(','/_), _/'CC',w(back),?(_/'IN'),c(np:[stem=heart])].

%7b.	cycle/circulate/move/go/flow/travel from your heart, round the body and back to your heart
question(2,c,i): rule(1,'7b',1)::complete ==> [w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass]), w(from),c(np:[stem=heart]),?(','/_),w(W):member(W,[round,around]),c(np:[stem=body]),?(','/_), _/'CC',w(back),?(_/'IN'),c(np:[stem=heart])].

					       

%8.	blood (in the body) (was) circulated, and was re-used and pumped by the heart
question(2,c,i): rule(1,8,1)::complete ==> [c(np:[stem=blood]),?(_/'IN'),?(c(np:[stem=body])),(c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]);w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass])),?(','/_), ?(_/'CC'),?(w(then)), (c(vg:[stem=V,pol=pos]):member(V,['re-used']);w(H):member(H,['re-used'])),?(_/'CC'),?(w(then)),(c(vg:[stem=P]):member(P,[pump]);w(Y):member(Y,[pump]))].

%9.	blood in the body was circulated
question(2,c,i): rule(1,9,1)::complete ==> [c(np:[stem=blood]),?(_/'IN'),?(c(np:[stem=body])),(c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]);w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass]))].



%9.	blood circulated round the body
question(2,c,i): rule(1,9,1)::complete ==> [c(np:[stem=blood]),?(_/'IN'),?(c(np:[stem=body])),(c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]);w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass])),w(R):member(R,[round,around]),c(np:[stem=body])].

%10a.	(blood ) (have/had) (to) (is/was/kept) (continually/continuously) pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport (blood) (from the heart) (all the way/all) round/around  ((to/through) the (whole) body)
question(2,c,i): rule(1,'10a',1)::complete ==> [c(vg:[pol=pos,stem=P]):member(P,[pump,flow,travel,move,cycle,circulate,recycle,go,transport,pass]),?(c(np:[stem=blood])),?(w(from)),?(c(np:[stem=heart])),?(w(all)),?(c(np:[stem=way])),w(R):member(R,[round,around])].

%10b.	(blood ) (have/had) (to) (is/was/kept) (continually/continuously) pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport (blood) (from the heart) (all the way/all) round/around  ((to/through) the (whole) body)
question(2,c,i): rule(1,'10b',1)::complete ==> [w(F):member(F,[pump,flow,travel,move,cycle,recycle,go,transport,circulate,pass]),?(c(np:[stem=blood])),?(w(from)),?(c(np:[stem=heart])),?(w(all)),?(c(np:[stem=way])),w(R):member(R,[round,around])].

% maria for candidate 60
%10c.	(blood ) (have/had) (to) (is/was/kept) (continually/continuously) pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport (blood) (from the heart) (all the way/all) round/around  ((to/through) the (whole) body)
question(2,c,i): rule(1,'10c',1)::complete ==> [c(np:[stem=blood]),c(vg:[pol=pos,stem=P]):member(P,[pump,flow,travel,move,cycle,circulate,recycle,go,transport,pass]),?(w(from)),?(c(np:[stem=heart])),?(w(all)),?(c(np:[stem=way])),?(w(R):member(R,[round,around]))].

% maria
%10d.	(blood ) (have/had) (to) (is/was/kept) (continually/continuously) pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport (blood) (from the heart) (all the way/all) round/around  ((to/through) the (whole) body)
question(2,c,i): rule(1,'10d',1)::complete ==> [c(np:[stem=blood]),w(F):member(F,[pump,flow,travel,move,cycle,recycle,go,transport,circulate,pass]),?(w(from)),?(c(np:[stem=heart])),?(w(all)),?(c(np:[stem=way])),w(R):member(R,[round,around])].


%11a.	(blood ) (had/have) (to)  pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport in a continuous (circulatory) cycle/system
question(2,c,i): rule(1,'11a',1)::complete ==> [c(vg:[pol=pos,stem=P]):member(P,[pump,flow,travel,move,cycle,circulate,recycle,go,transport,pass]),?(_/'IN'),c(np:[stem=S]):member(S,[cycle,system])].

%11b.	(blood ) (had/have) (to)  pumped/pumping/flow/flows/flowed/travel/move/cycle/recycle/go/transport in a continuous (circulatory) cycle/system
question(2,c,i): rule(1,'11b',1)::complete ==> [w(F):member(F,[pump,flow,travel,move,cycle,recycle,go,transport,circulate,pass]),?(_/'IN'),c(np:[stem=S]):member(S,[cycle,system])].

%12a.	pumped/pumping/pumps/circulate/flow/flowed/travel/move/cycle/recycle/go/transport blood (all) around/round (the body)
question(2,c,i): rule(1,'12a',1)::complete ==>[c(vg:[pol=pos,stem=P]):member(P,[pump,flow,travel,move,cycle,circulate,recycle,go,transport,pass]),?(c(np:[stem=blood])),?(w(all)),w(R):member(R,[round,around])].

%12b.	pumped/pumping/pumps/circulate/flow/flowed/travel/move/cycle/recycle/go/transport blood (all) around/round (the body)
question(2,c,i): rule(1,'12b',1)::complete ==> [w(F):member(F,[pump,flow,travel,move,cycle,recycle,go,transport,circulate,pass]),?(c(np:[stem=blood])),?(w(all)),w(R):member(R,[round,around])].

%13a.	(blood) (was) Circulate/circulated (continuously) round/around to/through the (whole) body
question(2,c,i): rule(1,'13a',1)::complete ==> [c(vg:[pol=pos,stem=circulate]),?(w(continously)),w(V):member(V,[round,around]),_/'IN',c(np:[stem=body])].

%13b.	(blood) (was) Circulate/circulated (continuously) round/around to/through the (whole) body
question(2,c,i): rule(1,'13b',1)::complete ==> [w(circulate),?(w(continously)),w(V):member(V,[round,around]),_/'IN',c(np:[stem=body])].

%14.	(the) flow/pumping/circulation/travelling of blood (from the heart) (all the way) round/around  ((to/through) the (whole) body) 
question(2,c,i): rule(1,14,1)::complete ==>[c(np:[stem=F]):member(F,[flow,pumping,circulation,travelling]),?(w(of)),c(np:[stem=blood]),?(w(from)),?(c(np:[stem=heart])),?(w(all)),?(c(np:[stem=way])),w(G):member(G,[round,around])].

%15.	blood is recycled/X and/CC pumped around/round ((to) the body)
question(2,c,i): rule(1,15,1)::complete ==> [c(np:[stem=blood]),c(vg:[pol=pos,stem=_X]),_/'CC',c(vg:[pol=pos,stem=P]):member(P,[pump,push,transport,move,flow,travel,move,cycle,circulate,recycle,go,pass]),w(I):member(I,[round,around])].

%16a.	making a complete circuit of the whole body
question(2,c,i): rule(1,'16a',1)::complete ==> [c(vg:[pol=pos,stem=O]):member(O,[make]),c(np:[stem=C,mods=L]):(member(C,[circuit,cycle,system]);member(G,[complete,continous]),member(G,L))].

%16b.	making a complete circuit of the whole body
question(2,c,i): rule(1,'16b',1)::complete ==> [w(W):member(W,[make]),c(np:[stem=C,mods=L]):(member(C,[circuit,cycle,system]);member(G,[complete,continous]),member(G,L))].

%17.	blood around/round the body
question(2,c,i): rule(1,17,1)::complete ==> [c(np:[stem=blood]),w(I):member(I,[around,round]),c(np:[stem=body])].
					      
%18a.	pumped the same blood around
question(2,c,i): rule(1,'18a',1)::complete ==> [c(vg:[pol=pos,stem=P]):member(P,[pump,push,transport,move,flow,travel,move,cycle,circulate,recycle,go,pass]),c(np:[stem=blood,mods=L]):member(same,L),w(E):member(E,[round,around])].

%18b.	pumped the same blood around
question(2,c,i): rule(1,'18b',1)::complete ==> [w(G):member(G,[pump,push,transport,move,flow,travel,move,cycle,circulate,recycle,go,pass]),c(np:[stem=blood,mods=L]):member(same,L),w(E):member(E,[round,around])].

%19.	circulation of blood was one continuous/complete system/circuit/cycle
question(2,c,i): rule(1,19,1)::complete ==> [c(np:[stem=F]):member(F,[flow,pumping,circulation,travelling]),?(w(of)),c(np:[stem=blood]),c(vg:[pol=pos,stem=_P]),c(np:[stem=C,mods=L]):(member(C,[system,circuit,cycle]),member(G,[continous,complete]),member(G,L))].

% 20.	from the heart (,) to the lungs (&/and) (then) (back) to the heart [[[[check does it go to the body before going back to the heart again ..in this case : from the heart (,) (to the lungs) (to the body)  (&/and) (then) (back) to the heart ]]]]
%20a.	from the heart (/PNCT) (and/&) back to the heart
question(2,c,i): rule(1,20,1)::complete ==>[w(from),c(np:[stem=heart]),','/_,?(_/'IN'),?(c(np:[stem=lung])),?(_/'IN'),?(c(np:[stem=body])),?(_/'CC'),?(w(then)),w(back),w(to),c(np:[stem=heart])]. 


%21. left side of the heart (, all the way around the body and then) back to the right side of the heart
question(2,c,i): rule(1,21,1)::complete ==>[c(np:[stem=side]),w(of),c(np:[stem=heart]),?(','/_),?(w(all)),c(np:[stem=way]),w(W):member(W,[around,round]),c(np:[stem=body]),?(_/'CC'),?(w(then)),w(back),w(to),c(np:[stem=side]),w(of),c(np:[stem=heart])].

%22. Harvey believed the blood had to go to the heart then to the lungs to become oxygenated then back to the heart to be pumped around the body
question(2,c,i): rule(1,22,1)::complete ==> [c(np:[stem=blood]),?(c(vg:[pol=pos,stem=have])),(c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]);w(E):member(E,[flow,circulate,travel,move,cycle,go,transport,pass])),?(_/'IN'),c(np:[stem=heart]),?((_/'CC';','/_)),?(w(then)),_/'IN',c(np:[stem=lung]),?(c(vg:[pol=pos,stem=_I])),?(w(oxygenated)), ?((_/'CC';','/_)),w(then),w(back),_/'IN',c(np:[stem=heart])].

%23.  Harvey believed the two sides of the heart were separate.
question(2,c,i): rule(1,23,1)::complete ==> [c(np:[stem=side,mods=L]):(member(G,[two,'2']),member(G,L)),w(of), c(np:[stem=heart]),c(vg:[pol=pos,stem=S]):member(S,[separate])].

% equivalence class 2
%[realised that different vessels carried blood]
question(2,c,i): rule(2,1,1)::complete ==>[c(np:[stem=vessel,mods=L]):(member(G,[different,various]),member(G,L)),(c(vg:[pol=pos,stem=V]):member(V,[carry]);w(E):member(E,[carry])),c(np:[stem=blood])].

%1.(blood) vessels like/such as arteries and veins
question(2,c,i): rule(2,2,1)::complete ==>[c(np:[stem=vessel]),w(L):member(L,[like,such]),?(w(as)),c(np:[stem=N]):member(N,[artery,vein])].
					  
%2.	arteries/veins carry/transport/pump (oxygenated/deoxygenated/o and deo) blood
question(2,c,i): rule(2,3,1)::complete ==> [c(np:[stem=N]):member(N,[artery,vein]),(c(vg:[pol=pos,stem=P]):member(P,[carry,transport,pump]);w(Q):member(Q,[carry,transport,pump])),?(w(_)),c(np:[stem=blood])].

%3.	blood (was) carried/transported/pumped by arteries/veins
question(2,c,i): rule(2,4,1)::complete ==> [c(np:[stem=blood]),c(vg:[pol=pos,passive=yes,stem=P]):member(P,[carry,transport,pump]),w(by),c(np:[stem=A]):member(A,[artery,vein])]. 

%4.	away from the heart by arteries and carried back to the heart by veins
question(2,c,i): rule(2,5,1)::complete ==> [w(V):member(V,[away,distant]),w(from),c(np:[stem=heart]),w(by),c(np:[stem=artery]),?(','/_),?(_/'CC'),c(vg:[pol=pos,passive=yes,stem=P]):member(P,[carry,transport,pump]),?(w(back)),w(to),c(np:[stem=heart])].

%5.	different types of blood vessels (? 33,75)
question(2,c,i): rule(2,6,1)::complete ==> [c(np:[stem=T,mods=L]):(member(T,[type,kind]),member(G,[different,various]),member(G,L)),w(of),c(np:[stem=vessel])].


%5.	different  vessels (168)
question(2,c,i): rule(2,6,1)::complete ==> [w(different),c(np:[stem=vessel])].


%6.	flowed/carried/transported/travelled/pumped/move/circulated from the heart in different vessels
question(2,c,i): rule(2,'7a',1)::complete ==> [c(vg:[pol=pos,stem=V]):member(V,[flow,carry,transport,travel,pump,move,circulate,pass]),w(from),c(np:[stem=heart]),_/'IN', c(np:[stem=vessel,mods=L]):(member(G,[different,various]),member(G,L))].

%6.	flowed/carried/transported/travelled/pumped/move/circulated from the heart in different vessels
question(2,c,i): rule(2,'7b',1)::complete ==> [w(E):member(E,[flow,carry,transport,travel,pump,move,circulate,pass]),w(from),c(np:[stem=heart]),_/'IN', c(np:[stem=vessel,mods=L]):(member(G,[different,various]),member(G,L))].

%7.	different vessels in which blood flowed
question(2,c,i): rule(2,8,1)::complete ==> [c(np:[stem=vessel,mods=L]):(member(G,[different,various]),member(G,L)),_/'IN',_/'WDT', c(np:[stem=blood]),(c(vg:[stem=F]):member(F,[flow,travel,move,go,pass]);w(J):member(J,[flow,travel,move,go,pass]))].

%8.	(blood flowed) (the ) arteries, capillaries and veins (? 17, 79,81…)  (any other combination - in pairs also) / [(the) veins and/to/& arteries/arterial] /[capillaries and veins and arteries] /[arteries and/&/to veins]
question(2,c,i): rule(2,'9a',1)::complete ==> [c(np:[stem=V]):member(V,[artery,capillary,vein]),?(','/_),c(np:[stem=J]):member(J,[artery,capillary,vein])].


%8.	(blood flowed) (the ) arteries, capillaries and veins (? 17, 79,81…)  (any other combination - in pairs also) / [(the) veins and/to/& arteries/arterial] /[capillaries and veins and arteries] /[arteries and/&/to veins]
question(2,c,i): rule(2,'9b',1)::complete ==> [c(np:[stem=V]):member(V,[artery,capillary,vein]),?(_/'CC'),c(np:[stem=J]):member(J,[artery,capillary,vein])].



%8.	(blood flowed) (the ) arteries, capillaries and veins (? 17, 79,81…)  (any other combination - in pairs also) / [(the) veins and/to/& arteries/arterial] /[capillaries and veins and arteries] /[arteries and/&/to veins]
question(2,c,i): rule(2,'9b',1)::complete ==> [c(np:[stem=network,mods=M]):member(capilliary,M)].


% equivalence class 3
%[observed the existence of valves in veins]

%1.	within veins, valves were situated
question(2,c,i): rule(3,1,1)::complete ==> [_/'IN',c(np:[stem=vein]),?(','),c(np:[stem=valve]),c(vg:[pol=pos,stem=S,passive=yes]):member(S,[situate,contain])].

% 2.	(existence of ) valves in/within veins
question(2,c,i): rule(3,2,1)::complete ==> [c(np:[stem=valve]),_/'IN',c(np:[stem=vein])].
					    
%3.	veins contained valves
question(2,c,i): rule(3,3,1)::complete ==> [c(np:[stem=vein]),(c(vg:[pol=pos,stem=C]):member(C,[contain]);w(I):member(I,[contain])),c(np:[stem=valve])].

% equivalence class 4
%[predicted the existence of capillaries]
% 1.	(there) were/to be/be (microscopic) capillaries (in the body)

question(2,c,i): rule(4,1,1)::complete ==> [c(np:[stem=there]),w(A):member(A,[were,are,be]),?(w(to)),?(w(be)),?(_/'JJ'),c(np:[stem=capillary])].

%2.	existence/presence of (microscopic) capillaries
question(2,c,i): rule(4,2,1)::complete ==> [c(np:[stem=E]):member(E,[existence,presence]),?(w(of)),c(np:[stem=capillary])].

%3.	capillaries were/are (already) present/there
question(2,c,i): rule(4,3,1)::complete ==> [c(np:[stem=capillary]), w(W):member(W,[are,were]),?(w(already)),w(J):member(J,[present,there])].

% 4.	discovered/proposed/predicted/suggested (the idea of) (microscopic) capillaries
question(2,c,i): rule(4,4,1)::complete ==> [c(vg:[pol=pos,stem=V]):member(V,[discover,propose,predict,suggest]),?(c(np:[stem=idea])),?(w(of)),c(np:[stem=capillary])].

%5.	blood passed/flowed/travelled/moved through (small/microscopic) capillaries 
question(2,c,i): rule(4,5,1)::complete ==> [c(np:[stem=blood]), c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,travel,move,cycle,go,transport,pass]),_/'IN',c(np:[stem=capillary])].

%6.	capillaries joined arteries to veins (check the answers that have this in eq. class 2)
question(2,c,i): rule(4,6,1)::complete ==>[c(np:[stem=capillary]),c(vg:[pol=pos,stem=U]):member(U,[join,link]),c(np:[stem=artery]),_/'IN',c(np:[stem=vein])].

%7.	(linked by ) (now known as) (microscopic) capillaries (cand 81, 175,178)
% too general -- it may overgenerate
question(2,c,i): rule(4,7,1)::complete ==>[c(np:[stem=capillary])].


% equivalence class 5
%[realised that blood did not pass directly from one side (to the other/another) of the heart to another/ double circulation]

question(2,c,i): rule(5,1,1)::complete ==>[c(np:[stem=blood]),c(vg:[pol=neg,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass]),w(D):member(D,[directly,straight,direct]),w(from),c(np:[stem=side]),w(of),c(np:[stem=heart]),w(to),(w(another);c(np:[stem=N,mods=L]):(member(N,[null,side]),member(G,[other,left,right]),member(G,L)))].

% blood did not pass directly from one/the left side to the other (side)/another) of the heart
question(2,c,i): rule(5,'1_1',1)::complete ==>[c(np:[stem=blood]),c(vg:[pol=neg,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass]),w(D):member(D,[directly,straight,direct]),w(from),c(np:[stem=S]):member(S,[side,left,right]),w(to),(w(another);c(np:[stem=N,mods=L]):(member(N,[null,side]),member(G,[other,left,right]),member(G,L)))].

%1.	double circulatory/circulary/circulating [double-circulatory/circulary/circulating] (system/way)
%2.	double circulation/ 'double circulation' (system)
%5.	double pumps left side - oxygenated blood and right - deoxygenated blood (cand 19)
%9.	(the) heart has/was a double pump
% maria added two-way
question(2,c,i): rule(5,2,1)::complete ==>[w(I):member(I,[double,'two-way']),w(J):member(J,[circulatory,circulary,circulating,circulation,pump,pumps])].

question(2,c,i): rule(5,3,1)::complete ==>[w(J):member(J,['double-circulatory','double-circulary','double-circulating','double-pump'])].


%3.	through the heart twice
question(2,c,i): rule(5,4,1)::complete ==>[_/'IN',c(np:[stem=heart]),w(twice)].
					   
%4.	pulmonary and/& systemic circulation
question(2,c,i): rule(5,5,1)::complete ==>[w(pulmonary),_/'CC',c(np:[stem=circulation],mods=L):member(systemic,L)].

%6.	rather than passing straight/direct/directly from the right (side) of the heart to the left side/other side/another
question(2,c,i): rule(5,6,1)::complete ==>[w(rather),w(than),c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass]),w(D):member(D,[directly,straight,direct]),w(from),c(np:[stem=S]):member(S,[side,left,right]),w(of),c(np:[stem=heart]),w(to),(w(another);c(np:[stem=N,mods=L]):(member(N,[null,side]),member(G,[other,left,right]),member(G,L)))]. 

% rather than passing straight/direct/directly from the right to the left side of the heart
question(2,c,i): rule(5,7,1)::complete ==>[w(rather),w(than),c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass]),?(w(D):member(D,[directly,straight,direct])),w(from),c(np:[stem=S]):member(S,[side,left,right]), w(to),(w(another);c(np:[stem=N,mods=L]):(member(N,[null,side]),member(G,[other,left,right]),member(G,L)))]. % of the heart

%7.	blood passed/goes/flowed/would make/went  round/around/through/to the heart twice/two trips ([in one (full) circulation/cycle/lap ]/[for every one complete circuit])
question(2,c,i): rule(5,8,1)::complete ==>[c(np:[stem=blood]),c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass,make]),w(I):member(I,[round,around,through,to]),c(np:[stem=heart]),(w(twice);c(np:[stem=T]):member(T,[trip,journey]))].

%8.	blood passed/goes/flowed/would make/went/passes  two trips/twice round/around/to/through the heart ([in one (full) circulation/cyle/lap]/ [for every one complete circuit])
question(2,c,i): rule(5,9,1)::complete ==>[c(np:[stem=blood]),c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass,make]),(w(twice);c(np:[stem=T]):member(T,[trip,journey])), w(I):member(I,[round,around,through,to]),c(np:[stem=heart])].
					  
%10.	Galen thought that the blood (only) went through the heart once whereas Harvey realised it did (it) twice
question(2,c,i): rule(5,10,1)::complete ==>[w(G):member(G,['Galen',galen]),c(vg:[pol=pos,stem=_P]),?(w(that)),c(np:[stem=blood]),c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass,make]),w(I):member(I,[round,around,through,to]),c(np:[stem=heart]),w(once),w(R):member(R,[while,whereas]),w(U):member(U,['Harvey',harvey]),c(vg:[pol=pos,stem=_]),(_/'PRP';c(np:[stem=blood])), c(vg:[pol=pos,stem=K]):member(K,[do,make]),?(_/'PRP'),w(twice)].

%11.	not as two(, one to the lungs and one to the body) as Harvey believed
question(2,c,i): rule(5,11,1)::complete ==>[w(not),w(as),w(two),?(','),?(w(one)),?(_/'IN'),?(c(np:[stem=lung])),(?(_/'CC');?(','/_)),?(w(one)),?(_/'IN'),?(c(np:[stem=body])),w(A):member(A,[as,like]),w(H):member(H,['Harvey',harvey]),c(vg:[pol=pos,stem=_O])].

%12.	Galen believed that our heart was not a double pump and Harvey did believe this
question(2,c,i): rule(5,12,1)::complete ==> [w(G):member(G,['Galen',galen]),c(vg:[pol=pos,stem=_P]),?(w(that)),c(np:[stem=heart]),c(vg:[pol=neg,stem=K]):member(K,[be,have]),?(w(_)),w(double),w(J):member(J,[circulatory,circulary,circulating,circulation,pump,pumps])].

question(2,c,i): rule(5,13,1)::complete ==> [w(G):member(G,['Galen',galen]),c(vg:[pol=pos,stem=_P]),?(w(that)),c(np:[stem=heart]),c(vg:[pol=neg,stem=K]):member(K,[be,have]),?(w(_)),w(J):member(J,['double-circulatory','double-circulary','double-circulating','double-pump'])].

				    
%14.	Galen believed blood could flow between the two sides of the heart through pores. Harvey believed the two sides were separate.
question(2,c,i): rule(5,14,1)::complete ==> [w(G):member(G,['Galen',galen]),c(vg:[pol=pos,stem=_P]),?(w(that)),c(np:[stem=blood]),(c(vg:[pol=pos,stem=V]):member(V,[flow,circulate,travel,move,cycle,go,transport,pass,make]);w(R):member(R,[flow,circulate,travel,move,cycle,go,transport,pass,make])),w(between),c(np:[stem=side,mods=L]):(member(X,[two,'2']),member(X,L)),w(of),c(np:[stem=heart]),w(T):member(T,[through]),c(np:[stem=pore])].

%15.	the left side of the heart pumps oxygenated blood to the body and the right side of the heart pumps deoxygenated blood to the lungs to be oxygenated
question(2,c,i): rule(5,15,1)::complete ==> [c(np:[stem=side]),w(of),c(np:[stem=heart]),(c(vg:[pol=pos,stem=V]):member(V,[pump,push,transport,move,pass]);w(I):member(I,[pump,push,transport,move,pass])),c(np:[stem=blood]),?(_/'IN'),?(c(np:[stem=body])),(','/_;_/'CC'), c(np:[stem=side]),w(of),c(np:[stem=heart]),(c(vg:[pol=pos,stem=D]):member(D,[pump,push,transport,move,pass]);w(X):member(X,[pump,push,transport,move,pass])),c(np:[stem=blood]),w(to),c(np:[stem=lung])].

full_mark(question(2,c,i),2).





