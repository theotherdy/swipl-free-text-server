% rules for question 12 (c) (i) foundation paper 2001

%:-multifile answer/4.
:- multifile full_mark/2.

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



% question 12(c)(i) -

% equivalence class 1 i.e. set_number is 1
% [(coloured) water moves more]


% water/dye move (a lot ) further 
question(12,c,i): rule(1,1,1):: complete ==>[c(np:[stem=N]):member(N,[water,dyecolour,color]),(c(vg:[pol=pos,stem=H1]):member(H1,[move,go,rise,travel]);w(X):member(X,[moved,moves,went,rose,travelled])),?(w(a)),?(w(B):member(B,[lot,much,more,alot,even])),w(W):alternative(W,further),?(w(distance))].
% there is no point in having an optional element at the end of the rule


% the coloured water/drop (for/with the maggots/ when the maggots were used) moves (1/few cm/ 1 or 2 cm/cms) further
% w(Q) is added because sometimes students misspell cms they put cm's but
% maybe it should be added as it may overgenerate and the mistake should
% be considered due to spelling!
question(12,c,i): rule(1,2,1):: complete ==> [w(W):member(W,['It',it,water,'Water',colour,color]),?(w(drop)),?((_/'IN';_B/'WRB')),?(c(np:[stem=maggot])),?(c(vg:[pol=pos,stem=use])),c(vg:[stem=V,pol=pos]):member(V,[move,rise,go,travel]),?(w(_A)),?(_F/'CC'),?(w(_X)),?(w(_Q)),?(w(B):member(B,[lot,much,more,alot,even])),w(Adv):alternative(Adv,further)].
	
	
%question(12,c,i): rule(1,2,1):: complete3 ==> [c(np) ,c(vg:[pol=pos]), ?w(much), w(W)]:- alternative(W, bigger).

% 2nd subset
% the distance with the maggots/when maggots were used rise much bigger
% the distance that the water moved was much greater
question(12,c,i): rule(1,3,1):: complete ==> [c(np:[stem=A]):member(A,[water,distance,drop,colour,color]),?((_/'IN';_B/'WRB')),?(c(np:[stem=maggot])),?(c(vg:[pol=pos,stem=use])),?(c(np:[stem=O]):member(O,[water,dye,drop,colour,color])),c(vg:[pol=pos,stem=B]):member(B,[move,rise,go,travel,be]),?(w(_U)),?(w(K):member(K,[lot,much,more,alot,even])),w(W): alternative(W, bigger)].
	

/*
% variant for 2nd subset
question(12,c,i): rule(1,4,1):: complete ==> [w(distance), w(B):member(B,[is,are,was,were]),?(w(K):member(K,[lot,much,more,alot,even])), w(W):alternative(W, bigger)].
	
*/	
	

% another variant for 2nd subset
% (maggots) distance move/is (much/a lot) higher/bigger etc 
question(12,c,i): rule(1,4,1):: complete ==> [c(np:[stem=distance]), ?(_/'IN'),?(c(np:[stem=maggot])),c(vg:[pol=pos,stem=V]):member(V,[move,rise,go,travel,be]),?(w(a)),?(w(K):member(K,[lot,much,more,alot,even])), w(W):alternative(W, bigger)].
	
% the previous rule does not work for something like "distance is much higher"
% actually so we wrote the next one
	
question(12,c,i): rule(1,41,1):: complete ==> [c(np:[stem=distance]),?(_/'IN'),?(c(np:[stem=maggot])),c(vg:[pol=pos,head=W]):alternative(W, bigger)].

% 3rd subset 
%question(12,c,i):rule(1,3,1):: complete3 ==> [c(np:[head=maggots]),c(vg:[head=double]),w(in), c(np:[head=distance])].
% the previous
% rule does not work as the tagger does not tag double as a verb but
% an RB; hence, at the moment it is written as w(double)

question(12,c,i):rule(1,5,1):: complete ==> [c(np:[head=maggots]),?(w(_W2)),w(double),?(w(_W1)), c(np:[head=distance])].


% maggots results increase at a faster speed
question(12,c,i):rule(1,6,1):: complete ==> [c(np:[stem=A,mods=[M]]):(member(A,[result]),member(M,[maggot,maggots])),c(vg:[stem=V,pol=pos]):member(V,[be,increase]),?(w(at)),?(w(a)),w(K):member(K,[more,faster,bigger,higher]),?(w(_W4)), c(np:[stem=speed])].

