% rules for question 6 (b) higher-tier paper 2001

:-multifile answer/4.
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



% question 6(b) higher tier - 2001

% equivalence class 1 i.e. set_number is 1
% [shivering]

% shivering
question(6,b,0): rule(1,1,1):: complete ==>[w(W):member(W,['Shivering',shivering,shiver,'Shiver',shivers,'Shivers',shaking,shake,shakes])].
	

% muscles (continuously) twitch/contract
% muscles are made to contract
question(6,b,0): rule(1,2,1):: complete ==>[w(W):member(W,[muscles,muscle]),?(w(K):member(K,[continuously,randomly])), c(vg:[pol=pos,head=I]):member(I,[twitch,contract,contracts,contracting,shake])].
	
	
	

% muscles (continuously) start/end up contracting

% question(6,b,0): rule(1,1,3):: complete ==>[w(W)]:-

% (random) contraction(s)
% implicitly: we are talking about muscles

question(6,b,0): rule(1,4,1):: complete ==>[w(W):member(W,[contraction,contractions])].
	

% equivalence class 2
% [increased liver activity]

% increased liver activity
question(6,b,0): rule(2,1,1):: complete ==>[w(W): member(W,[increased,'Increased',bigger,'Bigger',higher,'Higher',more,'More',raised,'Raised',enhanced,'Enhanced',intensified,'Intensified',increasing,'Increasing',enhancing,'Enhancing',intensifying,'Intensifying',raising,'Raising']), w(K):member(K,['Liver',liver]), w(A):member(A,[activity,'Activity'])].
       

% increase liver activity
question(6,b,0): rule(2,11,1):: complete ==>[c(vg:[head=W,pol=pos]):member(W,[increases,'Increases',raises,'Raises',enhances,'Enhances',intensifies,'Intensifies',increase,'Increase',raise,'Raise',enhance,'Enhance',intensify,'Intensify']), w(K):member(K,['Liver',liver]), w(A):member(A,[activity,'Activity'])].

% when no vg is formed

question(6,b,0): rule(2,111,1):: complete ==>[w(W):member(W,[increase,'Increase',raise,'Raise',enhance,'Enhance',intensify,'Intensify']), w(K):member(K,['Liver',liver]), w(A):member(A,[activity,'Activity'])].

% liver (activity) is/works/will work faster/higher/bigger/more (active)

question(6,b,0): rule(2,2,1):: complete ==>[w(K):member(K,['Liver',liver]), ?(w(A):member(A,[activity,'Activity'])), c(np:[head=K]):member(K,[is,works,work,working]),w(V):member(V,[faster,higher,bigger,more]) ].
	
	

% liver activity (would/will be) increase/increases/intensifies/increasing...

question(6,b,0): rule(2,3,1):: complete ==>[w(K):member(K,['Liver',liver]), w(A):member(A,[activity,'Activity']), c(vg:[pol=pos,head=I]):member(I,[increase,'Increase',increases,'Increases',intensifies,'Intensifies',increasing,'Increasing',intensify,'Intensify',intensifying,'Intensifying',intensified,'Intensified','Enhanced','Increased',enhanced,increased]) ].

/*
% liver activity is intensified/enhanced/increased
question(6,b,0): rule(2,4,1):: complete ==>[w(K):member(K,['Liver',liver]),w(activity),w(is), w(W):member(W,[intensified,enhanced,increased])].
*/ 


%  equivalence class 3
% [less sweating]


% decreased/less (production of) sweat (production)
question(6,b,0): rule(3,1,1):: complete ==>[w(V):member(V,[decreased,less,lower,smaller]), ?(w(production)), ?(w(of)),w(W):member(W,[sweat,water])].

	
% (produce/ooze out) a lot/(much) less /(so) much/  (of) sweat/water
% a lot less/much less/so much less sweating

question(6,b,0): rule(3,2,1):: complete ==>[?(w(V):member(V,[lot,much])), w(W):member(W,[less]),?(w(of)),w(K):member(K,[sweat,water,sweating])].
	
	
	
	

% sweat gland(s) (also) become/are (a lot /much) less active
% sweat gland(s) produce/ooze out  (a lot/much) less

% the pattern allows something like sweat glands become less
% but it is unlikely that something like this appears so no harm

