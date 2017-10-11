% rules for question 4(a)_fur higher tier paper 2003

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
 question : 

% full mark is 1
-----------------------------------------------------------------*/
% equivalence class 1 [for insulation/to keep warm (as temperatures low)]


%1.	(I) insulation/insulating/insulated/insulate(s)/insulator
/*
question(4,'a_fur',0): rule(1,1,1):: complete ==> [(c(np:[stem=I]):member(I,[insulation,insulator]);(c(vg:[pol=pos,stem=P]):member(P,[insulate]);w(insulate)))].
*/

question(4,'a_fur',0): rule(1,1,1):: complete ==> [c(np:[stem=I]):member(I,[insulation,insulator])].

question(4,'a_fur',0): rule(1,'1_neg',1):: reject_ignore_deduct ==> [c(np:[stem=I]):member(I,[air,mountains])].

question(4,'a_fur',0): rule(1,'1_1',1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[insulate])].

question(4,'a_fur',0): rule(1,'1_2',1):: complete ==> [w(I):member(I,[insulate,insulated,insulating,insulates])].
%2.	 warm/warmth/warmer
question(4,'a_fur',0): rule(1,2,1):: complete ==> [w(U):member(U,[warm,warmth,warmer])].
%3.	doesn't/didn't/(isn't) get/become (too/very) cold
question(4,'a_fur',0): rule(1,3,1):: complete ==>[c(vg:[pol=neg,stem=B]):member(B,[get,become,be]),?(w(_T)),w(C):member(C,[cold])].

%4.	survives in cold weather
question(4,'a_fur',0): rule(1,4,1):: complete ==> [c(vg:[pol=pos,stem=L]):member(L,[live,survive]),_/'IN',c(np:[stem=weather,mods=C]):member(cold,C)].

%5.	prevents/stop/reduce/minimize/doesn't allow/less (animal's/goat's/the goat/the animal/goat/animal/his/its/body) [heat loss/release/leaving the body/waste]   /loss/waste/release of heat
question(4,'a_fur',0): rule(1,5,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R,mods=L]):(member(R,[loss,release,waste,escape]),member(heat,L))].

question(4,'a_fur',0): rule(1,'5_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R,mods=L]):(member(R,[loss,release,waste,escape]),member(heat,L))].

question(4,'a_fur',0): rule(1,'5_2',1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[loss,release,waste,escape]),w(of), w(X):member(X,[heat,energy])].

question(4,'a_fur',0): rule(1,'5_3',1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'),w(X):member(X,[heat,energy]), w(from), c(vg:[pol=pos,stem=R]):member(R,[lose,release,waste,escape])].

question(4,'a_fur',0): rule(1,'5_4',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[loss,release,waste,escape]),w(of), w(X):member(X,[heat,energy])].

question(4,'a_fur',0): rule(1,'5_5',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'),w(X):member(X,[heat,energy]), w(from), c(vg:[pol=pos,stem=R]):member(R,[lose,release,waste,escape])].

question(4,'a_fur',0): rule(1,6,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[heat]), c(vg:[stem=L,pol=pos]):member(L,[leave,escape])].

question(4,'a_fur',0): rule(1,'6_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[heat]), c(vg:[stem=L,pol=pos]):member(L,[leave,escape])].

question(4,'a_fur',0): rule(1,7,1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R,mods=L]):(member(R,[loss,release,waste]),member(heat,L))].

%question(4,'a_fur',0): rule(1,'7_1',1):: complete ==> [w(P):member(P,[allow,permit]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R,mods=L]):(member(R,[loss,release,waste]),member(heat,L))].

question(4,'a_fur',0): rule(1,8,1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[heat]), c(vg:[stem=L,pol=pos]):member(L,[leave])].

%question(4,'a_fur',0): rule(1,'8_1',1):: complete ==> [w(P):member(P,[allow,permit]),?(c(np:[stem=A]):member(A,[animal,goat,bucardo,bucardos,his,body])),?(_/'POS'), c(np:[stem=R]):member(R,[heat]), c(vg:[stem=L,pol=pos]):member(L,[leave])].


question(4,'a_fur',0): rule(1,9,1):: complete ==> [c(np:[stem=loss,mods=K]):(member(less,K),member(heat,K))].