% maggots results was/are/is (1 or 2/few cm/cms/cm's) more
question(12,c,i):rule(1,7,1):: complete ==> [c(np:[stem=A,mods=[M]]):(member(A,[result]),member(M,[maggot,maggots])),c(vg:[stem=V,pol=pos]):member(V,[be,move,increase,rise,go,travel]),?(w(_Much)),?(_/'CC'),?(w(_G)),?(w(_F)),w(K):member(K,[more,bigger,higher])].

% results with maggots increase at a faster speed etc ...
question(12,c,i):rule(1,8,1):: complete ==> [c(np:[stem=A]):member(A,[result]),_Y/'IN', c(np:[stem=M]):member(M,[maggot]),c(vg:[stem=V,pol=pos]):member(V,[be,increase]),?(w(_At)),?(w(_Much)),c(np:[stem=speed,mods=[K]]):member(K,[more,faster,bigger,higher])].

% each result with maggots was more (than the woodlice)	
question(12,c,i):rule(1,9,1):: complete ==> [c(np:[stem=A]):member(A,[result]),_Y/'IN', c(np:[stem=M]):member(M,[maggot]),c(vg:[stem=V,pol=pos]):member(V,[be]),?(w(_Much)),c(np:[stem=speed,mods=[K]]):member(K,[more,faster,bigger,higher])].

% variant of 4th subset
question(12,c,i):rule(1,10,1):: complete ==> [w(W):member(W,[woodlice,'Woodlice']),?(c(vg:[pol=pos,stem=be])),w(L):member(L,[less,'Less']),?(w(_W4)),c(np:[stem=maggot])].
	
% The woodlice moved every 2 minutes 0.2 more but the maggots moved every 2 minutes 0.3 more
question(12,c,i):rule(1,11,1):: complete ==> [c(np:[stem=woodlice]),c(vg:[stem=W,pol=pos]):member(W,[move,rise,go,travel]),c(np:[stem=M]):member(M,[min,mn,minute]), N1/'CD':member(N1,['0.2']), ?(w(_CM)),?(w(more)),?((_W2/'RB';_L2/'CC')), c(np:[stem=maggot]),?(c(vg:[stem=J,pol=pos]):member(J,[move,rise,go,travel])),c(np:[stem=MI]):member(MI,[minute,min,mn]), N2/'CD':member(N2,['0.3'])].
	
% reverse
%The maggots moved every 2 minutes 0.3 more but the woodlice moved every 2 minutes 0.2 more

question(12,c,i):rule(1,12,1):: complete ==> [c(np:[stem=maggot]),c(vg:[stem=W,pol=pos]):member(W,[move,rise,go,travel]),c(np:[stem=MI]):member(MI,[min,minute,mn]), N2/'CD':member(N2,['0.3','3']), ?(w(more)),?(w(_W2)), c(np:[stem=woodlice]),?(c(vg:[pol=pos,stem=VE]):member(VE,[move,rise,go,travel])),?(c(np:[stem=Min]):member(Min,[min,minute,mn])), N1/'CD':member(N1,['0.2','2'])].

	
% For maggots every minute passed distance increases 0.3 cm. For woodlice every minute passed (distance/it) increases 0.2 cm. 
question(12,c,i):rule(1,13,1):: complete ==> [c(np:[stem=maggot]),c(np:[stem=M]):member(M,[minute,mn,min]), c(vg:[pol=pos,stem=X1]):member(X1,[pass]),c(np:[stem=Di]):member(Di,[distance,it]),c(vg:[pol=pos,stem=V2]):member(V2,[increase]),N1/'CD':member(N1,['0.3','3']),?(w(C):member(C,[cm,'cm.',centimetres,centimeters,centimeter,centimetre])), ?(((_P/'.';_K/',');_M/'CC')),?(w(_Z)),c(np:[stem=woodlice]),c(np:[stem=MI]):member(MI,[minute,mn,min]),?(c(vg:[stem=V1,pol=pos]):member(V1,[pass])), ?((_A/'NN';_J/'PRP')),?(c(vg:[pol=pos,stem=Ver]):member(Ver,[increase])),N2/'CD':member(N2,['0.2','2']),?(w(C):member(C,[cm,centimetres,centimeters,centimeter,centimetre]))].


%every two minutes in the maggots one it increases by 3 which/while/whereas/where the woodlice only increases by 2
question(12,c,i):rule(1,14,1):: complete ==> [c(np:[stem=Mi]):member(Mi,[minute,min,mn]),?(w(_P)),(c(np:[mods=[M]]):member(M,[maggot,maggots]);c(np:[stem=maggot])),c(np:[stem=D]):member(D,[it,distance]),c(vg:[pol=pos,stem=I]):member(I,[increase]),?(w(_U)),w(W):member(W,['3','0.3']),w(_CM),?((((_F/'CC';_J/'WRB');_K/'WDT');_L/'IN')),c(np:[stem=woodlice]),?(w(_N)),?(c(np:[stem=O]):member(O,[it,distance])),?(c(vg:[pol=pos,stem=P]):member(P,[increase])),?(_/'IN'),w(G):member(G,['2','0.2'])].

% the water/drop (of water)/dye moves much/a lot closer (,) to the syringe/chemical
question(12,c,i):rule(1,15,1):: complete ==>[c(np:[stem=W]):member(W,[water,drop,dye,colour,color]),c(vg:[stem=M,pol=pos]):member(M,[move,rise,go,travel,be]),?(w(a)),?(w(K):member(K,[lot,much,more,alot,even])),w(C):member(C,[closer,nearer]),?(_J/','),?((_O/'IN';_U/'TO')),c(np:[stem=S]):member(S,[syringe,chemical])].

% the water/drop (of water)/dye is much closer to the syringe
question(12,c,i):rule(1,16,1):: complete ==>[c(np:[stem=W]):member(W,[water,drop,dye,color,colour]),c(vg:[head=C,pol=pos]):member(C,[closer,nearer]),?((_O/'IN';_U/'TO')),c(np:[stem=syringe])].

% the water hasn't moved/risen/etc as far with the woodlice
question(12,c,i):rule(1,17,1):: complete ==>[c(np:[stem=W]):member(W,[water,drop,dye,colour,color]), c(vg:[pol=neg,stem=V]):member(V,[move,rise,go,travel,be]),?(w(as)),w(F):member(F,[far,much]),_/'IN',?(c(np:[stem=case])),?(w(of)),c(np:[stem=woodlice])].

% the water with/in the case of the woodlice hasn't moved as far
question(12,c,i):rule(1,18,1):: complete ==>[c(np:[stem=W]):member(W,[water,drop,dye,colour,color]),_/'IN',?(c(np:[stem=case])),?(w(of)),c(np:[stem=woodlice]),c(vg:[pol=neg,stem=V]):member(V,[move,rise,go,travel,be]),w(as),w(F):member(F,[far,much])].

% maggots have more of a distance of coloured water moved
question(12,c,i):rule(1,19,1):: complete ==> [w(more),?(w(of)),c(np:[stem=distance]),?(w(of)),c(np:[stem=W]):member(W,[water,dye,drop,colour,color]),c(vg:[pol=pos,stem=M]):member(M,[move,rise,go,travel])].

% move/moved the water (along)/ (a lot)/ (much) more/further
question(12,c,i):rule(1,20,1):: complete ==>[c(vg:[stem=V,pol=pos]):member(V,[move,rise,go,be,travel]),(c(np:[stem=I]):member(I,[it,water,colour,color,dye,drop]); c(np:[stem=drop])),?(w(_O)),?(w(a)),?(w(B):member(B,[lot,much,more,alot,twice])),?(w(_S)),w(Adv):member(Adv,[further,more,far])].

% equivalence class 2
% [(coloured) water moves faster]

% subset 1
% the coloured water moved much more
% the water drop moved much more
% the distance that the drop of water moved was much more/twice as fast
% AGain assuming the emphasis is on 'maggots' 
question(12,c,i): rule(2,1,1):: complete ==> [w(W):member(W,['It',it,water,'Water',color,colour]),?(w(drop)),?(w(_U)),?((_/'IN';_B/'WRB')),?(c(np:[stem=maggot])),?(c(vg:[pol=pos,stem=use])),(c(vg:[stem=V,pol=pos]):member(V,[move,rise,go,be,travel]);w(X):member(X,[move,rise,go,travel])),?(w(_O)),?(w(a)),?(w(B):member(B,[lot,much,more,alot,twice])),?(w(_S)),w(Adv):member(Adv,[faster,quicker,more,quickly,rapidly,fast])].
	
	
% move the water (along)/ (a lot)/ (much) more/quicker/faster/quickly/fast / twice as fast
question(12,c,i): rule(2,11,1):: complete ==> [c(vg:[stem=V,pol=pos]):member(V,[move,rise,go,be,travel]),(c(np:[stem=I]):member(I,[it,water,colour,color,drop,dye]); c(np:[stem=drop])),?(w(_O)),?(w(a)),?(w(B):member(B,[lot,much,more,alot,twice])),?(w(_S)),w(Adv):member(Adv,[faster,quicker,more,quickly,fast,rapidly])].
	
% though 'more' in hte previous rule is grammatically wrong but it is possible
% that students write it

% subset 2
question(12,c,i): rule(2,2,1):: complete ==> [c(np:[stem=distance]),?(w(_W)),?( c(np:[head=N]):member(N,[maggots,drop])), c(vg:[stem=V,pol=pos]):member(V,[move,rise,go,travel]),?(w(_O)),?(w(a)),?(w(B):member(B,[lot,much,more,alot,twice])),?(w(_S)),w(Adv):member(Adv,[faster,quicker,more,fast,quickly,rapidly])].
	
	
% The distance between the drop of coloured water + the syringe decreases much more quickly with the maggots.
% ... the drop of water/water drop and the syringe 
question(12,c,i): rule(2,3,1):: complete ==> [c(np:[stem=distance]),_O/'IN',c(np:[stem=drop]),?(w(_L)),?(c(np:[stem=X]):member(X,[water,colour,color,drop,dye])),(_J/'SYM';_B/'CC'),c(np:[stem=syringe]),c(vg:[pol=pos,stem=D]):member(D,[decrease,reduce,minimise,minimize]),?(w(_Much)),(w(More):member(More,[more,quicker,faster]);w(Q):member(Q,[quickly,fast,rapidly]))].

% water/dye/drop (with/in case of maggots) is/was quicker

question(12,c,i): rule(2,4,1):: complete ==> [c(np:[stem=W]):member(W,['It',it,water,drop,colour,color,dye]),?(w(of)),?(w(T):member(T,[color,colour,dye])),?(_I/'IN'),?(w(_U)),?(w(of)),?(c(np:[stem=maggot])),c(vg:[head=Adv,pol=pos]):member(Adv,[faster,quicker,more,quickly,rapidly,fast])].

% distance (with/in case of maggots) is/was more/faster/quicker

question(12,c,i): rule(2,5,1):: complete ==> [c(np:[stem=distance]),?(w(_W)),?(w(_X)),?(w(_H)),?(c(np:[head=N]):member(N,[maggots,drop])), c(vg:[head=Adv,pol=pos]):member(Adv,[faster,quicker,more,quickly,fast,rapidly])].
	

% equivalence class 3
% [slope of the graph steeper]

% slope of teh graph is/was steeper
question(12,c,i): rule(3,1,1):: complete ==> [c(np:[stem=N]):member(N,[slope,gradient]),?(w(_W)),?(w(graph)),c(vg:[pol=pos,head=V]):alternative(V,steeper)].

% steeper slope on the graph

question(12,c,i): rule(3,2,1):: complete ==> [c(np:[stem=N,mods=[M]]):(member(N,[slope,gradient]),member(M,[steeper])),?(w(_I)),?(c(np:[stem=graph]))].
					     
% equivalence class 4
% [use up more oxygen]  isn't this part of 12(c)(ii) 
% check - it should not be here really but examiners are considering it correct



% [maggots use up more (of the) oxygen]
% [use up more oxygen]
% [use more oxygen up]
% taking in much more/a lot more/ even more oxygen
% oxygen or air (examiners are incosistent regarding air)

question(12,c,i): rule(4,1,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,eat,requires,uses,takes,needs,eats,required,used,took,needed,ate,requiring,using,taking,needing,eating]),?(w(_J)),?(w(_I)), ?(w(_J)), c(np:[head=O,mods=L]):(member(O,[oxygen]),(member(more,L);member('More',L)))].%member(O,[oxygen,air])].

