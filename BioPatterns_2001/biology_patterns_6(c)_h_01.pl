% rules for question 6 (c) higher-tier paper 2001

:-multifile answer/4.
:-multifile or_rule/2.
:-multifile full_mark/2.

:- multifile alternative/2.



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


% Id is of the form :
% question(number,part,subpart): rule(Set_number,rule_number, level)
%    if more than one level then additional argument is added to differentiate
% between the rules
:- multifile equivalence_class/2.



% question 6(c) higher tier paper 2001 -

% equivalence class 1 
% [blood/core temperature detected]

% core temperature detected 
question(6,c,0): rule(1,1,1):: complete ==>[w(W):member(W,[core,blood]), w(temperature), w(V):member(V,[detected,noticed,felt,monitored,checked,sensed])].
% member(W,[core, body,blood]	
	
% temperature of core detected
question(6,c,0): rule(1,2,1):: complete ==>[w(temperature), w(of), c(np:[head=W]):member(W,[core, blood]) , c(vg:[head=V]):member(V,[detected,noticed,felt,monitored,checked,sensed])].
	%member(W,[core, body, blood])
	
% temperature of core rises
question(6,c,0): rule(1,3,1):: complete ==>[w(temperature), w(of), c(np:[head=W]):member(W,[core, blood]),c(vg:[head=V]):member(V,[increases,rises])].
	% member(W,[core, body,blood])
	

% core/body/blood temperature rises 
question(6,c,0): rule(1,4,1):: complete ==>[c(np:[head=temperature,mods=[W]]):member(W,[core,blood]),c(vg:[head=V]):member(V,[increases,rises,rise,increase])].
%member(W,[core, body,blood])


% core/body/blood temperature has (a) higher temperature
question(6,c,0): rule(1,5,1):: complete ==>[w(W):member(W,[core,blood]),c(vg:[head=V]):member(V,[has,have]), c(np:[head=temperature, mods=[K]]):member(K,[higher,bigger,more,raised,risen])].
	% member(W,[core, body,blood])
	
% raised/higher temperature of the blood
question(6,c,0): rule(1,6,1):: complete ==>[w(K):member(K,[raised,increased,higher,bigger,more]), w(temperature),w(of),c(np:[head=W]):member(W,[core,blood])].
% member(W,[core, body,blood])].	
	

% raised/higher temperature of the blood
% like before -- when np cannot be formed
question(6,c,0): rule(1,61,1):: complete ==>[w(K):member(K,[raised,increased,higher,bigger,more]), w(temperature),w(of), ?(w(_I)),w(W):member(W,[core,blood])].
% member(W,[core, body,blood])].

% blood around brain (it) is above normal temperature
question(6,c,0): rule(1,7,1):: complete ==> [c(np:[head=blood]),?(w(_W)),?(w(_Y)), c(vg:[head=G]):member(G,[is,are,seems]),w(above),c(np:[head=T,mods=[normal]]):member(T,[temp,temperature])].

% temperature of the blood is above normal

% blood/core temperature is above normal


% the body detects temperature change as blood passes/flows by/in/through the brain
question(6,c,0): rule(1,12,1):: complete ==>[c(vg:[stem=W]):member(W,[detect,notice,feel,monitor,check,sense]),c(np:[mods=[temperature]]),?(w(_As)),c(np:[head=blood]),c(vg:[stem=V,pol=pos]):member(V,[pass,flow,circulate,pump,go,come,run,travel]),?(w(_J)), c(np:[head=F]):member(F,[brain,hypothalamus,'Hypothalamus','Brain'])].

% As/when the blood passes through the brain it checks the temperature
question(6,c,0): rule(1,12,1):: complete ==>[w(W):member(W,[as,'As','When',when]),c(np:[stem=blood]),c(vg:[pol=pos,stem=V]):member(V,[pass,flow,circulate,pump,go,come,run,travel]),_P/'IN',c(np:[stem=brain]),_I/'PRP',c(vg:[pol=pos,stem=F]):member(F,[detect,notice,feel,monitor,check,sense]),c(np:[stem=H]):member(H,[heat,temperature])].

% blood heats/warms up
question(6,c,0): rule(1,13,1):: complete ==>[c(np:[stem=blood]),(c(vg:[stem=H,pol=pos]):member(H,[heat,warm]);c(np:[stem=N]):member(N,[heat,warmth]))].

