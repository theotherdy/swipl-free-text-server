% rules for question 6 (a) higher-tier paper 2001

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


% question 6(a) higher tier paper 2001 -

% equivalence class 1 
% [vasoconstriction] 

% set 1 - vasoconstriction
question(6,a,0): rule(1,1,1):: complete ==>[w(V):member(V,[vasoconstriction,'Vasoconstriction','VasoConstriction','VASOCONSTRICTION'])].
					   
%question(6,a,0): rule(1,11,1):: complete ==>[w('VasoConstriction')].
%question(6,a,0): rule(1,111,1):: complete ==>[w('Vasoconstriction')].

% set 2 - (blood) vessels (near/next to the skin) 'vasoconstrict'

%question(6,a,0): rule(1,2,1):: complete ==>[c(np:[head=N,mods=[blood]]),c(vg:[pol=pos,head=H1])] :-
	%member(H1,[vasoconstrict, vasoconstricts]),
	%member(N,[vessels]).

% we will assume in this context that vessels definitely should be blood vessels so we are going to remove it from previous rule -- see rule(1,5,1)
% also since the question asks about blood vessels then when the students
% answer with 'they..' we will assume they refer to blood vessels
question(6,a,0): rule(1,2,1):: complete ==>[c(np:[head=N]):member(N,[vessels,vessel,they,'They','Vessels',capillaries,'Capillaries']),?(w(K):member(K,[close,near,adjacent,nearby,next])),?(w(_To)),?(c(np:[head=J]):member(J,[skin,surface])),c(vg:[pol=pos,head=H1]):member(H1,[vasoconstrict, vasoconstricts])].
	
	
	
% NOTE the next 3 sets are under equivalence class 'shivering' in the next
% question i.e. 6(b) so maybe they should not be here under this class!!!
/*
% set 3 - muscles contract
% muscles (continuously) twitch/contract
question(6,a,0): rule(1,3,1):: complete ==>[w(W),?(w(K)), c(vg:[head=I])]:-
	member(W,[muscles,muscle]),
	member(K,[continuously,randomly]),
	member(I,[twitch,contract,contracts,contracting]).

% muscles (continuously) start/end up contracting

% question(6,a,0): rule(1,3,2):: complete ==>[w(W)]:-

% (random) contraction(s)
% implicitly: we are talking about muscles

question(6,a,0): rule(1,4,1):: complete ==>[w(W)]:-
	member(W,[contraction,contractions]).
*/
% from the marking scheme : explanation of vasoconstriction is considered
% a separate equivalence class hence

% equivalence class 2
%[ explanation of vasoconstriction]
% set 1 - ducts shut stopping blood circulation /blood vessels close up/constricts/cut off the blood capillary loop

% ducts/vessels/capillary loop (near the skin/surface/ near the skin surface/ near the surface of the skin)/below the fatty layer shut/close (up)/constricts/cut off
% implicitly we are talking about blood capillaries and less blood flowing
% hence we can write: vessels, they etc 
% though the use of arteries is not really correct some examiners accepted that
question(6,a,0): rule(2,1,1):: complete ==>[w(W):member(W,[ducts,vessels,vessel,they,capillaries,network,loop,loops,'They','Vessels',arteries,artery]),?(w(L):(\+ member(L,[expand,stay]))),?(w(To):(\+ member(To,[expand,stay]))),?(c(np:[head=layer])),(c(vg:[pol=pos,stem=V]):member(V,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict]);w(J):member(J,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict])),?(w(_Of)), ?(c(np:[head=skin])),?((c(np:[stem=flow,mods=[blood]]);c(np:[stem=blood])))].

%they/vessels stop (a large amount of) blood/blood flow
question(6,a,0): rule(2,111111,1):: complete ==>[w(W):member(W,[ducts,vessels,vessel,they,capillaries,network,loop,loops,'They','Vessels',arteries,artery]),?(w(_L)),?(w(_To)),?(c(np:[head=layer])),(c(vg:[pol=pos,stem=stop]);w(stop)),?(w(_Of)), ?(c(np:[head=skin])),c(np:[stem=_]),?(w(of)),(c(np:[stem=flow,mods=[blood]]);c(np:[stem=blood]))].

% ?(( ; ))  or (?( );?( )) to put the last rule and the next one into one did not work so here we write it again
	
question(6,a,0): rule(2,1211,1):: complete ==>[w(W):member(W,[ducts,vessels,vessel,they,capillaries,network,loop,loops,'They','Vessels',arteries,artery]),?(w(_L)),?(w(_To)),?(c(np:[head=S]):member(S,[surface,skin])) ,(c(vg:[pol=pos,stem=V]):member(V,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict]);w(J):member(J,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict,stop])),?(w(_Of)), ?(c(np:[head=skin])),?(c(np:[head=flow,mods=[blood]]))].
	

