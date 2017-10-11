% rules for question 2(a) higher-tier paper 2003

%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).


% question : write down the job of the heart
% full mark is 1

% equivalence class 1


% 1.(to) pump/pumps/pumping/circulate/rotate/push/move (the/this)
% (oxygenated/deoxygenated/de-oxygenated/oxygenated and& deoxygenated)  blood
/*
question(2,a,0): rule(1,1,1):: complete ==>[(c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]);w(J):member(J,[pump,circulate,rotate,push,move])), ?(w(_W)),?(_/'CC'),c(np:[stem=blood])].
					   
% 2. push/force/pump/move (the) blood around/round
question(2,a,0): rule(1,2,1):: complete ==> [(c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]); w(J):member(J,[pump,circulate,rotate,push,move])), c(np:[stem=blood]),w(W):member(W,[around,round])].
*/

% disjunctions as a first element on the RHS don't seem to work
% also sometimes pump blood is taken as : np(stem=blood, mods=[pump])!! 
% we repeat the rules

question(2,a,0): rule(1,1,1):: complete ==>[c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]), ?(w(_THE)),?(w(_OXY)),?(_/'CC'),c(np:[stem=blood])].


question(2,a,0): rule(1,'1_1',1):: complete ==>[w(J):member(J,[pump,circulate,rotate,push,move,pumps,circulates,rotates,moves,pushes,'Pump','Circulate','Rotate','Push','Move','Pumps','Circulates','Rotates','Pushes','Moves']),?(w(_THE)),?(w(_W)),?(_/'CC'),c(np:[stem=blood])].

question(2,a,0): rule(1,'1_2',1):: complete ==>[c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]), ?(w(_THE)),?(w(_W)),?(_/'CC'),w(blood)].

question(2,a,0): rule(1,'1_3',1):: complete ==>[w(J):member(J,[pump,circulate,rotate,push,move,pumps,circulates,rotates,pushes,moves,'Pump','Circulate','Rotate','Push','Move','Pumps','Circulates','Rotates','Pushes','Moves']), ?(w(_THE)),?(w(_W)),?(_/'CC'),w(blood)].

question(2,a,0): rule(1,2,1):: complete ==> [c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]), c(np:[stem=blood]),w(W):member(W,[around,round])].

question(2,a,0): rule(1,'2_1',1):: complete ==> [w(J):member(J,[pump,circulate,rotate,push,move,'Pump','Circulate','Rotate','Push','Move','Pumps','Circulates','Rotates','Pushes','Moves']), ?(w(_)),c(np:[stem=blood]),w(W):member(W,[around,round])].

question(2,a,0): rule(1,'2_2',1):: complete ==> [w(J):member(J,[pump,circulate,rotate,push,move,'Pump','Circulate','Rotate','Push','Move','Pumps','Circulates','Rotates','Pushes','Moves']), ?(w(_O)),w(blood),w(W):member(W,[around,round])].

% 3. keep (the) blood flowing/moving/going/circulating/pumping/travelling/rotating round/around
% 4. blood (is) pumped/pumping/circulated/circulating/rotated/rotating/pushed/pushing round/around
question(2,a,0): rule(1,3,1):: complete ==> [c(np:[stem=blood]),(c(vg:[pol=pos,stem=V]):member(V,[flow,move,go,circulate,pump, travel,rotate,push]); w(J):member(J,[pump,circulate,rotate,push,move,flow,go,travel,'Pump','Circulate','Rotate','Push','Move','Flow','Go','Travel','Pumps','Circulates','Rotates','Pushes','Moves','Flows','Goes'])),w(W):member(W,[around,round])].


% 5.	pumping/circulation/flow of blood
question(2,a,0): rule(1,4,1):: complete ==> [w(W):member(W,[pumping,circulation,flow,'Pumping','Circulation','Flow']),w(_Of),c(np:[stem=blood])].

% 6.	single quotes/ capitals 'pump'/ Pump etc
%question(2,a,0): rule(1,5,1):: complete ==> 

% 7.	pumps/pushes/move/circulate/rotate deoxygenated /de-oxygenated blood to (the) lungs and (pumps/...) oxygenated blood around the body
question(2,a,0): rule(1,6,1):: complete ==> [(c(vg:[pol=pos,stem=V]):member(V,[pump,push,move,circulate,rotate]);w(J):member(J,[pump,push,move,circulate,rotate])),c(np:[stem=blood]), _/'IN',c(np:[stem=lung]),_/'CC',?(c(vg:[pol=pos,stem=_W])),c(np:[stem=blood]), w(K):member(K,[round,around])].

% 8.	oxygenated blood from the lungs and pump/... it to the body
question(2,a,0): rule(1,7,1):: complete ==> [c(np:[stem=blood]),?(_/'IN'),c(np:[stem=lung]),_/'CC',(c(vg:[pol=pos,stem=V]):member(V,[pump,push,move,circulate,rotate]);w(J):member(J,[pump,push,move,circulate,rotate])),?(_/'PRP'),?(_/'IN'), c(np:[stem=body])].

%9.	pump deoxygenated blood to the lungs [so that it can]/ [in order to] get oxygen (and) (then) pump it to the (rest of the) body/around
%10.	pump deoxygenated blood to the lungs in order to get oxygen and (then) pump it to the (rest of the) body/around
% included in the previous rule
%11.	To pump blood to the lungs to collect oxygen and (then) pump it around/round to the (rest of the) body
question(2,a,0): rule(1,8,1):: complete ==> [(c(vg:[pol=pos,stem=V]):member(V,[pump,push,move,circulate,rotate]);w(J):member(J,[pump,push,move,circulate,rotate])),c(np:[stem=blood]),?(_/'IN'),c(np:[stem=lung]),?(w(_SO)),?(w(_That)),?((_/'PRP';c(np:[stem=blood]))),(c(vg:[pol=pos,stem=H]):member(H,[get,have,take,collect]); w(F):member(F,[get,have,take])),?(_/'CC'),?(_/'RB'),(c(vg:[pol=pos,stem=V]):member(V,[pump,push,move,circulate,rotate]);w(M):member(M,[pump,push,move,circulate,rotate])),?(_/'PRP'),?(w(G):member(G,[round,around])),?(_/'IN'),?(c(np:[stem=_N])),?(w(_Of)),(c(np:[stem=body]);w(X):member(X,[round,around]))].


% 12.	get blood around the whole body, to pump it around the (rest of the) body (this answer does not seem coherent but the sentence resolve 'it' to blood and this ensures the right answer , namely, pump blood around/around the body/to the body)
question(2,a,0): rule(1,9,1):: complete ==> [c(vg:[pol=pos,stem=V]):member(V,[pump,push,move,circulate,rotate]),(_/'PRP';c(np:[stem=blood])), ?(_/'IN'),(w(W):member(W,[round,around]); c(np:[stem=body]))].

full_mark(question(2,a,0),1).