question(6,b,0): rule(3,3,1):: complete ==>[w(V):member(V,[sweat,water]), w(Y):member(Y,[gland,glands]),?(w(W):member(W,[also,then])),w(X):member(X,[are,become,becomes,is,produce,ooze]),?(w(a)),?(w(lot)),?(w(much)),w(less),?(w(K):member(K,[active]))].
	
	
        
	
	

% sweat gland(s) (also/then) decrease(s)/lower their/its activity

question(6,b,0): rule(3,4,1):: complete ==>[w(V):member(V,[sweat,water]), w(Y):member(Y,[gland,glands]),?(w(W):member(W,[also,then])),w(X):member(X,[decrease,decreases,lower,lowers]), c(np:[head=activity])].
	
	
        
% (sweat) gland doesn't/does not release as much water/sweat
question(6,b,0): rule(3,5,1):: complete ==>[c(vg:[head=release,pol=neg]), ?(w(as)), w(much), w(W):member(W,[water,sweat])].


% sweat pores (s) close /closes /shut etc

question(6,b,0): rule(3,6,1):: complete ==>[w(sweat),w(P):member(P,[pore,pores]), w(C):member(C,[close,closes,shut,shuts])].

% close/closes/shuts down sweat pores

question(6,b,0): rule(3,7,1):: complete ==>[c(vg:[head=C,pol=pos]):member(C,[close,closes,shut,shuts]),c(np:[head=P,mods=L]):(member(P,[pore,pores]),member(sweat,L))].

% NOTE
% maybe we should go back to all rules and consider the 'negative way'
% of saying the same thing like in the last equivalence class

% equivalence class 4
% [ increased metabolic rate]

% increased/intensified/enhanced/higher/bigger/more metabolism
% increases the/our/its metabolism

question(6,b,0): rule(4,1,1):: complete ==>[w(V):member(V,[increased,'Increased',intensified,'Intensified',enhanced,'Enhanced',higher,'Higher',bigger,'Bigger',more,'More',increasing,'Increasing',intensifying,'Intensifying',enhancing,'Enhancing',increases,'Increases',intensifies,'Intensifies',enhances,'Enhances']), c(np:[head=metabolism])].

% same as above but it is one np with the rest as modifiers
question(6,b,0): rule(4,11,1):: complete ==>[c(np:[head=metabolism,mods=[L]]):member(L,[increased,'Increased',intensified,'Intensified',enhanced,'Enhanced',higher,'Higher',bigger,'Bigger',more,'More',increasing,'Increasing',intensifying,'Intensifying',enhancing,'Enhancing',increases,'Increases',intensifies,'Intensifies',enhances,'Enhances'])].
  

% increased/intensified/enhanced/higher/bigger/more metabolic rate/level

question(6,b,0): rule(4,2,1):: complete ==>[c(np:[mods=[E,L]]):(member(E,[increased,'Increased',intensified,'Intensified',enhanced,'Enhanced',higher,'Higher',bigger,'Bigger',more,'More',increasing,'Increasing']), member(L,[metabolic]))].

% increases metabolic rate


question(6,b,0): rule(4,21,1):: complete ==>[c(vg:[head=V,pol=pos]):member(V,[increases,'Increases',intensifies,'Intensifies',enhances,'Enhances',increase,'Increase',intensify,'Intensify',enhance,'Enhance']), c(np:[mods=[metabolic]])].

% when vg is not formed

question(6,b,0): rule(4,211,1):: complete ==>[w(W):member(W,[increase,intensify,enhance,'Increase','Intensify','Enhance']),c(np:[mods=[metabolic]])].
					       
% metabolism (rate/level/reaction(s)) (would) increase(s)/intensifie(s)
question(6,b,0): rule(4,3,1):: complete ==>[w(metabolism),?(w(W):member(W,[rate,level,reaction,reactions])),c(vg:[head=V,pol=pos]):member(V,[increases,'Increases',increase,'Increase',intensify,'Intensify',intensifies,'Intensifies'])].
  
question(6,b,0): rule(4,31,1):: complete ==>[w(metabolism),?(w(W):member(W,[rate,level,reaction,reactions])), w(I):member(I,[increases,'Increases'])].

% same as above
%   metabolic (rate/level/reaction(s)) (would) increase(s)/intensifie(s)/