question(6,a,0): rule(2,11,1):: complete ==>[w(W):member(W,[walls]),?(w(of)),?(w(E):member(E,[vessels,vessel,capillaries,capillary])),c(vg:[pol=pos,head=V]):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing])].

	

% cut off/shutting/closing... all/most/a lot of/a large amount of
% the blood (off)
% the reason I didn't put this into a vg is that the tagger sometimes fail
% to tag a VBP and a vg is not formed so no matches occur. I know this from
% earlier rules where I restricted the entity to a vg

% this may overgenerate since we don't specify a subject
question(6,a,0): rule(2,121,1):: complete ==>[w(V):member(V,[constrict,constricts,shut,shuts,close,closes,cut,cuts,squeeze,squeezes,contract,contracts, constringe,constringes, compress,compresses, compact,compacts, narrow,narrows,constricting,shutting,closing,cutting,squeezing,contracting,constringing,compressing,compacting,narrowing]),?(w(Off):member(Off,[off,a,all,most])),?(w(O):member(O,[a,all,most,lot,large,big])),?(w(I):member(I,[of,amount,quantity])),?(w(P):member(P,[of])),c(np:[head=blood]),?(w(off))].
%stop,stops,stopping

% blood moving through the blood capillary loop is cut off 
question(6,a,0): rule(2,111,1):: complete ==>[c(np:[head=blood]),?(w(_W1)),?(w(_W2)), c(np:[head=loop]),c(vg:[pol=pos,head=V]): member(V,[cut,constricted,shut,closed,squeezed,contracted,constringed,compressed,compact,narrowed])].

% the following is not quite right but examiners accept it like candidate 44
%-it may also belong to
% equivalence class 3
% the blood vessels supply/carry less blood to the skin (capillaries)/surface
question(6,a,0): rule(2,1111,1):: complete ==> [c(np:[head=V]):member(V,[vessels,capillaries,they,vessel,capillary]), (c(vg:[pol=pos,head=S]):member(S,[supply,supplying,supplied,providing,provided,provide,carry,carrying,carried]);w(J):member(J,[supply,provide,carry])),w(L):member(L,[less,'Less']),w(blood),?(w(_W)),(c(np:[head=C,mods=K]):(member(C,[capillary,capillaries,loop]),member(K,[[skin],[skin,capillary]])); c(np:[head=Q]):member(Q,[skin,surface]))].

% the blood vessels will prevent blood from flowing up the blood capillary loop
question(6,a,0): rule(2,11111,1) :: complete ==> [c(vg:[head=W,pol=pos]): member(W,[preventing,prevents,prevent]),w(blood),?(w(_From)),c(vg:[pol=pos,head=J]):member(J,[flowing,pumping,circulating,going,coming]),?(w(_O)),c(np:[head=K]):member(K,[loop,loops,capillary,capillaries])].
 %stopping,stop,stops
% the blood vessels/capillaries etc reduce in width/get smaller/thinner (one synonym to 'constrict')
question(6,a,0): rule(2,2,1) :: complete ==> [c(np:[head=V]):member(V,[vessels,vessel,'Vessels',capillaries,capillary,they,'They']),c(vg:[pol=pos,head=R]):member(R,[reduce,get,becomes,reduces,gets]),?(w(_In)),w(F):member(F,[width,smaller,thinner])].

% the diameter of the blood vessels becomes/is narrower/smaller
question(6,a,0): rule(2,3,1) :: complete ==> [c(np:[head=D]):member(D,[diameter]),?(w(_Of)),c(np:[head=V]):member(V,[vessels,vessel,'Vessels',capillaries,capillary,they,'They']),c(vg:[pol=pos,head=R]):member(R,[get,gets,become,becomes]),?(w(_In)),w(F):member(F,[smaller,thinner,narrower])].

			
%the blood vessels near the surface of the skin to tell them to close off
question(6,a,0): rule(2,4,1) :: complete ==> [c(np:[stem=V]):member(V,[vessel,capillary]),_O/'IN',c(np:[stem=surface]),?(w(_I)),c(np:[stem=skin]),c(vg:[pol=pos]),?(_J/'PRP'),c(vg:[pol=pos,stem=C]):member(C,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact, narrow,stop]),?(c(np:[stem=blood]))].

 % less blood (is pumped/flows) round/through the vessel(s)/them  (assuming 'them' refers to vessels)
% it has been accepted by examiners 