% the rise/increase in blood/the core/the body temperature
question(6,c,0): rule(1,14,1):: complete ==>[c(np:[stem=I]):member(I,[increase,rise,increment]),_P/'IN', c(np:[stem=temperature,mods=[L]]):member(L,[blood,core])].
%member(L,[blood,core,body])].
					    
%  .... temperature of the blood
question(6,c,0): rule(1,15,1):: complete ==>[c(np:[stem=I]):member(I,[increase,rise,increment]),_P/'IN', c(np:[stem=temperature]),?(w(_J)),c(np:[stem=B]):member(B,[core,blood])].% member(B,[body,core,blood])].

% when the blood flows to the brain
/*
question(6,c,0): rule(1,16,1):: complete ==>[(_L/'WRB';_J/'IN'),c(np:[stem=blood]),c(vg:[pol=pos,stem=F]):member(F,[flow,pump,circulate,go,come,travel,run,pass]),?((_K/'IN';_H/'TO')),c(np:[stem=brain])].
*/
question(6,c,0): rule(1,16,1):: complete ==>[_L/'WRB',c(np:[stem=blood]),c(vg:[pol=pos,stem=F]):member(F,[flow,pump,circulate,go,come,travel,run,pass]),?((_K/'IN';_H/'TO')),c(np:[stem=brain])].

% the body detects the blood temperature
question(6,c,0): rule(1,17,1):: complete ==>[c(np:[stem=body]),(c(vg:[pol=pos,stem=D]):member(D,[detect,notice,feel,monitor,check,sense]);w(W):member(W,[detect,notice,feel,monitor,check,sense])),c(np:[stem=temperature,mods=[blood]])].

% the brain monitors the temperature of fluids like blood
question(6,c,0): rule(1,18,1):: complete ==>[c(np:[stem=B]):member(B,[brain,hypothalamus,'Brain','Hypothalamus']),c(vg:[pol=pos,stem=M]):member(M,[detect,notice,feel,monitor,check,sense]),c(np:[stem=temperature]),?(w(_Of)),?(c(np:[stem=fluid])),_Z/'IN',c(np:[stem=blood])].

% brain has special receptors which monitor BLOOD TEMPERATURE 
question(6,c,0): rule(1,19,1):: complete ==>[c(np:[stem=brain]),?(c(vg:[stem=have,pol=pos])),?(c(np:[stem=receptor])),?(_K/'WDT'),c(vg:[pol=pos,stem=J]):member(J,[monitor,check,sense,detect,notice,feel]),c(np:[stem=temperature,mods=[blood]])].

% the level of heat/temperature in the blood
question(6,c,0): rule(1,20,1):: complete ==>[c(np:[stem=level]),?(w(_O)),c(np:[stem=H]):member(H,[heat,temperature]),_P/'IN',c(np:[stem=blood])].

% equivalence class 2 - continuation of 1 
% [by brain/hypothalamus]

% (his/the) brain (which) (in your body/head) detects
% note that I included 'senses' in the second disjunction at the end of the rule since 'senses' ,in some cases, is tagged as NNS and not a VBZ and hence a vg is not formed
question(6,c,0): rule(2,1,1):: complete ==>[w(W):member(W,[brain,hypothalamus,'Hypothalamus','Brain']), ?(w(_W)),?(_/'IN'),?(c(np:[stem=_O])),(c(vg:[stem=V,pol=pos]):member(V,[detect,notice,feel,check,tell,monitor,sense,notify]);w(M):member(M,[detect,notice,feel,check,tell,monitor,sense,notify,senses]))].
	
% feels/notices in his/the brain
question(6,c,0): rule(2,2,1):: complete ==>[c(vg:[stem=V,pol=pos]):member(V,[notice,feel,monitor,sense,detect]),?(c(np:[stem=change])),?(_M/'IN'),?(c(np:[stem=temperature])),w(in), c(np:[stem=W]):member(W,[brain,hypothalamus,'Hypothalamus','Brain'])].
	
	
% by the brain
question(6,c,0): rule(2,3,1):: complete ==>[ w(by),c(np:[head=W]):member(W,[brain,hypothalamus,'Hypothalamus','Brain'])].

