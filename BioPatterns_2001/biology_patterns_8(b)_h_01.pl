% question 8(b) -- higher tier 2001

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


%============================
% Question 8, class 1
% [Mother's milk is warm]


% warm milk
question(8,b,0): rule(1,1,1) :: complete ==> [w(W):member(W,[hot,warm,tepid]),w(B):member(B,[milk,liquid])].
	
        

% it/milk is/tends to be warm 
% the milk (she produces) comes from inside the mother and will be very warm
% this could overgenerate
question(8,b,0): rule(1,2,1) :: complete==> [c(np:[head=M]):member(M,[it,'It', milk,'Milk']),?(w(itself)),?(_/'WDT'),?(c(np:[head=S]):member(S,[she,mother,mothers])),?(c(vg:[pol=pos,stem=A]):member(A,[produce,come,tend,be])),?(w(F): member(F,[of,from,inside,within])),?(w(_O)),?(c(np:[head=P]):member(P,[mother,mothers,body,breast,breasts,bear,polar])),?((_L/'CC';_H/'WDT')),c(vg:[pol=pos,head=T]):member(T,[warm,warmed,warmer,hot,hotter,tepid])].




% it/milk gets warm

question(8,b,0): rule(1,3,1) :: complete==> [c(np:[head=M]):member(M,[it,'It',milk,'Milk']),?(_L/'WDT'),?(c(vg:[pol=pos,stem=produce])),?(w(F):member(F,[of,from,inside])),?(c(np:[head=T]):member(T,[mother,itself])),c(vg:[pol=pos,head=H1]): member(H1,[becomes,became,become,becoming,keeps,kept,keeping,keep,get,gets,got,getting,comes,come,came,coming]),w(P):member(P,[warm,warmed,warmer,hot,hotter,tepid])].
      

% kept the milk warm

question(8,b,0): rule(1,4,1) :: complete
==> [c(vg:[pol=pos,head=W]):member(W,[keeps,keep,kept,keeping]),c(np:[head=milk]),w(P):member(P,[warm,warmed,warmer,hot,hotter,tepid])].
	



% milk which is/becomes warm/warmed

question(8,b,0): rule(1,5,1) ::complete==> [c(np:[head=M]):member(M,[milk,'Milk']),?(_T/'WDT'),((c(vg:[pol=pos,stem=warm]); c(vg:[pol=pos,head=P]): member(P,[warm,warmed,warmer,hot,hotter,tepid]));c(vg:[pol=pos,head=W]):member(W,[becomes,became,become,becoming,keeps,kept,keeping,keep,get,gets,got,getting]),w(F):member(F,[warm,warmed,warmer,hot,hotter,tepid]))].

% in case any np or vg fails to be formed to match the above rule
% milk is warm/warmer ..
question(8,b,0): rule(1,51,1) ::complete==> [w(M):member(M,[milk,'Milk']),w(is),?(_F/'RB'),?(_A/'RBR'),w(P):member(P,[warm,warmed,warmer,hot,hotter,tepid])].

% heat /energy (from milk)/(from the mother's body) is (then) transferred/passed (i.e. from/through milk to/into baby/child/children)
question(8,b,0):rule(1,6,1)::complete==> [c(np:[head=H]):member(H,[heat,energy]),?(w(from)),?(c(np:[head=Q]):member(Q,[mother,body])),?(_P/'IN'),?(c(np:[head=M]):member(M,[milk,liquid])),c(vg:[pol=pos,stem=W]):member(W,[transfer,pass]),?(_Y/'IN'),?(c(np:[head=J]):member(J,[milk,liquid])),?((_I/'CC';_G/'RB')),?((_J/'IN'; _X/'TO')),c(np:[stem=K]):member(K,[baby,body,child,young,bear])]. %children, babies
     
% the mother's milk is kept/store at body/warm temperature
% it/the milk is stored in the mother polar bear at a warm/ 37/body temperature
question(8,b,0):rule(1,7,1)::complete==> [c(np:[head=M]):member(M,[it,'It',milk,liquid]),?(c(vg:[pol=pos,stem=K]):member(K,[keep,be])),?(_W/'IN'),?(c(np:[head=B]):member(B,[mother,bear])),w(A):member(A,[at,of]),c(np:[head=T,mods=L]):(member(J,L),member(J,[body,warm,high,higher,increased,upper]),member(T,[temperature,temp]))]. 

% their mother's milk will have been inside the body so/and will be warm
question(8,b,0):rule(1,8,1)::complete==> [c(np:[head=milk]),c(vg:[pol=pos,stem=be]),W/'IN':member(W,[in,inside,within]),c(np:[head=body]),(_O/'RB';_L/'CC'),c(vg:[pol=pos,head=warm])].


% the milk (contains fat) and is warm
question(8,b,0):rule(1,9,1)::complete==> [c(np:[head=M]):member(M,[milk,'Milk']),c(vg:[pol=pos,head=_Y]),(w(fat);c(np:[stem=_U])),_K/'CC',c(vg:[head=F,pol=pos]):member(F,[warm,warmed,warmer,hot,hotter,tepid])].

% the inside of a polar bear/mother is warm and so/then is the milk :
% 'so', 'then' are included as adverbs for the verb to be 
question(8,b,0):rule(1,10,1)::complete==>[c(np:[head=inside]),?(w(of)),c(np:[head=B]):member(B,[bear,mother]),c(vg:[head=warm,pol=pos]),_Q/'CC',c(vg:[stem=be,pol=pos]),c(np:[stem=M]):member(M,[milk,'Milk'])]. 


% the milk (that) the baby drinks has been kept warm
question(8,b,0):rule(1,11,1)::complete==>[c(np:[head=M]):member(M,[milk,'Milk',liquid]),?(_W/'WDT'),c(np:[stem=B]):member(B,[baby,bear,child,young]),c(vg:[pol=pos,stem=drink]),c(vg:[stem=keep,pol=pos]),w(W):member(W,[warm,warmer,warmed,hot,hotter,tepid])].

% the milk (that) the baby drinks is warm
question(8,b,0):rule(1,12,1)::complete==>[c(np:[head=M]):member(M,[milk,'Milk',liquid]),_W/'WDT',c(np:[stem=B]):member(B,[baby,bear,young,child]),c(vg:[pol=pos,stem=drink]),c(vg:[pol=pos,stem=W]):member(W,[warm,warmer,warmed,hot,hotter,tepid])].

% the mother's body/mother's/body's heat warms up the milk
question(8,b,0):rule(1,13,1)::complete==>[c(np:[stem=heat]),c(vg:[pol=pos,stem=W]):member(W,[heat,warm]),c(np:[head=milk])].

% the milk will be from inside the mother so will be warm
question(8,b,0):rule(1,14,1)::complete==>[c(np:[stem=M]):member(M,[milk,'Milk','It',it]), c(vg:[pol=pos,stem=be]),?(w(_W)),?(W/'IN':member(W,[inside,within])),c(np:[head=mother]),?(_X/'CC'),c(vg:[head=be,pol=pos]),w(F):member(F,[warm,warmer,warmed,hot,hotter,tepid])].

% the milk, derived from the mammary glands of the mother is heated/warmed from the internal body heat
question(8,b,0):rule(1,15,1)::complete==>[c(np:[stem=milk]),?(_O/','),c(vg:[stem=D,pol=pos]):member(D,[derive,produce,get]),?(_P/'IN'),c(np:[stem=gland]),?(_F/'IN'),c(np:[stem=mother]),c(vg:[pol=pos,stem=H]):member(H,[heat,warm])].

% the milk is at 37 degree



%============================

% Question 8, class 2
%[Milk high energy content/lots of fat/lots of lactose/lots of sugar]


% It/Milk contains fat/lactose/sugar/energy/glucose
question(8,b,0):rule(2,1,1)::complete
==> [c(np:[head=M]):member(M,[it,'It',milk,'Milk']),?(w(F):member(F,[of,from,inside])),?(c(np:[head=mother])),?(w(also)),c(vg:[pol=pos,stem=H1]):member(H1,[contain,have,give]),?(w(also)),?(c(np:[stem=B]):member(B,[baby,child,young,bear,polar])),?(w(a)),?(w(L):member(L,[lot,lots,alot])),?(w(of)),?(c(np:[head=nutrients])),?(_M/'CC'),?(c(vg:[pol=pos,stem=include])),w(V):member(V,[fat,fats,lactose,sugar,sugars,glucose,energy])].


% it/milk is fat
question(8,b,0):rule(2,2,1) ::complete
==> [c(np:[head=M]):member(M,[it,'It',milk,'Milk']),?(w(F):member(F,[of,from,inside])),?(c(np:[head=mother])),c(vg:[pol=pos,head=P]):member(P,[fat,fatty])].     


% it/milk is full/rich/very high of/in/with fat

question(8,b,0):rule(2,3,1)::complete ==> [c(np:[head=M]):member(M,[it,'It',milk,'Milk']),?(w(F):member(F,[of,from,inside])),?(c(np:[head=mother])),?(_L/'RB'),c(vg:[pol=pos,head=P]):member(P,[rich,full,high]),?(w(_W)),w(V):member(V,[fat,fats,lactose,sugar,sugars,energy])].
       

% energy/fat/lactose/sugar contained in the milk
question(8,b,0):rule(2,4,1)::complete
==> [w(W):member(W,[energy,fat,fats,lactose,sugar,sugars]),w(contained),w(in),c(np:[head=milk])].


% fat from the milk
question(8,b,0):rule(2,5,1)::complete
==> [w(W):member(W,[fat,fats,'Fat','Fats']),w(from),c(np:[head=milk])].
     


% fat (contained) in the milk
question(8,b,0):rule(2,6,1)::complete
==> [w(W):member(W,[fat,fats,'Fat','Fats']),?(c(vg:[pol=pos,head=contained])),w(T):member(T,[in,from]),c(np:[head=milk])].

% the baby turns the food into energy
question(8,b,0):rule(2,7,1)::complete ==> [c(vg:[pol=pos,stem=V]):member(V,[turn]),c(np:[stem=K]):member(K,[liquid,milk,food]),?(_P/'IN'),c(np:[head=energy])].


% it/the milk is a very good energy/fat/sugar/glucose/lactose source
question(8,b,0):rule(2,8,1)::complete ==>[c(np:[head=M]):member(M,[it,'It',milk,'Milk']), c(vg:[stem=be,pol=pos]),c(np:[stem=L]):member(L,[energy,sugar,fat,glucose,lactose]), c(np:[stem=source])].

% the contents of the milk, such as/for example starch, glucose and proteins and fats
question(8,b,0):rule(2,9,1)::complete ==>[c(np:[stem=content]),w(of),c(np:[stem=M]):member(M,[milk,'Milk']),?(_P/','),?(_O/'JJ'),?(_I/'IN'),?(c(np:[head=E]):member(E,[example,instance])),c(np:[stem=F]):member(F,[starch,glucose,protein,fat,sugar,lactose])]. 

/*
% the milk/it is (probably) quite fatty/creamy+ fatty
question(8,b,0):rule(2,10,1)::complete ==>[c(np:[head=M]):member(M,[it,'It',milk,'Milk']),c(vg:[head=K,pol=pos]):member(K,[fatty,creamy]),?(_W/','),w(F):member(F,[fatty,creamy])].
*/

% the milk/it is (probably) quite fatty/creamy+ fatty
question(8,b,0):rule(2,10,1)::complete ==>[c(np:[head=M]):member(M,[it,'It',milk,'Milk']),w(U):member(U,[is]),?(_W/'RB'),?(_R/'RB'),w(K):member(K,[fatty,creamy])]. %?(_W/','),w(F):member(F,[fatty,creamy])]. 


% the fat and energy in the milk
% sugar/lactose/glucose/
question(8,b,0):rule(2,11,1)::complete ==>[w(W):member(W,[fat,energy,sugar,lactose,glucose]),?(_P/'CC'),?(w(M):member(M,[fat,energy,sugar,lactose,glucose])),w(in),c(np:[head=milk])].

%============================
% Question 8, class 3
%[respiration to give energy/heat]


/*
the following rule could imply that heat/ energy is transferred from the milk
hence I moved this rule to equivalence class 1
%subset 1: heat/energy transfers

question(8,b,0):rule(3,1,1)::complete
==> [c(np:[head=H]):member(H,[heat,energy]),?(w(from)),?(c(np:[head=mother])),c(vg:[pol=pos,head=W]):member(W,[transfer,transferring,transferred,transfers])].
     
*/
% heat/energy through respiration

question(8,b,0):rule(3,2,1)::complete
==> [c(np:[head=H]):member(H,[heat,energy]),w(through),w(respiration)].


% respiration gives (off) heat/energy
question(8,b,0):rule(3,3,1)::complete==> [w(respiration),c(vg:[pol=pos,stem=W]):member(W,[give,bring]),?(w(_O)),c(np:[head=L]):member(L,[heat,energy])].
    

% the milk is used to make energy
question(8,b,0):rule(3,4,1)::complete==> [c(np:[head=M]):member(M,[it,'It',milk,'Milk']),?(w(F):member(F,[of,from,inside])),?(c(np:[head=mother])),c(vg:[pol=pos,head=U]):member(U,[use,uses,used,using]),c(vg:[pol=pos,head=make]),w(E):member(E,[energy,heat])].
    
     
% respiration takes place (,) this gives off heat/energy
question(8,b,0):rule(3,5,1)::complete==>[w(respiration),c(vg:[pol=pos,stem=H]):member(H,[happen,take,occur]),?(w(_P)),?(((_W/','; _J/'.');_L/'CC' )),(_O/'PRP';_M/'DT'),c(vg:[pol=pos,stem=G]):member(G,[give,bring]),?(w(_F)),c(np:[stem=E]):member(E,[heat,energy])].

%============================
% Question 8, class 4
%[fat used for insulation]


%subset 1: fat as/for insulator/insulation
question(8,b,0):rule(4,1,1)::complete==> [w(F):member(F,[fat,fats]),w(A):member(A,[as,for]),w(I):member(I,[insulator,insulators,insulation])].
    

%subset 2: grow a fat/insulating layer

question(8,b,0):rule(4,2,1)::complete ==> [c(vg:[head=H1,pol=pos]):member(H1,[increase,increases,increased,increasing,grow,grows,grew,grown,growing,get,gets,got,getting,gain,gains,gained,gaining,make,makes,made,making,cause,causes,caused,causing,create,creates,created,creating,produces,produce,produced,producing]),w(P): member(P,[fat,fatty,insulating]),c(np:[head=layer])].

% grow a layer of fat/insulation
question(8,b,0):rule(4,21,1)::complete ==> [c(vg:[head=H1,pol=pos]):member(H1,[increase,increases,increased,increasing,grow,grows,grew,grown,growing,get,gets,got,getting,gain,gains,gained,gaining,make,makes,made,making,cause,causes,caused,causing,create,creates,created,creating,produces,produce,produced,producing]),c(np:[head=layer]),w(of),c(np:[head=P]):  member(P,[fat,insulation]) ].
 

% fat (which) (is) used for insulation


question(8,b,0):rule(4,3,1)::complete==> [c(np:[head=F]):member(F,[fat,fats,'Fat','Fats']),?(w(which)),(c(vg:[pol=pos,stem=H1]):member(H1,[use,go]);c(vg:[pol=pos,head=important])),w(for),w(insulation)].


% (the fat helps the baby) to increase the fat layer/layer of fat under the skin which helps to keep the body heat from escaping

question(8,b,0):rule(4,4,1)::complete==> [c(vg:[stem=F,pol=pos]):member(F,[increase,intensify]),c(np:[head=layer,mods=M]):feature_value(M,[[fat],['Fat'],[fats],['Fats']]),W/'IN':member(W,[under,below,beneath,underneath]),c(np:[head=S]):member(S,[skin,surface]),_/'WDT',?(w(_P)), c(vg:[stem=keep,pol=pos]), c(np:[head=heat]), ?(w(from)), c(vg:[pol=pos,stem=escape])].


% insulating layer of fat
question(8,b,0):rule(4,5,1)::complete==> [c(np:[head=layer,mods=[insulating]]),?(w(_Of)),w(fat)].

% insulating fat layer
question(8,b,0):rule(4,6,1)::complete==>[c(vg:[pol=pos,stem=insulate]), c(np:[head=layer,mods=[fat]])].

% fat/blubber layer for insulation
question(8,b,0):rule(4,61,1)::complete==>[c(np:[stem=layer,mods=[L]]):member(L,[fat,blubber]),w(for),w(insulation)].

% layer of fat/blubber for insulation
question(8,b,0):rule(4,611,1)::complete==>[c(np:[stem=layer]),w(of),w(F):member(F,[fat,blubber]),w(for),w(insulation)].


% fat which causes an insulating layer of skin
question(8,b,0):rule(4,7,1)::complete==>[c(np:[head=fat]),_L/'WDT',c(vg:[head=_P,pol=pos]),c(np:[head=layer,mods=L]):member(insulating,L)].


% makes the fat so it/polar bear baby/bear can be insulated in winter
question(8,b,0):rule(4,8,1)::complete==>[c(np:[head=fat]), (_W/'IN' ; _O/'CC'),(_L/'PRP';c(np:[stem=B]):member(B,[baby,bear,young,child])),c(vg:[stem=insulate,pol=pos])].

% the fat helps to insulate the babies/baby's/bear's body
question(8,b,0):rule(4,9,1)::complete==>[c(np:[stem=fat]),?(c(vg:[stem=_O,pol=pos])),c(vg:[stem=insulate,pol=pos]),c(np:[stem=body])].

% the fat and ( ) (in the milk) goes to/are for insulating/insulate/insulation
question(8,b,0):rule(4,10,1)::complete==>[c(np:[stem=fat]),_W/'CC', c(np:[stem=_L]),?(_H/'IN'), ?(c(np:[stem=milk])),c(vg:[pol=pos,stem=M]):member(M,[go,be]),?(w(_I)),(c(vg:[pol=pos,stem=insulate]);c(np:[stem=insulation]))]. 

% the fat (reduces heat loss/loss of heat from the polar bear) and insulates the polar bear from the cold
question(8,b,0):rule(4,11,1)::complete==>[c(np:[stem=fat]),?(c(vg:[stem=V,pol=pos]):member(V,[reduce,decrease,cut])),?((c(np:[head=loss,mods=[heat]]); c(np:[head=loss]))),?(w(of)),?(c(np:[stem=heat])),?(w(_W)),?(c(np:[stem=K]):member(K,[baby,bear,child,young])),_J/'CC',c(vg:[stem=insulate,pol=pos]),c(np:[stem=H]):member(H,[baby,bear,child,young])].

question(8,b,0):rule(4,12,1)::complete==>[c(np:[stem=fat]),?(c(vg:[stem=V,pol=pos]):member(V,[reduce,decrease,cut])),?(c(np:[head=loss,mods=[heat]])),?(w(_W)),?(c(np:[stem=K]):member(K,[baby,bear,child,young])),_J/'CC',c(vg:[stem=insulate,pol=pos]),c(np:[stem=H]):member(H,[baby,bear,child,young])].

% (The milk helps them to build up their layer of) fat/fat layer which keeps them warm and provides insulation
question(8,b,0):rule(4,13,1)::complete==>[c(np:[stem=layer,mods=F]):feature_value(F,[[fat]]),?(w(of)),?(w(fat)),_W/'WDT',c(vg:[stem=_O,pol=pos]),(_P/'PRP';c(np:[stem=S]):member(S,[bear,child,baby,young])), w(_Y),_I/'CC',c(vg:[pol=pos,stem=O]):member(O,[offer,render,supply,provide]),c(np:[stem=insulation])].

/*
question(8,b,0):rule(4,14,1)::complete==>[c(np:[stem=layer]),?(w(of)),?(w(fat)),_W/'WDT',c(vg:[stem=_O,pol=pos]),_P/'PRP', w(_Y),_I/'CC',c(vg:[stem=O]):member(O,[offer,render,supply,provide]),c(np:[stem=insulation])].
*/
% rule(4,13,1) does not seem to work so we replaced it!
question(8,b,0):rule(4,15,1)::complete==>[c(np:[stem=layer]),?(w(of)),?(w(fat)),_W/'WDT',c(vg:[stem=_O,pol=pos]),(_P/'PRP';c(np:[stem=S]):member(S,[bear,child,baby,young])), w(_Y),_I/'CC',c(vg:[stem=O,pol=pos]):member(O,[offer,render,supply,provide]),c(np:[stem=insulation])].

% fat under the skin to have an insulation layer (to keep warm)
question(8,b,0):rule(4,16,1)::complete==>[c(np:[stem=fat]),_P/'IN',c(np:[head=skin]),c(vg:[pol=pos,head=K]):member(K,[have,cause,get,give,make]),c(np:[stem=layer,mods=[insulation]])].

% fatty (and) so/then will help them/bear/baby build up a layer of insulation
question(8,b,0):rule(4,17,1)::complete==>[w(W):member(W,[fatty,fat]),_L/'CC',_O/'RB',c(vg:[stem=help,pol=pos]),(_J/'PRP';c(np:[stem=B]):member(B,[bear,child,baby,young])),c(vg:[pol=pos,head=K]):member(K,[build,have,cause,get,give,make]),c(np:[stem=layer]),?(w(_W)),c(np:[stem=insulation])].

% fatty (and) so/then will help them/bear/baby build up an insulation layer
question(8,b,0):rule(4,18,1)::complete==>[w(W):member(W,[fatty,fat]),_L/'CC',_O/'RB',c(vg:[stem=help,pol=pos]),(_J/'PRP';c(np:[stem=B]):member(B,[bear,child,baby,young])),c(vg:[pol=pos,head=K]):member(K,[build,have,cause,get,give,make]),c(np:[stem=layer,mods=[insulation]])].

% unused energy can be stored as/like fat. (which) This/it/this fat keeps the baby warm ==> fat used as insulation
question(8,b,0):rule(4,19,1)::complete==>[c(np:[head=energy]),c(vg:[stem=store,pol=pos]),?(_P/'IN'),w(fat),?(_L/'.'),?(c(np:[stem=_U])),c(vg:[pol=pos,stem=keep]),c(np:[stem=A]):member(A,[baby,child,young,bear,him,it]),w(W):member(W,[warm,warmed,warmer,hot,hotter,tepid])].

% (w(fat);c(np:[mods=[fatty]])

% 

%--------------------------

full_mark(question(8,b,0),2).


%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/ucles_sys_sept04/data/8(b).pl').