question(6,a,0): rule(2,5,1):: complete ==>[c(np:[head=blood,mods=[B]]):member(B,[less,'Less']),?(c(vg:[pol=pos,head=H1]):member(H1,[flows, flow, flowing,circulate,circulates,circulating,circulated,pump,pumps,pumping,pumped])),?(w(_W)), c(np:[head=V]):member(V,[vessel,vessels,capillaries,them,loop,loops])].
						      

% equivalence class 3
% [less blood flows at/to the surface]

% set 1 - less blood flows (close/next) at/to /near the surface

% less blood ... where 'less' is considered to be mods 
question(6,a,0): rule(3,1,1):: complete ==>[c(np:[head=blood,mods=List]):member(B,List),member(B,[less,'Less',minimum,minimal]),c(vg:[pol=pos,stem=H1]):member(H1,[flow,circulate,pump,transport]),?(w(W):member(W,[close,near,next,nearby])),?(w(_To)),c(np:[head=S]):member(S,[skin,surface])].


% sometimes last rule fails because some np or vg fails to be formed hence we added the following rule

question(6,a,0): rule(3,11,1):: complete ==>[w(L):member(L,['Less',less,minimum,minimal]),w(blood),w(F):member(F,[flows,flow,flowing,circulate,circulates,circulating,pump,pumps,pumping,transported,transport,transports,circulated,pumped]),_P/'IN',c(np:[stem=S]):member(S,[skin,surface])].
					      
/*  is there still a case where less is considered to be det?
% less blood ... where 'less' is considered to be modifier for blood 
question(6,a,0): rule(3,11,1):: complete ==>[c(np:[head=blood,mods=[B]]),c(vg:[pol=pos,head=H1]),?(w(W)), c(np:[head=surface])] :-
	member(H1,[flows, flow, flowing,circulate,circulates,circulating,pump,pumps,pumping]),
%	member(W,[close,near,next]),
	member(W,[at]),
	member(B,[less,'Less']).
*/

% there is less blood flowing near/ next the surface
%less is considered part of the vg but   
question(6,a,0): rule(3,111,1):: complete ==>[w(B):member(B,[less,'Less',minimum,minimal]),c(np:[head=blood]),c(vg:[pol=pos,head=H1]):member(H1,[flows,flow,flowing,circulate,circulates,circulating,pump,pumps,pumping,moving,coming,going]),?(w(W):member(W,[close,near,next,nearby])),?(w(_A)),c(np:[head=S]):member(S,[surface,skin])].
	
	

	
/*
question(6,a,0): rule(3,1111,1):: complete ==>[w(B),c(np:[head=blood]),c(vg:[pol=pos,head=H1]),?(w(W)), c(np:[head=surface])] :-
	member(H1,[flows, flow, flowing,circulate,circulates,circulating,pump,pumps,pumping]),
%	member(W,[close,near,next]),
	member(W,[at]),
	member(B,[less,'Less']).
*/

/* this has been removed to equivalence class 2
% less blood (is pumped/flows) round/through the vessel(s)/them  (assuming 'them' refers to vessels)
%(it has been accepted by examiners so I think it belongs to the equivalence class: explanation of vasoconstriction)

question(6,a,0): rule(3,11111,1):: complete ==>[c(np:[head=blood,mods=[B]]):member(B,[less,'Less']),?(c(vg:[pol=pos,head=H1]):member(H1,[flows, flow, flowing,circulate,circulates,circulating,circulated,pump,pumps,pumping,pumped])),?(w(_W)), c(np:[head=V]):member(V,[vessel,vessels,capillaries,them,loop,loops])].
*/

%	member(W,[through,round]),
%	member(W,[at]),
	
	

% less blood through the vessels is pumped etc

% set 2 - more blood is kept/stays (lower down) away/far from the (modifiers) surface
question(6,a,0): rule(3,2,1) :: complete ==>  [c(np:[head=blood,mods=List]):(member(B,List),member(B,[more,'More'])),c(vg:[pol=pos,head=H1]):member(H1,[kept]), ?(w(lower)),?(w(down)), ?(w(W):member(W,[away,far,further])), w(from), c(np:[head=surface])].
	
	