%member(J,[up,in]).

% use up more of the oxygen
question(12,c,i): rule(4,2,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,eat,requires,uses,takes,needs,eats,required,used,took,needed,ate,requiring,using,taking,needing,eating]),?(w(_J)),?(w(_I)), ?(w(_J)),w(W):member(W,[more,'More']),?(w(_Of)),c(np:[head=O]):member(O,[oxygen])].%member(O,[oxygen,air])].

% 2nd subset

question(12,c,i): rule(4,3,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]), w(_W), w(V1):member(V1,[larger,bigger,double]), w(V2):member(V2,[intake]),?(w(_J)), w(O):member(O,[oxygen,air])].
	
	
	
	


% 3rd subset 
question(12,c,i): rule(4,4,1):: complete ==> [c(vg:[head=A,pol=pos]):member(A,[respirate,respire]),w(W):member(W,[more,faster,quicker])].
	
	
% respirate does not exist in Englih --students use it
% in any case it does not exist in the lexicon so it is being tagged wrongly

% 4th subset
% the woodlice don't use as much oxygen
question(12,c,i):rule(4,5,1):: complete ==> [c(np:[head=woodlice]),c(vg:[pol=neg,head=H1]):member(H1,[require,use,take,need,requiring,using,taking,needing]), ?(w(as)),w(much),w(O):member(O,[oxygen,air])].
	
     