% by the brain (when np fails to be formed!)
question(6,c,0): rule(2,31,1):: complete ==>[ w(by),?(w(_O)),w(W):member(W,[brain,hypothalamus,'Hypothalamus','Brain'])].


% the part(of the brain) which detects temperature changes is called the hypothalamus / the part which detects/detecting temperature changes is the brain

	
% the body detects temperature change as blood passes/flows by/in/through the brain
question(6,c,0): rule(2,4,1):: complete ==>[c(vg:[head=W]):member(W,[detects,detect,notice,notices,feel,feels,monitor,monitors,check,checks]),c(np:[mods=[temperature]]),?(w(_As)),c(np:[head=blood]),c(vg:[stem=V,pol=pos]):member(V,[pass,flow,circulate,pump,go,come,run,travel]),?(w(_J)), c(np:[head=F]):member(F,[brain,hypothalamus,'Hypothalamus','Brain'])].


% thermoregulatory centre in the brain
question(6,c,0): rule(2,5,1):: complete ==>[c(np:[stem=centre,mods=[thermoregulatory]]),w(_W/'IN'),c(np:[stem=brain])].

%%%%% the brain controls the response (this is not really an answer)

% brain/hypothalamus measures temperature
question(6,c,0): rule(2,6,1):: complete ==>[c(np:[stem=S]):member(S,[brain,'Brain','Hypothalamus',hypothalamus]),(c(vg:[pol=pos,stem=M]):member(M,[measure]);w(measure)),c(np:[stem=temperature])].

% the body detects the blood temperature when/as it is being passed through the brain
/*
question(6,c,0): rule(2,7,1):: complete ==>[(c(vg:[pol=pos,stem=D]):member(D,[detect,notice,feel,monitor,check,sense]);w(W):member(W,[detect,notice,feel,monitor,check,sense])),c(np:[stem=temperature,mods=[blood]]),(_O/'WRB';_K/'IN'),c(np:[stem=I]):member(I,[it,blood]),c(vg:[pol=pos,stem=P]):member(P,[pass,flow,circulate,pump,travel,go,come]),_L/'IN',c(np:[stem=brain])].
*/

question(6,c,0): rule(2,7,1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[detect,notice,feel,monitor,check,sense]),c(np:[stem=temperature,mods=[blood]]),(_O/'WRB';_K/'IN'),c(np:[stem=I]):member(I,[it,blood]),c(vg:[pol=pos,stem=P]):member(P,[pass,flow,circulate,pump,travel,go,come]),_L/'IN',c(np:[stem=brain])].

% brain has special receptors which monitor (blood temperature)
question(6,c,0): rule(2,8,1):: complete ==>[c(np:[stem=brain]),?(c(vg:[stem=have,pol=pos])),?(c(np:[stem=receptor])),?(_K/'WDT'),c(vg:[pol=pos,stem=J]):member(J,[monitor,check,sense,detect,notice,feel])].

% equivalence class 3 -
% [increased sweat production]

% increased (production of) sweat (production)
question(6,c,0): rule(3,1,1):: complete ==>[w(V):member(V,[increased,higher,raised,more,bigger]), ?(w(production)), ?(w(of)),w(W):member(W,[sweat])].
	
	%member(W,[sweat,water,liquid]).
	


% sweat (production) increases
question(6,c,0): rule(3,11,1):: complete ==>[c(np:[mods=[sweat]]), c(vg:[head=V]):member(V,[increasing,increase,increases,add,increment,step,adding,adds,incrementing,increments,steps,stepping,enhances,enhanced,increased,enhancing])].

% (produce/ooze out/release) a lot/(much) more /(so) much/  (of) sweat/water
% a lot of/ a lot more/much more/so much sweating

question(6,c,0): rule(3,2,1):: complete ==>[w(W):member(W,[lot,alot,more,much]),?(w(of)),w(K):member(K,[sweat,sweating])].
	%member(V,[a,lot,much,so]),
	
	%member(K,[sweat,water,sweating,liquid]).
	





% sweat gland(s) (also) become/are (a lot /much) more active
% sweat gland(s) produce/ooze out  (a lot/much) more

% the pattern allows something like sweat glands become more
% but it is unlikely that something like this appears so no harm