% set 3 - more/the blood is kept/stays/stayed/travels/circulates deep in/inside/under the skin (the body)
question(6,a,0): rule(3,3,1) :: complete ==> [c(np:[head=blood]),c(vg:[pol=pos,stem=V]):member(V,[keep,stay,travel,circulate]), ?(w(deep)), w(K):member(K,[inside,under]),?(c(np:[stem=skin]))].
	
	
% set 4 - blood doesn't/will/is not  circulate/flow etc  (so) near/close to the surface/skin etc  (see set 1 - this is saying the same thing in a negative mode)
%  - blood is not (flowing/circulating/..) near the surface/skin
question(6,a,0): rule(3,4,1) :: complete ==> [c(np:[head=blood]),c(vg:[pol=neg,head=V]):member(V,[circulate,flow,flowing,circulating,pumping,pump,go,going,coming,come,travel,travelling]), ?(w(so)),?(w(K):member(K,[near,close])),?(w(to)), c(np:[head=W]):member(W,[surface,skin])].
          
% they/vessels/capillaries...do not let/allow blood flow so near the surface
question(6,a,0): rule(3,41,1) :: complete ==> [c(np:[head=V]):member(V,[they,vessels,vessel,capillaries,loop,loops,capillary]), c(vg:[pol=neg,head=W]):member(W,[let,allow]),c(np:[head=blood]),?(c(vg:[pol=pos,head=F]):member(F,[flow,pump,circulate,go,travel,come])),?(w(_So)),w(J):member(J,[close,near,next,nearby,adjacent]),?(w(_To)), c(np:[head=P]):member(P,[surface,skin])]. 

% set 5 - decreasing/reducing/decrease/reduce (the amount of) blood (flow) (that is sent to the blood vessels) near/to the surface/towards skin or reaching skin



question(6,a,0): rule(3,5,1) :: complete ==> [c(vg:[pol=pos,head=V]):member(V,[decreasing,reducing,decrease,reduce,reduces,decreases]),?(c(np:[head=amount])),?(w(of)),c(np:[stem=blood]),?(w(L):member(L,[flow,flowing,pump,pumping,circulate,circulating,travel,travelling,go,going,come,coming])),?(w(_That)), ?(c(vg:[pol=pos,head=sent])), ?(w(_To)),?(c(np:[head=J]):member(J,[vessels,vessel,capillaries,'Vessels',loop,loops,capillary])),w(I):member(I,[close,near,adjacent,to,towards,reaching]),c(np:[head=K]):member(K,[skin,surface])].
 
 
 % since it seems we cannot start a RHS with a disjunction and sometimes the vg fails then we write another alternative for rule(3,5,1)
question(6,a,0): rule(3,5111,1) :: complete ==> [w(V):member(V,[decreasing,reducing,decrease,reduce]),?(c(np:[head=amount])),?(w(of)),c(np:[stem=blood]),?(w(L):member(L,[flow,flowing,pump,pumping,circulate,circulating,travel,travelling,go,going,come,coming])),?(w(_That)), ?(c(vg:[pol=pos,head=sent])), ?(w(_To)),?(c(np:[head=J]):member(J,[vessels,vessel,capillaries,'Vessels',loop,loops,capillary])),w(I):member(I,[close,near,adjacent,to,towards,reaching]),c(np:[head=K]):member(K,[skin,surface])].

/*
question(6,a,0): rule(3,51,1) :: complete ==> [c(vg:[head=V]),?(c(np:[head=amount])),?(w(of)),w(blood),?(w(L)),w(I),c(np:[head=K])]:-
 member(V,[decreasing,reducing,decrease,reduce,reduces,decreases]),
 member(I,[to,towards,reaching]), 
 member(K,[skin,surface]),
 member(L,[flow,flowing,pump,pumping]).
*/

% blood vessels pump the blood further away from the skin surface
% though this does not seem to me to imply 'reduce' it only implies 'does not pump blood near the surface' which is biologically not true as there is always
% blood being pumped there - besides if one wants to accept this one should
% accept set 5 in equivalence class 3 or aren't they the same?
% but in some answers like #13 this is getting a mark

% be careful something like '...the blood ...' will fail so maybe these
% should be separated in two rules

question(6,a,0): rule(3,51,1) :: complete ==> [c(vg:[pol=pos,head=V]):member(V,[increasing,increase,increases,add,increment,step-up,adding,adds,incrementing,increments,steps-up,stepping-up]),?(c(np:[head=amount])),?(w(of)),w(blood),?(w(L):member(L,[flow,flowing,pump,pumping,circulate,circulating,go,going,travel,travelling,come,coming])),w(I):member(I,[far,further,farther,distant,remote]),?(w(J):member(J,[from])),c(np:[head=K]): member(K,[skin,surface])].
 
 
question(6,a,0): rule(3,511,1) :: complete ==> [w(pump),?(c(np:[head=amount])),?(w(of)),c(np:[head=blood]),w(I):member(I,[far,further,farther,distant,remote]),?(w(away)),?(w(J):member(J,[from])),c(np:[head=K]):member(K,[skin,surface])].
 
  
 