% 5th subset 

question(12,c,i):rule(4,6,1):: complete ==> [c(np:[head=woodlice]),c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),c(np:[head=O,mods=L]):(member(O,[oxygen]),(member(less,L);member('Less',L)))].%(member(O,[oxygen,air])].
	
% use up less of the oxygen
question(12,c,i): rule(4,7,1):: complete ==>[c(np:[head=woodlice]),c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(_J)),?(w(_K)),w(W):member(W,[less,'Less']),?(w(_Of)),c(np:[head=O]):member(O,[oxygen])]. %member(O,[oxygen,air])].



question(12,c,i): rule(4,8,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]), ?(w(_W)), w(V1):member(V1,[smaller]), w(V2):member(V2,[intake]),?(w(_J)), w(O):member(O,[oxygen])].%member(O,[oxygen,air])].
	
	

% use up oxygen quicker

question(12,c,i): rule(4,9,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(J):member(J,[up,in])),?(w(A):member(A,[some,the,their,his,its])),w(O):member(O,[oxygen,air]),?(w(_A)),?(w(_N)),w(W):member(W,[more,quicker,faster,quickly,fast])].
	
	
question(12,c,i): rule(4,10,1):: complete ==> [c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(A): member(A,[up,in])),?(w(L):member(L,[some,the,their,his,its])),w(O):member(O,[oxygen,air]),?(w(at)),?(w(S):member(S,[a,much])),w(W):member(W,[faster,quicker,higher,different,more]), w(K):member(K,[rate,rates])].