question(6,c,0): rule(3,3,1):: complete ==>[w(V):member(V,[sweat,water]), w(Y):member(Y,[gland,glands]),?(w(W):member(W,[also,then])),w(X):member(X,[are,become,becomes,is,produce,ooze,release]),?(w(a)),?(w(lot)),?(w(much)),w(more),?(w(K):member(K,[active]))].
	
	
% sweat gland(s) (also/then) increase(s)/raise/enhance/intensify their/its activity


question(6,c,0): rule(3,4,1):: complete ==>[w(V):member(V,[sweat,water]), w(Y):member(Y,[gland,glands]),?(w(W):member(W,[also,then])),w(X):member(X,[increase,increases,raise,raises,enhance,enhances,intensify,intensifies]), c(np:[head=activity])].
	

% sweating much more/a lot more/ much /more
% this will overgenerate -- be careful
question(6,c,0): rule(3,5,1):: complete ==>[w(V):member(V,[sweating]), ?(w(Y):member(Y,[a,lot,alot,much,so])),w(W):member(W,[more,much])].

	
	
       
% a lot of sweat is created
question(6,c,0): rule(3,6,1):: complete ==>[c(np:[head=lot]),?(w(_Of)),c(np:[head=sweat]),c(vg:[head=C,passive=yes,pol=pos]):member(C,[created,produced])].

% releasing more liquid through the sweat gland
question(6,c,0): rule(3,7,1):: complete ==>[w(more),w(liquid),?(_/'IN'),c(np:[stem=gland,mods=[sweat]])].

% equivalence class 4 - continuation of 3 
% [as sweat evaporates it takes heat from skin]

% as sweat evaporate(s) (then) it/they take(s) heat (from skin)
% sweat (on the skin/surface ) (will/would) evaporate(s)

/* question(6,c,0): rule(4,1,1):: complete ==>[w(V),w(W), ?(w(then)), w(X)),w(Y),w(heat)]:-
     member(V,[sweat,water]),
     member(W,[evaporate,evaporates]),
     member(X,[it,they]),
     member(Y,[take,takes]).

*/

question(6,c,0): rule(4,1,1):: complete ==>[c(np:[head=V]):member(V,[sweat,'Sweat',water,'Water']),?(w(_When)),?(c(vg:[stem=J,pol=pos]):member(J,[reach,attain,touch,arrive])),?(w(K):member(K,[from,on])),?(c(np:[stem=I]):member(I,[skin,surface])),?(w(then)),c(vg:[stem=W,pol=pos]):member(W,[evaporate])].
	

% evaporates off his/the skin
% implicit that we are talking about sweat - may overgenerate but
% it is better than if we consider the word "evaporates" on its own!!!
% see next equivalence class!!

question(6,c,0): rule(4,2,1):: complete ==>[w(V):member(V,[evaporate,evaporates,evaporated]),?(w(K):member(K,[off,from])), c(np:[head=I]):member(I,[skin,surface])].
      
      

% evaporation
% it is implicit that we are talking about sweat
% however, this could overgenerate some wrong results 

question(6,c,0): rule(4,3,1):: complete ==>[w(evaporation)].


% the sweat will evaporate (transferring heat energy away from the skin)
question(6,c,0): rule(4,4,1):: complete ==>[c(np:[head=W]):member(W,[water,sweat,'Sweat','Water']),(c(vg:[stem=V,pol=pos]):member(V,[evaporate]);w(J):member(J,[evaporate]))].

% (making him) sweat when this evaporates ...
question(6,c,0): rule(4,5,1):: complete ==>[w(J):member(J,[sweat,'Sweat']),?(w(_P)),_O/'WRB',_L/'DT',c(vg:[head=V,pol=pos]):member(V,[evaporate,evaporates])].

% the sweat lying on the skin evaporates
question(6,c,0): rule(4,6,1):: complete ==>[w(J):member(J,[sweat,'Sweat']),?(w(_Lying)),_P/'IN',c(np:[head=S]):member(S,[skin,surface]),c(vg:[head=V,pol=pos]):member(V,[evaporate,evaporates,evaporated])].


% producing sweat to allow some of the heat to evaporate off
question(6,c,0): rule(4,7,1):: complete ==>[w(sweat),?(w(_W)),c(vg:[pol=pos,stem=S]):member(S,[allow,permit]),?(w(_K)),?(w(_J)),c(np:[stem=heat]),c(vg:[stem=evaporate,pol=pos])].

