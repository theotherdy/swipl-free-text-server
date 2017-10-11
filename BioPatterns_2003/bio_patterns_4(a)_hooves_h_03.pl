% rules for question 4(a)_hooves higher tier paper 2003

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
% equivalence class 1
%[grip on the rocks/climbing]
%1.	(to) grip (s)/gripping/cling/gripy
%2.	climb/(C) climbing

question(4,'a_hooves',0): rule(1,1,1):: complete ==>[c(vg:[pol=pos,stem=G]):member(G,[grip,cling,climb])].


question(4,'a_hooves',0): rule(1,2,1):: complete ==>[w(G):member(G,[gripy,grippy,grip,cling,climb,grips,clings,climbs,clingging,gripping,climbing,'Grip','Cling','Climb','Grips','Clings','Climbs', 'Gripping','Clingging','Climbing'])].

% 3.	grasp/dig (into) the rocks
question(4,'a_hooves',0): rule(1,3,1):: complete ==> [c(vg:[pol=pos,stem=G]):member(G,[grasp,dig]),?(_/'IN'),(c(np:[stem=R]):member(R,[rock,mountain]); c(np:[stem=M,mods=L]):(member(M,[surface]),member(Z,[rock,mountain]),member(Z,L)))].

question(4,'a_hooves',0): rule(1,'3_1',1):: complete ==> [w(G):member(G,[grasp,dig,grasps,digs,grasping,digging]),?(_/'IN'),(c(np:[stem=R]):member(R,[rock,mountain]); c(np:[stem=M,mods=L]):(member(M,surface),member(Z,[rock,mountain]),member(Z,L)))].

%4.	stop/prevent/ does not allow (the bucardo/goat/animal/it/him) slipping
question(4,'a_hooves',0): rule(1,4,1):: complete ==> [c(vg:[pol=neg,stem=G]):member(G,[allow,permit]), (?(c(np:[stem=B]):member(B,[bucardo,goat,animal]));?(_/'PRP')),?(_/'POS'),?(w(from)),c(vg:[pol=pos,stem=S]):member(S,[slip,fall])].

question(4,'a_hooves',0): rule(1,5,1):: complete ==> [c(vg:[pol=pos,stem=G]):member(G,[stop,prevent,reduce,minimize]), (?(c(np:[stem=B]):member(B,[bucardo,goat,animal]));?(_/'PRP')),?(_/'POS'), ?(w(from)),c(vg:[pol=pos,stem=S]):member(S,[slip,fall])].

question(4,'a_hooves',0): rule(1,'5_1',1):: complete ==> [w(G):member(G,[stop,prevent,reduce,minimize,stops,prevents,reduces,minimizes,stopping,preventing,reducing,minimizing]), (?(c(np:[stem=B]):member(B,[bucardo,goat,animal]));?(_/'PRP')),?(_/'POS'), ?(w(from)),c(vg:[pol=pos,stem=S]):member(S,[slip,fall])].

%5.	(does/would) not slip/fall

question(4,'a_hooves',0): rule(1,6,1):: complete ==>[c(vg:[pol=neg,stem=G]):member(G,[slip,fall])].

%6.	find footholds

question(4,'a_hooves',0): rule(1,7,1):: complete ==>[c(vg:[pol=pos,stem=F]):member(F,[find]),c(np:[stem=T]):member(T,[foothold])].

question(4,'a_hooves',0): rule(1,'7_1',1):: complete ==>[w(F):member(F,[find,finds,finding]),c(np:[stem=T]):member(T,[foothold])].

full_mark(question(4,'a_hooves',0),1).