question(6,b,0): rule(4,4,1):: complete ==>[w(M):member(M,[metabolic,'Metabolic']),?(w(W):member(W,[rate,level,reaction,reactions])),c(vg:[head=V]):member(V,[increases,increase,intensify,intensifies])].
  
  question(6,b,0): rule(4,41,1):: complete ==>[w(M):member(M,[metabolic,'Metabolic']),?(w(W):member(W,[rate,level,reaction,reactions])),w(increases)].

% metabolism (rate/level/reaction) works/is faster/higher/more/enhanced/increased/bigger/intensified

question(6,b,0): rule(4,5,1):: complete ==>[w(M):member(M,[metabolism,'Metabolism']),?(w(W):member(W,[rate,level,reaction,reactions])), c(vg:[head=J,pol=pos]):member(J,[is,works,work,gets,get,becomes,become]),w(V):member(V,[faster,higher,more,enhanced,increased,bigger,intensified])].


% same as above with 'metabolic' instead of 'metabolism'
question(6,b,0): rule(4,6,1):: complete ==>[w(M):member(M,[metabolic,'Metabolic']),?(w(W):member(W,[rate,level,reaction,reactions])),c(vg:[head=J,pol=pos]):member(J,[is,works,work,become,becomes,get,gets]),w(V):member(V,[faster,higher,more,enhanced,increased,bigger,intensified])].

% equivalence class 5
% [hairs standing]

% hair(s) (on/in/at the(surface of)/our/the skin(s) (surface)) erect/stand ...
% hair(s) to erect/stand....
% hair(s) on/at the surface of the/our skin

question(6,b,0): rule(5,1,1):: complete ==>[w(H):member(H,[hair,hairs,'Hairs','Hair']),?(w(P):member(P,[on,in,at])), ?(c(np:[head=S]):member(S,[surface,body,skin,bodies,skins])), ?(w(_Of)),?(c(np:[head=A]):member(A,[skin,surface])),?(w(J):member(J,[become,becomes,get,gets])),c(vg:[head=V]):member(V,[erect,stand,erects,stands,standing,erecting,protrude,protruding,protrudes,raise,raised,straighten,'Straighten',contract,contracting,contracts,sticks,stick,sticking])].


% many times the vg is not formed so I've added other rules when it is either a VB or VBP -  
/*
question(6,b,0): rule(5,11,1):: complete ==>[w(H):member(H,[hair,hairs,'Hairs','Hair']),?(w(P):member(P,[on,in])), ?(c(np:[head=S]):member(S,[surface,body,skin,bodies])),w(V):member(V,[erect,stand,protrude,straighten,'Straighten',raise])].
	*/

question(6,b,0): rule(5,111,1):: complete ==>[w(H):member(H,[hair,hairs,'Hairs','Hair']),?(w(P):member(P,[on,in,at])), ?(w(_Det)),?(w(S):member(S,[surface,body,skin,bodies,skins])),?(w(surface)),w(V):member(V,[erect,stand,protrude,raise,straighten,'Straighten',contract,stick])].
	

% hair muscle(s) lift/move (the) hair up/upright/upwardly
question(6,b,0): rule(5,2,1):: complete ==>[w(H):member(H,[muscle,muscles]), c(vg:[head=V]):member(V,[lift,move,lifts,moves,moving,lifting,moved,lifted,pull,pulls,pulling,contract,contracts,contracting,stick,sticking,sticks]), c(np:[head=hair]),w(K):member(K,[up,upright,upwardly,higher])].		   
question(6,b,0): rule(5,21,1):: complete ==>[w(H):member(H,[muscle,muscles]), w(V):member(V,[lift,move,pull,contract]), c(np:[head=hair]),w(K):member(K,[up,upright,upwardly,higher])].		   

% hair muscle lift/move the hair to/in an upright position
					   
question(6,b,0): rule(5,3,1):: complete ==>[w(H):member(H,[muscle,muscles]), c(vg:[head=V]):member(V,[lift,move,lifts,moves,moving,lifting,moved,lifted,pull,pulls,pulling,raised,raises,raise,contract,contracts,contracting]), c(np:[head=hair]), w(I):member(I,[to,in]), c(np:[mods=[K]]):member(K,[upwardly,upright,higher])].

question(6,b,0): rule(5,31,1):: complete ==>[w(H):member(H,[muscle,muscles]), w(V):member(V,[lift,move,pull,raise,contract]), c(np:[head=hair]), w(I):member(I,[to,in]), c(np:[mods=[K]]):member(K,[upwardly,upright,higher])].