% release sweat which then evaporates
question(6,c,0): rule(4,8,1):: complete ==>[w(W):member(W,[sweat,'Sweat']), ?(_J/','),(_I/'WDT'; _K/'CC'), ?(_O/'RB'),c(vg:[pol=pos,stem=evaporate])].

% Sweat glands in the dermis extract water which comes to the surface, and is evaporated of the skin
question(6,c,0): rule(4,9,1):: complete ==>[c(np:[stem=gland,mods=[P]]):member(P,[sweat,'Sweat']),_/'IN',c(np:[stem=_L]),w(W):member(W,[extract]),w(J):member(J,[water,liquid,sweat,'Sweat']),_O/'WDT',?(c(vg:[pol=pos,stem=_V])),?(w(_I)),c(np:[stem=S]):member(S,[surface,skin]),?((_Y/',';_U/'.')),_M/'CC',(c(vg:[stem=evaporate,pol=pos]);w(evaporate))].

% (produce) sweat as this will cool down the body when it evaporates
question(6,c,0): rule(4,10,1):: complete ==>[c(np:[stem=S]):member(S,[sweat,'Sweat']),?(w(_I)),w(T):member(T,[this,it]),c(vg:[pol=pos,stem=cool]),c(np:[stem=body]),_J/'WRB', _K/'PRP',(c(vg:[pol=pos,stem=evaporate]);w(evaporate))].

% sweat (will help release the heat energy that is built up due to aerobic respiration) and also help to evaporate heat
question(6,c,0): rule(4,11,1):: complete ==>[c(np:[stem=S]):member(S,[sweat,'Sweat']),c(vg:[stem=A,pol=pos]),w(_),c(np:[stem=E]):member(E,[heat,energy]), _L/'WDT',c(vg:[stem=build,pol=pos]),w(due),?((_D/'IN';_M/'TO')),c(np:[stem=respiration]),?(_Q/'CC'),?(_S/'RB'),?((c(vg:[stem=A,pol=pos]);w(A))),c(vg:[stem=evaporate,pol=pos]),c(np:[stem=heat])].

% heat evaporate off/of/from the skin/surface
question(6,c,0): rule(4,12,1):: complete ==>[c(np:[stem=heat]),(c(vg:[stem=evaporate,pol=pos]);w(evaporate)),?(w(_W)),c(np:[stem=S]):member(S,[surface,skin])].
% sweat so his movement in the air can evaporate it off
question(6,c,0): rule(4,13,1):: complete ==>[w(S):member(S,[sweat,'Sweat']),?(w(_U)),c(np:[stem=movement]),?(_O/'IN'),?(c(np:[stem=air])),(c(vg:[pol=pos,stem=evaporate]);w(evaporate))].

% heat is lost in the form of/as (water) vapour
question(6,c,0): rule(4,14,1):: complete ==>[w(heat),c(vg:[pol=pos,stem=lose]),?(_U/'IN'),?(c(np:[stem=form])),?(w(_H)),c(np:[stem=vapour])].
					      
% equivalence class 5-
% [vasodilation]

question(6,c,0): rule(5,1,1):: complete ==>[w(V):member(V,[vasodilation,'Vasodilation',vasodilating,'Vasodilating'])].
% vessels near the surface of the skin dilate/vasodilate
question(6,c,0): rule(5,2,1):: complete ==>[c(np:[stem=C]):member(C,[capillary,vessel,artery]),?(w(_I)),?(w(_P)),?(c(np:[head=S]):member(S,[skin,surface])),?(w(_Of)),?(c(np:[head=skin])),c(vg:[pol=pos,head=F]):member(F,[vasodilate,dilate,expand,widen])].

%%%%%%% this could overgenerate obviously
question(6,c,0): rule(5,3,1):: complete ==>[w(V):member(V,[vasodilate,'Vasodilate',expand,widen])].