%  (assumption also that emphasis is on maggots)
question(12,c,i): rule(4,11,1):: complete ==> [c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(_W)),w(O):member(O,[oxygen,air]),w(W):member(W,[faster,quicker])].
	

% 

question(12,c,i): rule(4,12,1):: complete ==> [c(np:[head=woodlice]),c(vg:[head=H1,pol=pos]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),w(O):member(O,[oxygen,air]),w(W):member(W,[slower])].
	
	
	

% 
% different amount of oxygen
question(12,c,i):rule(4,13,1):: complete ==> [c(np:[head=A,mods=[D]]):(member(A,[amount,amounts]),alternative(D,different)),?(w(_J)),w(O):member(O,[oxygen,air])].

% 
% amount of oxygen are different
question(12,c,i): rule(4,14,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),w(O):member(O,[oxygen,air]),?(w(_K)),w(D):alternative(D,different)].
	
	

% amounts of oxygen differ
question(12,c,i): rule(4,15,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),w(O):member(O,[oxygen,air]), c(vg:[pol=pos,head=V]):alternative(V,differ)].
	
	

% amount of oxygen are not the same etc


% the amount(s) of carbon dioxide used was different
question(12,c,i): rule(4,16,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),c(np:[head=dioxide]), ?(c(vg:[head=U,pol=pos]):member(U,[used])),c(vg:[pol=pos,head=V]):(alternative(V,differ);alternative(V,different))].