% standing/stand the hairs up
question(6,b,0): rule(5,4,1):: complete ==> [c(vg:[head=S,pol=pos]):member(S,[standing,stand,stands,erect,erecting,erects,lift,lifting,pulling,moving,moves,move,lifts,raise,raises,raised,contracted,contracts,contract,contracting,stick,sticks,sticking]), c(np:[head=H]):member(H,[hair,'Hairs','Hair',hairs]),?(w(W):member(W,[up,upright,upwardly,higher]))].

question(6,b,0): rule(5,41,1):: complete ==> [w(S):member(S,[stand,raise,erect,lift,move,contract]), c(np:[head=H]):member(H,[hair,'Hairs','Hair',hairs]),?(w(W):member(W,[up,upright,upwardly,higher]))].

% the hairs muscles (all over your body) will allow them to stand
% one instance that I wrote a rule for -- it may overgenerate

question(6,b,0): rule(5,5,1):: complete ==> [c(np:[head=M,mods=[H]]):(member(H,[hair,'Hairs','Hair',hairs]),member(M,[muscle,muscles])),?(w(_All)),?(w(_Over)),?(w(_Your)),?(w(_Body)), c(vg:[head=A,pol=pos]):member(A,[allow,allows,permit,permits,make,makes]), w(Pr):member(Pr,[them,it]), c(vg:[head=S,pol=pos]):member(S,[stand,erect,lift,move,contract,stick])]. 

% the hairs effect to trap (the) air
question(6,b,0): rule(5,6,1):: complete ==> [c(np:[head=K,mods=M]):(feature_value(M,[[hairs],[hair],[muscle],[muscles]]),member(K,[hair,hairs,effect,aim])),?(w(_To)),w(trap),?(w(_W)),w(air)].

% raising hair for/to (extra layer of) insulation/insulate
question(6,b,0): rule(5,7,1):: complete ==> [c(np:[stem=hair,mods=[raising]]),w(F):member(F,[for,to]),?(c(np:[stem=layer])),?(w(_O)),w(I):member(I,[insulation,insulate])].

/*
% our/the hairs stick on end
question(6,b,0): rule(5,7,1):: complete ==> [c(np:[head=H]):member(H,[hair,hairs,'Hair','Hairs']),w(stick)].
*/
% equivalence class 6
% in this question both vasoconstriction and its explanation belong to the same class
% [vasoconstriction or explanation] 

/*
% set 1 - vasoconstriction
question(6,b,0): rule(6,1,1):: complete ==>[w(vasoconstriction)].

% set 2 - blood vessels 'vasoconstrict'	
question(6,b,0): rule(6,2,1):: complete ==>[c(np:[head=N,mods=[blood]]):member(N,[vessels]),c(vg:[pol=pos,head=H1]):member(H1,[vasoconstrict, vasoconstricts])].

% set 3 - ducts shut stopping blood circulation /blood vessels close up/constricts/cut off the blood capillary loop

% ducts/vessels shut/close (up)/constricts/cut off
% implicitly we are talking about blood capillaries and less blood flowing

question(6,b,0): rule(6,3,1):: complete ==>[w(W):member(W,[ducts,vessels]),c(vg:[head=V]):member(V,[shut,close,constrict,cut])].
*/

% set 1 - vasoconstriction
question(6,b,0): rule(6,1,1):: complete ==>[w(V):member(V,[vasoconstriction,'Vasoconstriction','VasoConstriction','VASOCONSTRICTION'])].


% we will assume in this context that vessels definitely should be blood vessels so we are going to remove it from previous rule -- see rule(1,5,1)
% also since the question asks about blood vessels then when the students
% answer with 'they..' we will assume they refer to blood vessels
question(6,b,0): rule(6,2,1):: complete ==>[c(np:[head=N]):member(N,[vessels,vessel,they,'They','Vessels',capillaries,'Capillaries']),?(w(K):member(K,[close,near,adjacent,nearby,next])),?(w(_To)),?(c(np:[head=J]):member(J,[skin,surface])),c(vg:[pol=pos,head=H1]):member(H1,[vasoconstrict, vasoconstricts])].
	
	
	



%[ explanation of vasoconstriction]
% set 1 - ducts shut stopping blood circulation /blood vessels close up/constricts/cut off the blood capillary loop

% ducts/vessels/capillary loop (near the skin/surface/ near the skin surface/ near the surface of the skin)/below the fatty layer shut/close (up)/constricts/cut off
% implicitly we are talking about blood capillaries and less blood flowing
% hence we can write: vessels, they etc 

