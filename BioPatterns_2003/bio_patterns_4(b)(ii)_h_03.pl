% rules for question 4(b)(ii) higher tier paper 2003

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

% full mark is 2
-----------------------------------------------------------------*/

full_mark(question(4,b,ii),2).

% not allowed/permitted/able to hunt/kill/....

question(4,b,ii): rule(1,1,1):: complete ==>
     [c(vg:[pol=neg,stem=G]):member(G,[allow,permit,able]),
        ?(_/_),?(_/_),?(_/_),?(_/_),
     c(vg:[pol=pos,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].

% need: decreases/lessens chance of; hunting + punishment/penalties/offence

% forbidden to, prevented from, etc...

question(4,b,ii): rule(1,2,1):: complete ==>
     [c(vg:[pol=pos,stem=G]):member(G,[forbid,prevent,stop,limit,protect,disallow,ban]),
      ?(_/_),?(_/_),?(_/_),?(_/_),
     c(vg:[pol=pos,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].


question(4,b,ii): rule(1,'2a',1):: complete ==>
     [c(vg:[pol=pos,stem=G]):member(G,[forbid,prevent,stop,limit,protect,disallow,ban]),
      ?(_/_),?(_/_),?(_/_),?(_/_),
     
     (c(np:[stem=S]):member(S,[hunting,poaching,killing,harming,damaging,
			      disturbing,disturbance,massacre,shooting])
     ;
    c(vg:[pol=pos,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     )
     ].


% sometimes two -ings are parsed as an NP (which they can be):
question(4,b,ii): rule(1,'2b',1):: complete ==>
     [ 
       
       c(np:[stem=S,mods=M]):(member(S,[hunting,poaching,killing,harming,damaging,
			               disturbing,disturbance,massacre,shooting]),
			      member(X,M),
			      member(X,[forbidding,preventing,stopping,
					limiting,disallowing,banning]))
     ].

% no threat of hunting
question(4,b,ii): rule(1,'2c',1):: complete ==>
     [w(W):member(W,[without,no,little,small,reduced,less]),
      ?(_/_),      ?(_/_),       ?(_/_),
      c(np:[stem=T]):member(T,[threat,fear]),
      ?(_/_),      ?(_/_),       ?(_/_),

      (c(np:[stem=S]):member(S,[hunting,poaching,killing,harming,damaging,
			      disturbing,disturbance,massacre,shooting])
      ;
      c(vg:[stem=H,passive=_Maybe]):member(H,[hunt,kill,poach,hurt,harm,shoot,disturb,damage])
      )
     ].

% illegal
question(4,b,ii): rule(1,3,1):: complete ==>
     [w(illegal),
      ?(_/_),?(_/_),?(_/_),?(_/_),?(_/_),
     c(vg:[pol=pos,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].




% illegal
question(4,b,ii): rule(1,4,1):: complete ==>
     [c(np:[stem=S]):member(S,[hunting,poaching,killing,shooting,harming,hurting,disturbing,damaging]),
     
      ?(_/_),?(_/_),?(_/_),
     (Word/_):member(Word,[illegal,forbidden,banned])
    
     ].



% cannot/don't/can't 
question(4,b,ii): rule(1,5,1):: complete ==>
     [
     c(vg:[pol=neg,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].


% nobody/no one/noone/ no man
question(4,b,ii): rule(1,6,1):: complete ==>
     [c(np:[stem=G,det=D]):(member(G,[noone,nobody]);(member(G,[one,man]),D=no)),
       ?(_/_),?(_/_),?(_/_),
     c(vg:[pol=_,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].


% fewer/less people
question(4,b,ii): rule(1,7,1):: complete ==>
     [c(np:[stem=G,mods=D]):(member(G,[people,hunter]),
			     member(X,[fewer,'Fewer',less,'Less']),
			     member(X,D)),
       ?(_/_),?(_/_),?(_/_),
     c(vg:[pol=_,stem=H]):member(H,[touch,damage,hunt,kill,hurt,harm,disturb,poach,shoot])
     ].

% need: hunters do not touch them

question(4,b,ii): rule(1,8,1):: complete ==>
     [c(np:[stem=G]):member(G,[law,fine,ban,offence]),
       ?(_/_),?(_/_),?(_/_),?(_/_),
      (c(np:[stem=H]):member(H,[hunting,hunter,poaching,poacher,killer,killing])
       ;
       c(vg:[stem=I]):member(I,[hunt,poach,kill,shoot,damage,destroy,harm,disturb])
      )
     ].

% equivalence class 2: protect environment
% protect environment etc

question(4,b,ii): rule(2,1,1):: complete ==>
    [c(vg:[pol=pos,stem=G]):member(G,[protect,preserve,defend,respect,conserve,maintain]),
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[habitat,environment,home]) %,animal,goat,creature])
    ].



question(4,b,ii): rule(2,2,1):: complete ==>
    [c(np:[stem=G]):member(G,[protection,preservation,defence,conservation,maintenance]),
       ?(_/_),?(_/_),?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[habitat,environment,home])% ,animal,goat,creature])
    ].

%% need passive forms too ****

% (not) destroy disturb build in environment etc

question(4,b,ii): rule(2,3,1):: complete ==>
    [c(vg:[stem=G]):member(G,[destroy,disturb,build,ruin,ruine]), % new stemmer problem!
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[habitat,environment,home])%,animal,goat,creature])
    ].

% wrongly gets `build new habitat'...



% prevented damage, deforestation

% need building/cutting trees

question(4,b,ii): rule(2,4,1):: complete ==>
     [c(vg:[pol=pos,stem=G]):member(G,[forbid,prevent,stop,ban,disallow]),
      ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[touch,damage,damaging,harm,harming,deforestation])
     ].


question(4,b,ii): rule(2,5,1):: complete ==>
    [ c(np:[stem=H]):member(H,[habitat,environment,home]),%,animal,goat,creature]),
       ?(_/_),?(_/_),?(_/_),
    
    c(vg:[pol=pos,stem=G,passive=_Maybe]):member(G,[protect,preserve,defend,respect,conserve,maintain])
    ].




question(4,b,ii): rule(2,6,1):: complete ==>
    [ c(np:[stem=H]):member(H,[habitat,environment,home]),%,animal,goat,creature]),
       ?(_/_),?(_/_),?(_/_),
    
     (Adj/'JJ'):member(Adj,[undisturbed,safe,peaceful,quiet])
    ].

%% need passive forms too ****

% (not) destroy disturb build in environment etc

question(4,b,ii): rule(2,7,1):: complete ==>
    [ c(np:[stem=H]):member(H,[habitat,environment,home]),%,animal,goat,creature]),
       ?(_/_),?(_/_),?(_/_),
    c(vg:[stem=G,passive=yes]):member(G,[destroy,disturb,build,harm])
    ].



% equivalence class 3: make public aware


question(4,b,ii): rule(3,1,1):: complete ==>
    [c(np:[stem=G]):member(G,[people,public]),
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[awareness,attention, knowledge, concern,notice])
    ].



%% atternion of publuc
question(4,b,ii): rule(3,'1_1',1):: complete ==>
    [
      
     c(np:[stem=H]):member(H,[awareness,attention, knowledge, concern,notice]),
      ?(_/_),?(_/_),?(_/_),
     c(np:[stem=G]):member(G,[people,public])
    ].




%% agreater public attention
question(4,b,ii): rule(3,'1_1',1):: complete ==>
    [
      
     c(np:[stem=H,mods=M]):(member(H,[awareness,attention, knowledge, concern,notice]),
			    member(X,[public,wide,more,greater,widespread]),
			    member(X,M))

    ].


question(4,b,ii): rule(3,2,1):: complete ==>
    [c(np:[stem=G]):member(G,[people,public]),
       ?(_/_),?(_/_),?(_/_),
     w(aware)
    ].


question(4,b,ii): rule(3,3,1):: complete ==>
    [c(np:[stem=G]):member(G,[people,public]),
       ?(_/_),?(_/_),?(_/_),
     c(vg:[stem=S]):member(S,[alert,warn,know])
    ].


question(4,b,ii): rule(3,'3a',1):: complete ==>
    [c(vg:[stem=S]):member(S,[alert,warn]),
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=G]):member(G,[people,public])    
    ].


question(4,b,ii): rule(3,4,1):: complete ==>
    [c(vg:[stem=G]):member(G,[bring,raise,make,increase,register,heighten]),
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[awareness,attention, knowledge,concern,notice])
    ].

% campaigns about/against hunting/poaching

question(4,b,ii): rule(3,5,1):: complete ==>
    [c(np:[stem=G]):member(G,[campaign,demonstration,protest]),
       ?(_/_),?(_/_),?(_/_),
     c(np:[stem=H]):member(H,[hunting,poaching])
    ].



% breeding programme



% this is just a keyword question

question(4,b,ii): rule(4,1,1):: complete ==>
    [c(vg:[stem=G]):member(G,[breed,mate])].



question(4,b,ii): rule(4,2,1):: complete ==>
    [
     c(np:[stem=breeding])
    ].


/*
question(4,b,ii): rule(4,1,1):: complete ==>
    [c(vg:[stem=G]):member(G,[increase]),
     c(np:[stem=H]):member(H,[number,population,stock])
    ].
*/

/*
animals/some/they are mated/bred

helped to breed

selective breeding

breeding programs

increase numbers

take into captivity/zoo to breed/ be bred

bred carefully

breeding is encouraged
*/