% equivalence class  5
% [more maggots] or [less woodlice]
% this should be for 12(c)(ii) but it seems these 2 parts are confused


% subset 1
% more maggots
question(12,c,i): rule(5,1,1):: complete ==> [c(np:[stem=maggot,mods=[more]])].


% subset 2
% more mass of maggots
question(12,c,i): rule(5,2,1):: complete ==> [w(more), w(mass), ?(w(_W)),c(np:[stem=maggot])].

% subset 3
% maggots are bigger -
% we can't put stem=big because it is important to have a comparative
question(12,c,i): rule(5,3,1):: complete ==> [c(np:[stem=maggot]),c(vg:[head=B,pol=pos]):member(B,[bigger])].
	

% subset 4

question(12,c,i): rule(5,4,1):: complete ==> [c(np:[stem=maggot]),c(vg:[pol=pos, stem=more])].
	  

% subset 5

question(12,c,i): rule(5,5,1):: complete ==> [c(np:[stem=woodlice]),c(vg:[stem=less,pol=pos])].
	  
% subset 6	
question(12,c,i): rule(5,6,1):: complete ==> [c(np:[stem=maggot]), c(vg:[pol=pos,stem=have]), w(more), w(mass)].
	


% subset 7	
question(12,c,i): rule(5,7,1):: complete ==> [c(np:[stem=woodlice]), c(vg:[pol=pos,stem=have]), w(less), w(mass)].
	

% subset 8
question(12,c,i): rule(5,8,1):: complete ==> [c(np:[stem=woodlice]),c(vg:[pol=pos,stem=S]):member(S,[smaller])].
	


equivalence_class(rule(1,1,1),"coloured water moves more").
equivalence_class(rule(1,11,1),"water moves further").
equivalence_class(rule(1,3,1),"maggots move double the distance").
equivalence_class(rule(1,51,1)," the woodlice moved every 2 mn 0.2 more but theh maggots moved every 2 mn 0.3 more").
equivalence_class(rule(1,2,1),"(the distance) that the drop of water is/moved bigger/ much more").
equivalence_class(rule(1,4,1),"each result with maggots was more than the woodlice").
equivalence_class(rule(1,5,1)," woodlice moved every 2/10 mn 0.2/ more but the maggots moved every 2/10 mn 0.3/ more").
equivalence_class(rule(1,51,1), " maggots moved every 2/10 mn 0.2/ more but the maggots moved every 2/10 mn 0.3/ more").
equivalence_class(rule(1,6,1), " for maggots every mn passed distance increases 0.3 cm. for woodlice every mn passed distance increases 0.2 cm").

equivalence_class(rule(2,1,1),"(coloured) water moves faster").
equivalence_class(rule(2,2,1), " the distance ?(of the drop) ?(with the maggots){went up}").

equivalence_class(rule(3,1,1),"slope of the graph steeper").
equivalence_class(rule(4,1,1),"use up more oxygen").
equivalence_class(rule(4,2,1),"use up more oxygen").
equivalence_class(rule(4,3,1),"use up more oxygen").
equivalence_class(rule(4,4,1),"use up more oxygen").
equivalence_class(rule(4,5,1),"use up more oxygen").
equivalence_class(rule(4,6,1),"use up more oxygen").
equivalence_class(rule(4,7,1),"use up more oxygen").
equivalence_class(rule(4,8,1),"use up more oxygen").

equivalence_class(rule(5,1,1), "more maggots or less woodlice").

equivalence_class(rule(5,2,1)," more mass of maggots").
equivalence_class(rule(5,3,1)," maggots are bigger").
equivalence_class(rule(5,4,1)," maggots are more").
equivalence_class(rule(5,5,1)," woodlice are less").
equivalence_class(rule(5,6,1)," maggots have more mass").
equivalence_class(rule(5,7,1)," woodlice have less mass").
equivalence_class(rule(5,8,1)," woodlice are smaller").

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/12(c)(i).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/data/12(c)(i).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/data/test12(c)(i).pl').
%:- compile(demo_test_i).

full_mark(question(12,c,i),1).



