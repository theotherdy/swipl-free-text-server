% rules for question 12 (c) (ii) foundation paper 2001

:- multifile full_mark/2.

:- multifile alternative/2.

:- multifile '::'/2.
:- multifile '==>'/2.

/*
:- multifile category/2.
:- multifile boolean_feature/2.
:- multifile feature_value/2.
:- multifile lattice_feature/2.
*/

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




% question 12(c)(ii) -

% equivalence class 1 i.e. set_number is 1
% [maggots use up more (of the) oxygen]
% [use up more oxygen]
% [use more oxygen up]
% taking in much more/a lot more/ even more oxygen
% oxygen or air (examiners are incosistent regarding air)

question(12,c,ii): rule(1,1,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,eat,requires,uses,takes,needs,eats,required,used,took,needed,ate,requiring,using,taking,needing,eating]),?(w(_J)),?(w(_I)), ?(w(_J)), c(np:[head=O,mods=L]):(member(O,[oxygen]),(member(more,L);member('More',L)))].%member(O,[oxygen,air])].

%member(J,[up,in]).

% use up more of the oxygen
question(12,c,ii): rule(1,111,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,eat,requires,uses,takes,needs,eats,required,used,took,needed,ate,requiring,using,taking,needing,eating]),?(w(_J)),?(w(_I)), ?(w(_J)),w(W):member(W,[more,'More']),?(w(_Of)),c(np:[head=O]):member(O,[oxygen])].%member(O,[oxygen,air])].

% 2nd subset

question(12,c,ii): rule(1,2,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]), w(_W), w(V1):member(V1,[larger,bigger,double]), w(V2):member(V2,[intake]),?(w(_J)), w(O):member(O,[oxygen,air])].
	
	
	
	


% 3rd subset 
question(12,c,ii): rule(1,3,1):: complete ==> [c(vg:[head=A,pol=pos]):member(A,[respirate,respire]),w(W):member(W,[more,faster,quicker])].
	
	
% respirate does not exist in Englih --students use it
% in any case it does not exist in the lexicon so it is being tagged wrongly

% 4th subset
% woodlice don't use as much oxygen
question(12,c,ii):rule(1,4,1):: complete ==> [c(np:[head=woodlice]),c(vg:[pol=neg,head=H1]):member(H1,[require,use,take,need,requiring,using,taking,needing]), ?(w(as)),w(much),w(O):member(O,[oxygen,air])].
	
     

% 5th subset 

question(12,c,ii):rule(1,5,1):: complete ==> [c(np:[head=woodlice]),c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),c(np:[head=O,mods=L]):(member(O,[oxygen]),(member(less,L);member('Less',L)))].%(member(O,[oxygen,air])].
	
% use up less of the oxygen
question(12,c,ii): rule(1,151,1):: complete ==>[c(np:[head=woodlice]),c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(_J)),?(w(_K)),w(W):member(W,[less,'Less']),?(w(_Of)),c(np:[head=O]):member(O,[oxygen])]. %member(O,[oxygen,air])].


% 6th subset
question(12,c,ii): rule(1,6,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]), ?(w(_W)), w(V1):member(V1,[smaller]), w(V2):member(V2,[intake]),?(w(_J)), w(O):member(O,[oxygen])].%member(O,[oxygen,air])].
	
	
	
	

% 7th subset
% use up oxygen quicker

question(12,c,ii): rule(1,7,1):: complete ==>[c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(J):member(J,[up,in])),?(w(A):member(A,[some,the,their,his,its])), w(O):member(O,[oxygen,air]), ?(w(_X)),?(w(_Z)),w(W):member(W,[more,quicker,faster,quickly,fast])].
	
	

% 8th subset
question(12,c,ii): rule(1,8,1):: complete ==> [c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(A): member(A,[up,in])),?(w(L):member(L,[some,the,their,his,its])),w(O):member(O,[oxygen,air]),?(w(at)),?(w(S):member(S,[a,much])),w(W):member(W,[faster,quicker,higher,different,more]), w(K):member(K,[rate,rates])].



% 
% [maggots use oxygen faster]


% subset 9 (assumption also that emphasis is on maggots)
question(12,c,ii): rule(1,9,1):: complete ==> [c(vg:[pol=pos,head=H1]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),?(w(_W)),w(O):member(O,[oxygen,air]),w(W):member(W,[faster,quicker])].
	
	

% subset 10

question(12,c,ii): rule(1,10,1):: complete ==> [c(np:[head=woodlice]),c(vg:[head=H1,pol=pos]):member(H1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),w(O):member(O,[oxygen,air]),w(W):member(W,[slower])].
	
	
	

% subset 11
% different amount of oxygen
question(12,c,ii):rule(1,11,1):: complete ==> [c(np:[head=A,mods=[D]]):(member(A,[amount,amounts]),alternative(D,different)),?(w(_J)),w(O):member(O,[oxygen,air])].

	
	

% subset 12
% amount of oxygen are different
question(12,c,ii): rule(1,12,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),w(O):member(O,[oxygen,air]),?(w(_K)),w(D):alternative(D,different)].
	
	
	


% subset 13
% amounts of oxygen differ
question(12,c,ii): rule(1,12,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),w(O):member(O,[oxygen,air]), c(vg:[pol=pos,head=V]):alternative(V,differ)].
	
	
	

% subset 14
% amount of oxygen are not the same etc

% subset 15

% the amount(s) of carbon dioxide used was different
question(12,c,ii): rule(1,15,1):: complete==> [c(np:[head=A]):member(A,[amount,amounts]),?(w(_J)),c(np:[head=dioxide]), ?(c(vg:[head=U,pol=pos]):member(U,[used])),c(vg:[pol=pos,head=V]):(alternative(V,differ);alternative(V,different))].
% equivalence class 3
%[ maggots are more active]