question(4,'a_fur',0): rule(1,'9_1',1):: complete ==> [w(less),w(heat)].


%6.	prevents /doesn't allow (body) heat from being lost/released/leave the body/wasted/escaping
question(4,'a_fur',0): rule(1,10,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L));c(np:[stem=heat])),?(w(_/'IN')),c(vg:[pol=pos,stem=O]):member(O,[lose,release,leave,waste,escape])].

question(4,'a_fur',0): rule(1,'10_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L));c(np:[stem=heat])),?(w(_/'IN')),c(vg:[pol=pos,stem=O]):member(O,[lose,release,leave,waste,escape])].

question(4,'a_fur',0): rule(1,11,1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),(c(np:[stem=heat]);c(np:[stem=air,mods=L]):member(L,[hot,warm])),?(w(_/'IN')),c(vg:[pol=pos,stem=O]):member(O,[lose,release,leave,waste,escape])].

%7.	stop/prevent (him/it/the animal/ goat) (from) getting/being/becoming (too/very) cold
%8.	stop/prevent (him/it/the animal/ goat) (from getting/being/becoming) hyperthermia/hyperthermic  (it is the opposite word check!)

question(4,'a_fur',0): rule(1,12,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[get,become]),?(w(_)),w(C):member(C,[cold,hyperthermic])].

question(4,'a_fur',0): rule(1,'12_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize,'Stop','Reduce','Minimize','Prevent']),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[get,become]),?(w(_)),w(C):member(C,[cold,hyperthermic])].


question(4,'a_fur',0): rule(1,13,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[cold,hyperthermic])].

question(4,'a_fur',0): rule(1,'13_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[cold,hyperthermic])].

question(4,'a_fur',0): rule(1,'13_2',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),?(c(vg:[pol=pos])),?(w(_)),w(G):member(G,[cold,hyperthermic])].

question(4,'a_fur',0): rule(1,14,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(_)),?(w(from)),w(C):member(C,[cold,hyperthermia])].

question(4,'a_fur',0): rule(1,'14_1',1):: complete ==> [w(P):member(P,[prevent,stop,reduce,minimize]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),w(C):member(C,[cold,hyperthermia])].

% did not become too/very cold
question(4,'a_fur',0): rule(1,'14_2',1):: complete ==> [c(vg:[pol=neg]),?(w(_)),w(C):member(C,[cold,hyperthermic])].


%13.	doesn't allow the animal/goat (from) getting/being cold
question(4,'a_fur',0): rule(1,'12_1',1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[get,become]),w(C):member(C,[cold,hyperthermic])].
question(4,'a_fur',0): rule(1,'13_1',1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),c(vg:[pol=pos,stem=G]):member(G,[cold,hyperthermic])].
question(4,'a_fur',0): rule(1,'14_1',1):: complete ==> [c(vg:[pol=neg,stem=P]):member(P,[allow,permit]),(c(np:[stem=J]):member(J,[animal,goat,bucardo]);_/'PRP'),?(w(from)),w(C):member(C,[cold,hyperthermia])].

%9.	doesn't lose (body) heat
question(4,'a_fur',0): rule(1,15,1):: complete ==>[c(vg:[pol=neg,stem=L]):member(L,[lose]),(c(np:[stem=heat]);c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L)))].

%10.	trap hot air/heat [leaving the body]/[from the blood vessels close to the skin]
question(4,'a_fur',0): rule(1,16,1):: complete ==>[c(vg:[pol=pos,stem=T]):member(T,[trap]),(c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L));c(np:[stem=heat]))].

question(4,'a_fur',0): rule(1,'16_1',1):: complete ==>[w(T):member(T,[trap,traps,trapping]),(c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L));c(np:[stem=heat]))].

%11.	keep/conserve/preserve/retain (in) (body) heat (in/inside)
question(4,'a_fur',0): rule(1,17,1):: complete ==>[c(vg:[pol=pos,stem=P]):member(P,[keep,conserve,preserve,retain]),?(_/'IN'),(c(np:[stem=heat]);c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L)))].