% vessels /capillaries increase blood flow
question(6,c,0): rule(5,4,1):: complete ==>[c(np:[head=K]):member(K,[vessels, capillaries]),?(w(to)), c(vg:[head=W]):member(W,[open,increase,expand,widen]),c(np:[mods=[blood],head=V]):member(V,[supply,flow])].
	
	
% blood vessels then run nearer (as near as possible) to the skin/skins/surface
question(6,c,0): rule(5,5,1):: complete ==>[c(np:[head=V]):member(V,[vessels,'Vessels',capillaries,'Capillaries',blood]),?(w(_Then)),c(vg:[stem=K,pol=pos]):member(K,[run,flow,circulate,pump,pass,go,come,travel]),?(w(_O)),w(N):member(N,[nearer,closer,next,close,near,adjacent,to]),?(w(_As)),?(w(_Possible)),?(w(_To)), c(np:[head=S]):member(S,[skin,skins,surface])].

% increases/step up the blood supply/flow to the skin/skins/surface
question(6,c,0): rule(5,6,1):: complete ==>[c(vg:[head=V]):member(V,[increasing,increase,increases,add,increment,step,adding,adds,incrementing,increments,steps,stepping]),c(np:[mods=[blood]]),?(w(_To)),c(np:[head=S]):member(S,[skin,skins,surface])].

% (more) blood is pumped through the blood capillary loop so that extra heat is lost through the skin
/*
question(6,c,0): rule(5,7,1):: complete ==>[c(np:[head=blood]),c(vg:[stem=V,pol=pos]):member(V,[pump,circulate]),?(_/'IN'), (c(np:[head=loop,mods=L]):member(capillary,L);c(np:[head=C]):member(C,[capillaries,capillary,vessels,vessel])),?(w(_P)),?(w(_I)), c(np:[head=heat,mods=[F]]):member(F,[extra,more]),c(vg:[head=lost,pol=pos]),_L/'IN',c(np:[head=S]):member(S,[skin,surface])].

*/

question(6,c,0): rule(5,7,1):: complete ==>[c(np:[head=blood]),c(vg:[stem=V,pol=pos]):member(V,[pump,circulate]),?(_/'IN'), c(np:[head=loop,mods=L]):member(capillary,L),?(w(_P)),?(w(_I)), c(np:[head=heat,mods=[F]]):member(F,[extra,more]),c(vg:[head=lost,pol=pos]),_L/'IN',c(np:[head=S]):member(S,[skin,surface])].


% the blood capillary loop opens so blood gets to the skin surface/surface of the skin

question(6,c,0): rule(5,8,1):: complete ==>[c(np:[stem=loop]),c(vg:[pol=pos,stem=open]),?(w(_SO_AND)),c(np:[stem=blood]),c(vg:[pol=pos,stem=M]):member(M,[get,reach,arrive,touch,contact]),?(w(_TOIN)),c(np:[stem=K]):member(K,[skin,surface])].

% the blood capillary loop will open up so as much blood can pass as possible
question(6,c,0): rule(5,9,1):: complete ==>[c(np:[stem=loop]),c(vg:[pol=pos,stem=open]),?(w(_SO)),c(np:[stem=blood,mods=L]):(member(much,L);member(more,L)),c(np:[stem=blood]),c(vg:[pol=pos,stem=S]):member(S,[pass,flow,run,pump,circulate,go,come,travel])].

% (capillaries allow) the blood to flow nearer to the surface of the skin
% (The blood supply opens up so that) blood travels closer to the surface of his skin 

question(6,c,0): rule(5,10,1):: complete ==>[c(np:[stem=blood]),c(vg:[pol=pos,stem=F]):member(F,[flow,circulate,pump,pass,run,go,come,travel]),w(N):member(N,[closer,nearer,near,close,adjacent,touching,nearby,next]),?(w(_P)),c(np:[stem=S]):member(S,[surface,skin])].


% capillary loop loses heat (also/as well) by pumping so/very close/next to the skin/surface

question(6,c,0): rule(5,11,1):: complete ==>[c(vg:[head=V]):member(V,[loses,lost,lose]),w(heat),?(w(X):member(X,[also])) ,w(by), w(W):member(W,[pumping,flowing,circulating,passing,running,coming,going,travelling]), w(Y):member(Y,[so,very]), w(Z):member(Z,[close,next,near,adjacent,touching,closer,nearer]), ?(w(to)), c(np:[head=K]):member(K,[skin,surface])].