% set 6 
% stopping/stop/stops much/ a lot of blood (from) reaching/arriving at the skin/surface
% not quite right as there is always some blood reaching the skin
% but it is acceptable by examiners - e.g. candidate 114
question(6,a,0): rule(3,6,1) :: complete ==> [w(W):member(W,[stopping,stop,stops,preventing,prevents,prevent,shutting,shut,close,closing]),?(w(_J)),?(w(_F)),?(w(_K)),w(blood),?(w(_W)),?(w(J):member(J,[reach,reaching,arrive,arriving,touching,touch,contacting,contact])),?(w(_O)),c(np:[head=K]):member(K,[skin,surface])].
 
 
 

% blood (flow) is prevented (from flowing) through/by the blood vessels (from flowing/coming) in/near to the skin/surface
question(6,a,0): rule(3,61,1) :: complete ==> [c(np:[head=N]):member(N,[blood,'Blood',flow]),c(vg:[passive=yes,head=W,pol=pos]):member(W,[stopped,prevented]),?(w(_From)),?(w(K):member(K,[flowing,pumping,circulating,coming,going,travelling])),?(w(_W1)),?(c(np:[head=V]): member(V,[vessels,vessel,loop,loops,'Vessels',capillaries,capillary])),?(w(_From)),?(w(K):member(K,[flowing,pumping,circulating,coming,going,travelling])),?(w(_DEEP)),w(I):member(I,[in,into,inside,near,close,next]),?(w(_To)),c(np:[head=Q]):member(Q,[skin,surface])].

% blood is made to flow further from the skin 

question(6,a,0): rule(3,7,1):: complete ==>[c(np:[head=blood]), ?(w(_W1)),?(w(_W2)),?(w(_W3)),c(vg:[pol=pos,head=V]):member(V,[flow,flows,flowing,pump,pumps,pumping,circulate,circulating,circulates,flown,pumped,circulated,come,comes,goes,go,going,coming,travels,travel,travelling]),w(F):member(F,[further,away,far,furthest]),w(from),c(np:[head=Q]):member(Q,[skin,surface])].

% blood flows lower down away from the surface
question(6,a,0): rule(3,8,1):: complete ==>[c(np:[head=blood]),c(vg:[pol=pos,stem=S]):member(S,[flow,pump,circulate,come,go,travel]),?(w(_Lower)),?(w(_Down)),w(A):member(A,[away,far,further,furthest]),?(w(from)),c(np:[stem=F]):member(F,[surface,skin])].

% vessels (narrow and) carry less blood to the surface/skin

question(6,a,0): rule(3,9,1):: complete ==>[c(np:[stem=V]):member(V,[vessel,capillary]),c(vg:[pol=pos,stem=_K]),_P/'CC',c(vg:[pol=pos,stem=C]):member(C,[carry,hold]),c(np:[stem=blood,mods=[L]]):member(L,[less,'Less']),?(w(_U)),c(np:[stem=S]):member(S,[skin,surface])].
					    
% equivalence class 4
%[ less heat loss to air/from blood etc]

% set 1  - less heat loss to air/to the surface/surrounding
%        - less heat loss from the blood
% N.B.'to air' (air will be tagged as a verb so this has to be 'the air')
% if it occurs in students training data then the rule has to be modified

% less heat loss to air/to the surface/surrounding
question(6,a,0): rule(4,1,1):: complete ==>[c(np:[head=H2,mods=[E,L]]):(member(H2,[loss]),member(L,[heat]),member(E,[less,'Less',minimum,minimal])), ?(w(_To)), c(np:[head=H1]):member(H1,[air,surface,surrounding])].  %?(w(from)),?(c(np:[head=blood]))]:-
        

% less heat loss from blood (to the air): less heat are modifiers for loss
question(6,a,0): rule(4,2,1):: complete ==>[c(np:[head=H2,mods=[E,L]]):(member(H2,[loss]),member(L,[heat]),member(E,[less,'Less',minimum,minimal])),?(w(from)),c(np:[head=blood])].
       	
	
	

% less heat is lost (to the air) from blood (to the air):'less is a modifier' 
question(6,a,0): rule(4,3,1):: complete ==>[c(np:[head=L,mods=R]):(member(L,[heat]),reverse(R,[A|_]),member(A,[less,'Less',minimal,minimum])),c(vg:[pol=pos,head=H2]):member(H2,[lost]),?(w(_To)), ?(c(np:[head=H1]):member(H1,[air,surface,surrounding])), ?(w(from)),c(np:[head=blood])].
        
	
	
	