question(4,'a_fur',0): rule(1,'17_1',1):: complete ==>[w(P):member(P,[keep,'Keep','Conserve',conserve,'Preserve',preserve,retain,'Retain']),?(_/'IN'),(c(np:[stem=heat]);c(np:[stem=air,mods=L]):(member(G,[hot,warm]),member(G,L)))].

%12.	keep/conserve/preserve/retain a good body temperature

question(4,'a_fur',0): rule(1,18,1):: complete ==> [c(vg:[pol=pos,stem=P]):member(P,[keep,conserve,preserve,retain]),c(np:[stem=temperature,mods=L]):(member(G,[good,normal]),member(G,L))].

question(4,'a_fur',0): rule(1,'18_1',1):: complete ==> [w(P):member(P,[keep,conserve,preserve,retain,'Keep','Conserve','Preserve','Retain']),c(np:[stem=temperature,mods=L]):(member(G,[good,normal]),member(G,L))]. 

% patterns abstracted from 'old' questions --with some minor changes
% there  may be some repetition but this does not matter since it is a one equivalence class (1 mark) question
% there are still more alternatives in other questions that can be used

question(4,'a_fur',0): rule(1,19,1):: complete ==>[c(np:[head=H2,mods=[E,L]]):(member(H2,[loss]),member(L,[heat]),member(E,[less,'Less',minimum,minimal]))].

question(4,'a_fur',0): rule(1,20,1):: complete ==>[c(np:[head=L,mods=R]):(member(L,[heat]),reverse(R,[A|_]),member(A,[less,'Less',minimal,minimum])),c(vg:[pol=pos,head=H2]):member(H2,[lost])].

question(4,'a_fur',0): rule(1,21,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[lose]), ?(w(_A)),?(w(_Lot)),?(w(of)), w(heat),?(w(_Energy))].

%question(4,'a_fur',0): rule(1,21,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[lose]), ?(w(_A)),?(w(_Lot)),?(w(of)), w(heat),?(w(_Energy))].

question(4,'a_fur',0): rule(1,22,1):: complete ==>[w(A):member(A,[less,'Less']),c(np:[head=L]):member(L,[heat]),w(H2):member(H2,[lost])].

question(4,'a_fur',0): rule(1,23,1):: complete ==>[w(not),?(w(_A)),?(w(_Lot)),?(w(_Of)),w(heat),c(vg:[pol=pos,stem=lose])].

question(4,'a_fur',0): rule(1,24,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[lose]),?(w(_A)),?(w(_Lot)),?(w(of)),w(heat),?(w(_Energy))].

question(4,'a_fur',0): rule(1,25,1):: complete ==>[w(not),?(w(_A)),?(w(_Lot)),?(w(_Of)),w(heat),c(vg:[pol=pos,head=lost])].

question(4,'a_fur',0): rule(1,26,1):: complete ==> [w(A):member(A,[heat,'Heat']), w(V):member(V,[is,become,becomes]), w(less), w(likely), w(to), w(be),w(lost)].

question(4,'a_fur',0): rule(1,27,1):: complete ==> [w(heat), w(V):member(V,[is,become,becomes]), w(unlikely), w(to), w(be),w(lost)].

question(4,'a_fur',0): rule(1,28,1):: complete ==> [c(np:[head=heat]),c(vg:[pol=neg,head=lost])].

question(4,'a_fur',0): rule(1,29,1):: complete ==> [c(np:[head=amount]),?(w(_Of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat])),c(vg:[head=V,pol=pos,passive=yes]):member(V,[reduced,prevented,decreased,cut])].

question(4,'a_fur',0): rule(1,30,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat]))].


question(4,'a_fur',0): rule(1,'30_1',1):: complete ==>[w(H1):member(H1,[prevent,preventing,reduce,reducing,decrease,decreasing,cut,cutting]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat]))].

question(4,'a_fur',0): rule(1,31,1):: complete ==>[c(np:[head=L]):member(L,[heat]), c(vg:[head=H2,pol=neg]):member(H2,[lost])].

question(4,'a_fur',0): rule(1,32,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting,minimizes,minimises,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat]))].

question(4,'a_fur',0): rule(1,'32_1',1):: complete ==>[w(H1):member(H1,[prevent,preventing,reduce,reducing,decrease,decreasing,cut,cutting,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat]))].

full_mark(question(4,'a_fur',0),1).