% subset 1
question(12,c,ii): rule(3,1,1):: complete ==> [c(vg:[pol=pos]), ?(w(K):member(K,[also,even,much])),w(more), w(W):member(W,[active,energetic])].
	
	
% whatever we can put instead of 'also'? 'as well' etc
% this should be fixed as one does not have to restrict the optional element  
% subset 2

question(12,c,ii): rule(3,2,1):: complete ==> [c(vg:[pol=pos,head=move]),?(w(_A)),?(w(a)),?(w(V):member(V,[lot,much,even])),w(M):member(M,[more,faster,quicker])].
	
	
       % member(A,[around,along,up,down]).

% subset 3
question(12,c,ii): rule(3,3,1):: complete ==> [w(different),w(V):member(V,[rate,rates]),?(w(of)),w(M):member(M,[movement,energy,movements])].
	
	

% subset 4
question(12,c,ii): rule(3,4,1):: complete ==> [c(np:[head=K]):member(K,[maggots,maggot,'Maggots','Maggot']),w(V):member(V,[are,is,move,moves]), w(W):member(W,[quicker,faster])].
	
	
	

% equivalence class 4
% [different metabolic rates]
% subset 1
question(12,c,ii): rule(4,1,1):: complete ==> [w(different),w(metabolic),w(V):member(V,[rate,rates])].
	

% subset 2
question(12,c,ii): rule(4,2,1):: complete ==> [w(different),w(V):member(V,[activity,energy])].
       

% subset 3
question(12,c,ii): rule(4,3,1):: complete ==> [c(vg:[pol=pos,head=V1]):member(V1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),w(more),w(V2):member(V2,[activity,energy])].
       
       


% subset 4


question(12,c,ii): rule(4,4,1):: complete ==> [c(np:[head=woodlice]),c(vg:[pol=pos,head=V1]): member(V1,[require,use,take,need,requires,uses,takes,needs,required,used,took,needed,requiring,using,taking,needing]),w(less),w(V2):member(V2,[activity,energy])].
       
      


% subset 5
% faster (aerobic) respiration
question(12,c,ii): rule(4,5,1):: complete ==> [w(W):member(W,[faster,quicker]),?(w(_K)),w(respiration)].
	

% subset 6
%question(12,c,ii): rule(4,6,1):: complete ==> [c(vg:[pol=pos,head=V]),?(w(_W)),?(w(_L)),w(W), w(K)]:-
	%member(W,[faster,quicker,higher,different]),
	%member(K,[rate,rates]),
	%member(V,[respire,respiring,respired,respirate]). 

% subset 6
question(12,c,ii): rule(4,6,1):: complete ==> [c(vg:[pol=pos,head=V]):member(V,[respire,respiring,respired,respirate]),?(w(at)),?(w(_L)),w(W):member(W,[faster,quicker,higher,different]), w(K):member(K,[rate,rates])].

	
	

% subset 7
question(12,c,ii): rule(4,7,1):: complete ==> [c(vg:[pol=pos,head=V]):member(V,[respire,respiring,respired,respirate]), w(K):member(K,[faster,quicker,higher,different])].
	
	

% subset 8
% NB the way the npvg works
% 'are different', 'are higher' ...i.e aux +JJ : vg: head=valueOf(JJ)

% rate of (aerobic) respiration is higher etc 
question(12,c,ii): rule(4,8,1):: complete ==> [c(np:[head=N]):member(N,[rate, rates]),?(w(_L)),?(w(_I)),w(J):member(J,[respiration]), c(vg:[pol=pos,head=K]):member(K,[faster,quicker,higher,different])].
	
	
	

% set 9
% the rate with which maggots respire is different/higher ...

% set 10
% alternative(perform) (aerobic) respiration (much/even/a lot)faster/quicker etc
question(12,c,ii): rule(4,10,1):: complete ==> [c(np:[head=respiration]),?(w(_L)),?(w(_I)), ?(w(_U)),w(K):member(K,[faster,quicker,higher,different])].
	
% equivalence class  5
% [more maggots]

% subset 1

question(12,c,ii): rule(5,1,1):: complete ==> [w(more), w(V):member(V,[maggot,maggots,'Maggot','Maggots'])].
	


% subset 2

question(12,c,ii): rule(5,2,1):: complete ==> [w(more), ?(w(body)), w(mass), ?(w(of)),w(V):member(V,[maggot,maggots,'Maggot','Maggots'])].
	

% variant of subset 2
question(12,c,ii): rule(5,21,1):: complete ==> [w(V):member(V,[maggot,maggots,'Maggot','Maggots']), ?(w(K):member(K,[have,has])),w(more), ?(w(body)), w(mass)].


% subset 3
% maggots are bigger (again vg head=JJ)
% maggots would be / might be bigger etc ..much bigger 

question(12,c,ii): rule(5,3,1):: complete ==> [c(np:[head=B]):	member(B,[maggot,maggots,'Maggot','Maggots']),?(w(_V)), c(vg:[pol=pos,head=A]):	member(A,[bigger,larger,double,heavier,heavy,large,big])].
	%member(V,[are,were,is,was]),



% the previous rule won't pick up something like : maggots are a lot bigger

% subset 4
% 
question(12,c,ii): rule(5,3,1):: complete ==> [c(np:[head=B]):member(B,[woodlice,'Woodlice']),?(w(_V)), c(vg:[pol=pos,head=A]):member(A,[smaller,half,little,small,lighter,light])].
	%member(V,[are,were,is,was]),

	

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/12(c)(ii).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/conversion/training_foundation/12(c)(ii).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/data/test12(c)(ii).pl').
%:- compile(demo_test_ii).

full_mark(question(12,c,ii),2).