% less heat (to the surrounding) from blood is lost 
question(6,a,0): rule(4,4,1):: complete ==>[c(np:[head=L,mods=[A]]):(member(L,[heat]),member(A,[less,'Less',minimal,minimum])), ?(w(_W)),?(c(np:[head=H1]):member(H1,[air,surface,surrounding,skin])),?(w(from)),c(np:[head=blood]),c(vg:[pol=pos,head=H2]):member(H2,[lost])].
	

% less heat is lost to surrounding etc  'less is a modifier' 
question(6,a,0): rule(4,5,1):: complete ==>[c(np:[head=L,mods=[A]]):(member(L,[heat]),member(A,[less,'Less'])), c(vg:[pol=pos,stem=lose]),?(w(_To)), c(np:[head=H1]):member(H1,[air,surface,surrounding,skin])]. %?(w(from)),c(np:[head=blood])]:-
        
	
	
	

% there is less heat lost .... from blood
%'less seems to be considered part of vg' 
question(6,a,0): rule(4,6,1):: complete ==>[w(A):member(A,[less,'Less']),c(np:[head=L]):member(L,[heat]),w(H2):member(H2,[lost]),?(w(to)), ?(c(np:[head=H1]):member(H1,[air,surface,surrounding])), ?(w(from)),c(np:[head=blood])].
        
	
% there is less heat lost ..to air ...
%'less seems to be considered part of vg' 
question(6,a,0): rule(4,7,1):: complete ==>[w(A):member(A,[less,'Less']),c(np:[head=L]):member(L,[heat]),w(H2):member(H2,[lost]),?(w(to)), c(np:[head=H1]):member(H1,[air,surface,surrounding])].
        

% heat in the blood is kept in the body and not allowed to escape into the air

question(6,a,0): rule(4,8,1):: complete ==>[w(heat),?(w(_W)),c(np:[head=blood]),c(vg:[pol=pos,head=V]):member(V,[kept]),?(w(_H2)),c(np:[head=body])].
        %member(H1,[air,surface,surrounding]),
	

% a similar rule is written for eq. class 3 : rule(3,3,1).
% there to say that less blood flows at the surface (blood is kept inside)
% and here to say less heat is lost from the blood  (warm blood is kept inside)
% warm blood is kept in the blood vessels further
question(6,a,0): rule(4,9,1):: complete ==>[c(np:[head=blood,mods=[L]]):member(L,[warm,hot]), c(vg:[pol=pos,head=V]):member(V,[kept]),w(I):member(I,[in,into,inside]),c(np:[head=V]):member(V,[vessels,vessel,capillaries]),w(W):member(W,[further,away,deep,inside,far])].

% not near/next to the skin where (the) heat can be lost
question(6,a,0): rule(4,10,1):: complete ==>[w(not), w(W):member(W,[close,near,next,nearby]),c(np:[head=C]):member(C,[skin,surface]),?(w(where)),?(w(_W)),w(heat),c(vg:[pol=pos,head=lost])].
	
	

% not (to) lose (much/a lot of) heat energy through the skin/surface
question(6,a,0): rule(4,11,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[lose]), ?(w(_A)),?(w(_Lot)),?(w(of)), w(heat),?(w(_Energy)),w(T):member(T,[at,through,from]),c(np:[head=S]):member(S,[skin,surface])].


% not too much/a lot of  heat is lost through the skin/surface
question(6,a,0): rule(4,12,1):: complete ==>[w(not),?(w(_A)),?(w(_Lot)),?(w(_Of)),w(heat),c(vg:[pol=pos,stem=lose]),?(w(_W)), c(np:[head=S]):member(S,[skin,surface])].

% not (to) lose (much/a lot of) heat (energy) from (the) blood/through the skin
question(6,a,0): rule(4,13,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[lose]),?(w(_A)),?(w(_Lot)),?(w(of)),w(heat),?(w(_Energy)),w(T):member(T,[at,through,from]),c(np:[head=S]):member(S,[blood,skin])].


% not too much/a lot of heat is lost from (the) blood/through the skin
question(6,a,0): rule(4,14,1):: complete ==>[w(not),?(w(_A)),?(w(_Lot)),?(w(_Of)),w(heat),c(vg:[pol=pos,head=lost]),?(w(_W)), c(np:[head=S]):member(S,[blood,skin])].

%

% if the features of any np failed to be filled this will succeed creating
% overgeneration
%  less radiation/conduction/convection
question(6,a,0): rule(4,15,1):: complete ==> [c(np:[det=less,head=H2]):member(H2,[radiation,conduction,conversion])].
	
					   
%  heat is/becomes less likely to be lost by conduction/radiation/convection