question(6,b,0): rule(6,3,1):: complete ==>[w(W):member(W,[ducts,vessels,vessel,they,capillaries,network,loop,loops,'They','Vessels']),?(w(_L)),?(w(_To)),?(c(np:[head=layer])) ,c(vg:[head=V]):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing,restrict,restricting,restricts]),?(w(_Of)), ?(c(np:[head=skin])),?(c(np:[head=flow,mods=[blood]]))].

% ?(( ; ))  or (?( );?( )) to put the last rule and the next one into one did not work so here we write it again
	
question(6,b,0): rule(6,4,1):: complete ==>[w(W):member(W,[ducts,vessels,vessel,they,capillaries,network,loop,loops,'They','Vessels']),?(w(_L)),?(w(_To)),?(c(np:[head=S]):member(S,[surface,skin])) ,c(vg:[head=V]):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing,restrict,restricting,restricts]),?(w(_Of)), ?(c(np:[head=skin])),?(c(np:[head=flow,mods=[blood]]))].
	

question(6,b,0): rule(6,5,1):: complete ==>[w(W):member(W,[walls]),?(w(of)),?(w(E):member(E,[vessels,vessel,capillaries,capillary])),c(vg:[head=V]):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing])].

	

% cut off/shutting/closing... all/most/a lot of/a large amount of
% the blood (off)
% the reason I didn't put this into a vg is that the tagger sometimes fail
% to tag a VBP and a vg is not formed so no matches occur. I know this from
% earlier rules where I restricted the entity to a vg
question(6,b,0): rule(6,6,1):: complete ==>[w(V):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing,stop,stops,stopping]), ?(w(_Off)),?(w(_O)),?(w(_I)),?(w(_P)),c(np:[head=blood]),?(w(off))].


% blood moving through the blood capillary loop is cut off 
question(6,b,0): rule(6,7,1):: complete ==>[c(np:[head=blood]),?(w(_W1)),?(w(_W2)), c(np:[head=loop]),c(vg:[pol=pos,head=V]): member(V,[cut,constricted,shut,closed,squeezed,contracted,constringed,compressed,compact,narrowed])].

% this is not quite right but examiners accept it -it may also belong to
% equivalence class 3
% the blood vessels supply/carry less blood to the skin (capillaries)/surface
question(6,b,0): rule(6,8,1):: complete ==> [c(np:[head=V]):member(V,[vessels,capillaries,they,vessel]), c(vg:[head=S]):member(S,[supply,supplying,supplied,providing,provided,provide,carry,carrying,carried]),w(L):member(L,[less,'Less']),w(blood),?(w(_W)),(c(np:[head=C,mods=K]):(member(C,[capillary,capillaries,loop]),member(K,[[skin],[skin,capillary]])); c(np:[head=Q]):member(Q,[skin,surface]))].

% the blood vessels will prevent blood from flowing up the blood capillary loop
question(6,b,0): rule(6,9,1) :: complete ==> [c(vg:[head=W,pol=pos]): member(W,[stopping,stop,stops,preventing,prevents,prevent]),w(blood),?(w(_From)),c(vg:[head=J]):member(J,[flowing,pumping,circulating,going,coming]),?(w(_O)),c(np:[head=K]):member(K,[loop,loops,capillary,capillaries])].
 
% the blood vessels/capillaries etc reduce in width/get smaller/thinner (one synonym to 'constrict')
question(6,b,0): rule(6,10,1) :: complete ==> [c(np:[head=V]):member(V,[vessels,vessel,'Vessels',capillaries,capillary,they,'They']),c(vg:[pol=pos,head=R]):member(R,[reduce,get,becomes,reduces,gets]),?(w(_In)),w(F):member(F,[width,smaller,thinner])].

% the diameter of the blood vessels becomes/is narrower/smaller
question(6,b,0): rule(6,11,1) :: complete ==> [c(np:[head=D]):member(D,[diameter]),?(w(_Of)),c(np:[head=V]):member(V,[vessels,vessel,'Vessels',capillaries,capillary,they,'They']),c(vg:[pol=pos,head=R]):member(R,[get,gets,become,becomes]),?(w(_In)),w(F):member(F,[smaller,thinner,narrower])].



full_mark(question(6,b,0),1).

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/6(b).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/data/6(b).pl').