% more blood w(W) to be sent to the blood vessels near the skin's surface/the surface/the surface of the skin
/*
question(6,c,0): rule(6,4,1):: complete ==>[c(np:[stem=blood,mods=[more]]),?(w(_P)),?(w(_L)),c(vg:[stem=send,pol=pos]),?(w(to)),c(np:[stem=S]):member(S,[vessel,capillary]),w(W):member(W,[near,close,next,adjacent,touching]),?(w(to)),?(c(np:[stem=skin])),c(np:[stem=surface])].
*/
% due to the failure of formation of an np with head 'blood' and np with head 'surface' due to the spelling mistake in the possessives on some examples we
% changed the above rule into the one below
question(6,c,0): rule(5,12,1):: complete ==>[w(more),?(w(A):member(A,[amount,of])),?(w(the)),w(blood),?(w(_P)),?(w(_L)),c(vg:[stem=send,pol=pos]),?(w(to)),c(np:[stem=S]):member(S,[vessel,capillary]),w(W):member(W,[near,close,next,adjacent,touching]),?(w(to)),?(c(np:[stem=skin])),w(surface)].

% the blood capillary also moves nearer the surface/the skin (?)
question(6,c,0): rule(5,13,1):: complete ==>[c(np:[stem=C]):member(C,[capillary,vessel]),?(w(_Also)), c(vg:[pol=pos,stem=M]):member(M,[move,rise]),w(N):member(N,[near,nearer,close,next,adjacent,nearby,closer,towards]),?(w(_H)),c(np:[stem=S]):member(S,[surface,skin])].

% expanding/expansion of blood vessels
/*
question(6,c,0): rule(5,14,1):: complete ==>[w(E):member(E,[expanding,expansion,widening]),?(w(_O)),(c(np:[stem=C]):member(C,[vessel,capillary]);c(np:[stem=_,mods=L]):(member(vessel,L);member(capillary,L)))].
*/
% i replaced the last rule with the next two
question(6,c,0): rule(5,14,1):: complete ==>[w(E):member(E,[expanding,expansion,widening]),?(w(_O)),c(np:[stem=C]):member(C,[vessel,capillary])].
question(6,c,0): rule(5,141,1):: complete ==>[w(E):member(E,[expanding,expansion,widening]),?(w(_O)), ?(w(blood)),w(K):member(K,[vessels,capillaries])].

% blood vessels become slightly larger
question(6,c,0): rule(5,15,1):: complete ==>[c(np:[stem=S]):member(S,[capillary,vessel]),c(vg:[pol=pos,stem=_]),?(w(_U)),w(L):member(L,[larger,bigger,large,big])].

% opening blood capillary loop/loops
question(6,c,0): rule(5,15,1):: complete ==>[c(vg:[pol=pos,stem=open]),c(np:[stem=loop])].

question(6,c,0): rule(5,16,1):: complete ==>[w(O):member(O,[open,opening]),?(w(_I)),w(blood),w(C):member(C,[capillary,capillaries]),w(L):member(L,[loop,loops])].
% equivalence class 6- continuation of 5 
% ['hence' heat loss is by radiation/conduction/convection]

% heat can be/ is lost by ....
question(6,c,0): rule(6,1,1):: complete ==>[c(np:[head=heat]), c(vg:[head=lost]), w(B):member(B,[by,through]),w(W):member(W,[radiation,conduction,convection])].
	


% heat loss is by ...
question(6,c,0): rule(6,2,1):: complete ==>[c(np:[mods=[heat],head=loss]), ?(w(K):member(K,[is,done])),w(by),w(W):member(W,[radiation,conduction,convection])].
	
% heat radiate
question(6,c,0): rule(6,3,1):: complete ==>[c(np:[stem=heat]),(w(W):member(W,[radiate]);c(vg:[stem=R,pol=pos]):member(R,[radiate]))].
% member(W,[radiate,convect,conduct

% radiating/radiation/convection/conduction heat
question(6,c,0): rule(6,4,1):: complete ==>[c(W):member(W,[radiating,radiation,convection,conduction]),w(heat)].

%-------------------------------
full_mark(question(6,c,0),4).

or_rule(question(6,c,0),[[(rule(3,_K,1),_X),(rule(4,_L,1),_Y)],[(rule(5,_D,1),_Z),(rule(6,_M,1),_W)]]).

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/6(c).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/data/6(c).pl').