question(6,a,0): rule(4,16,1):: complete ==> [w(A):member(A,[heat,'Heat']), w(V):member(V,[is,become,becomes]), w(less), w(likely), w(to), w(be),w(lost), w(by), w(H2):member(H2,[radiation,conduction,conversion])].
	
	
% heat is/becomes unlikely to be lost by conduction/radiation/convection
question(6,a,0): rule(4,17,1):: complete ==> [w(heat), w(V):member(V,[is,become,becomes]), w(unlikely), w(to), w(be),w(lost), w(by), w(H2):member(H2,[radiation,conduction,conversion])].
	
% heat can not be (easily) lost (easily) by/through conduction or radiation
question(6,a,0): rule(4,18,1):: complete ==> [c(np:[head=heat]),c(vg:[pol=neg,head=lost]),?(w(_Easily)),?(w(_By)),w(C):member(C,[conduction,radiation])].

% the amount of heat lost/loss by radiation/conduction/convection is reduced/prevented/decreased/cut down
question(6,a,0): rule(4,19,1):: complete ==> [c(np:[head=amount]),?(w(_Of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat])), ?(w(by)),w(R):member(R,[radiation,conduction,convection]),c(vg:[head=V,pol=pos,passive=yes]):member(V,[reduced,prevented,decreased,cut])].

% we cannot combine the last rule and the next rule so we repeat it with little change

question(6,a,0): rule(4,20,1):: complete ==> [c(np:[head=amount]),?(w(_Of)), c(np:[head=H2]):member(H2,[heat]),c(vg:[pol=pos,head=F]):member(F,[lost]), ?(w(by)),w(R):member(R,[radiation,conduction,convection]),c(vg:[head=V,pol=pos,passive=yes]):member(V,[reduced,prevented,decreased,cut])].

% reduces/prevents/decrease/cuts down on (the amount of) heat loss by radiation/conduction/convection
question(6,a,0): rule(4,21,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat])),?(w(_By)),w(J):member(J,[radiation,convection,conduction])].
        
	
% reduces/prevents/decrease/cuts down on (the amount of) heat lost by radiation/conduction/convection 	
question(6,a,0): rule(4,22,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2]):member(H2,[heat]),c(vg:[head=V,pol=pos]):member(V,[lost]), ?(w(_By)),w(J):member(J,[radiation,conduction,convection]) ].
        
	
% less heat loss by radiation/convection/conduction
question(6,a,0): rule(4,23,1):: complete ==>[c(np:[head=H2,mods=[E,L]]):(member(H2,[loss]),member(L,[heat]),member(E,[less,'Less',minimum,minimal])), ?(w(_By)), c(np:[head=H1]):member(H1,[radiation,convection,conduction])].  
        

% less heat (is) lost by radiation/convection/conduction
question(6,a,0): rule(4,24,1):: complete ==>[c(np:[head=heat,mods=E]):(member(J,E),member(J,[less,'Less',minimum,minimal])),c(vg:[head=H2,pol=pos]):member(H2,[lost]),?(w(_By)), c(np:[head=H1]):member(H1,[radiation,convection,conduction])].
        

% heat is not lost by radiation/convection/conduction
question(6,a,0): rule(4,25,1):: complete ==>[c(np:[head=L]):member(L,[heat]), c(vg:[head=H2,pol=neg]):member(H2,[lost]),?(w(_By)), c(np:[stem=H]):member(H,[radiation,convection,conduction])].
	
% reduces/prevents/decrease/cuts down/minimizes on (the amount of) heat loss/lost through/close/near/from the skin/surface / from the surface of the skin

% 'prevents heat loss' is not quite right but has been accepted by examiners 
% be careful that if there is a subject for 'cuts down' then the vg is formed from both words otherwise 'down' is not grouped with 'cuts' and the rule fails

question(6,a,0): rule(4,26,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting,minimizes,minimises,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat])),?(w(_Next)), ?(w(_To)),c(np:[head=J]):member(J,[skin,surface])].


% since we don't have a way of writing ((a,b);(c,d)) then we could not combine the rules. we had to rewrite the above rule rule(4,26,1) with one change only  
question(6,a,0): rule(4,27,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting,minimises,minimizes,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2]):member(H2,[heat]),c(vg:[head=V,pol=pos]):member(V,[lost]),?(w(_Next)), ?(w(_To)),c(np:[head=J]):member(J,[skin,surface])].
	
% Also because it seems not possible to start the RHS with a disjunction and sometimes the vg fails we have to add two rules like 4,26,1 and 4,27,1
question(6,a,0): rule(4,261,1):: complete ==>[w(H1):member(H1,[prevent,preventing,reduce,reducing,decrease,decreasing,cut,cutting,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), w(heat),w(loss),?(w(_Next)), ?(w(_To)),c(np:[head=J]):member(J,[skin,surface])].

question(6,a,0): rule(4,271,1):: complete ==>[w(H1):member(H1,[prevent,preventing,reduce,reducing,decrease,decreasing,cut,cutting,minimising,minimise,minimize,minimizing]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2]):member(H2,[heat]),c(vg:[head=V,pol=pos]):member(V,[lost]),?(w(_Next)), ?(w(_To)),c(np:[head=J]):member(J,[skin,surface])].

%  reduces/prevents/decrease/cuts down on (the amount of) heat loss/lost from the blood
% 'prevents heat loss' is not quite right but has been accepted by examiners 
question(6,a,0): rule(4,28,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting,minimises,minimizes,minimising,minimise]),?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2,mods=[L]]):(member(H2,[loss]),member(L,[heat])),?(w(from)), c(np:[head=blood]) ].
        
	
% similarly we could not combine the last rule with the next one so we re-wrote it

question(6,a,0): rule(4,29,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[prevent,prevents,preventing,reduce,reduces,reducing,decrease,decreases,decreasing,cut,cuts,cutting,minimises,minimizes,minimising,minimise]), ?(w(_On)),?(c(np:[head=K]):member(K,[amount,quantity])),?(w(of)), c(np:[head=H2]):member(H2,[heat]),c(vg:[pol=pos,head=V]):member(V,[lost]),?(w(_W)), c(np:[head=blood]) ].
        
	
% blood vessels will cut off the blood supply to the skin therefore reducing the heat loss ==> less heat is lost to the surface
question(6,a,0): rule(4,30,1):: complete ==>[c(np:[stem=V]):member(V,[vessel,capillary]), c(vg:[pol=pos,stem=N]):member(N,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict]),c(np:[stem=supply,mods=[blood]]),?((_D/'IN';_H/'TO')),c(np:[stem=S]):member(S,[skin,surface]),?((_P/'CC';_L/'RB')),c(vg:[pol=pos,stem=R]):member(R,[reduce,decrease]),c(np:[stem=loss,mods=[heat]])].

% blood vessels will cut off the blood supply to the skin therefore reducing the loss of heat ==> less heat is lost to the surface

question(6,a,0): rule(4,30,1):: complete ==>[c(np:[stem=V]):member(V,[vessel,capillary]), c(vg:[pol=pos,stem=N]):member(N,[constrict,shut,close,cut,squeeze,contract,constringe,compress,compact,narrow,restrict]),c(np:[stem=supply,mods=[blood]]),?((_D/'IN';_H/'TO')),c(np:[stem=S]):member(S,[skin,surface]),?((_P/'CC';_L/'RB')),c(vg:[pol=pos,stem=R]):member(R,[reduce,decrease]),c(np:[stem=loss]),?(w(of)),c(np:[stem=heat])].

% stops alot of blood from reaching the surface of the skin and being cooled by the air.
question(6,a,0): rule(4,31,1) :: complete ==> [w(W):member(W,[stopping,stop,stops,preventing,prevents,prevent,shutting,shut,close,closing]),?(w(_J)),?(w(_F)),?(w(_K)),w(blood),?(w(_W)),?(w(J):member(J,[reach,reaching,arrive,arriving,touching,touch,contacting,contact])),?(w(_O)),c(np:[head=K]):member(K,[skin,surface]),?(w(_X)),?(c(np:[stem=skin])),(_P/'CC';_G/'RB'),c(vg:[pol=pos,stem=cool])].

% less blood to the capillaries near the skin's surface so less heat is lost
% some students write it as skins surface and this changes the np,vg formation 
question(6,a,0): rule(4,32,1) :: complete ==> [c(np:[stem=blood,mods=[L]]):member(L,[less,'Less']),?(w(_P)),c(np:[stem=C]):member(C,[capillary,vessel]),w(N):member(N,[near,close,adjacent,nearby,next,towards,to,reaching]),c(np:[stem=S]):member(S,[skin,surface]),?(w(_)),(_J/'RB';_M/'CC'),c(np:[stem=heat,mods=[K]]):member(K,[less,'Less']),c(vg:[pol=pos,stem=lose])].


% set 5  - heat is not lost
% no, set 5 is wrong biology info since heat is always lost from the body
% but its loss is decreased or reduced when one is too hot!


full_mark(question(6,a,0),3).

%:- compile('c:/Documents and Settings/jana/My Documents/data/6(a).pl').



