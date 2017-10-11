% rules for question 5 (a)(ii) foundation paper 2001 
/*--------------------------------------------------------------------------
question 5(a)(ii)
... identical twins growing in a uterus. Explain what has caused these
twins to be indentical
---------------------------------------------------------------------------*/

:- multifile alternatives/2.
:- multifile alternative/2.

%:-multifile answer/4.
:- multifile full_mark/2.

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


% ---------------equivalence class 1

%question(5,a,ii): rule(1,1,1):: complete ==> [w(chromosomes), d([(k(6,_Sequence),w(identical)),(k(6,_Seq),w(same))])] --> [action1]).


% set 1
% the chromosomes/genetics/genes/DNA  are identical/(both) the same (as each other)
% the chromosomes which are ... are identical   : here 'which are...' is a relative clause modifying chromosomes

/*
question(5,a,ii): rule(1,1,1):: complete ==> [c(np:[head=W]),c(vg:[head=_V]),?(w(_L1)), ?(w(_L2)),w(K)]:-
	member(W,[genetics,genes,'DNA',chromosomes]),
	member(K,[identical,same,exact]).
*/

question(5,a,ii): rule(1,1,1):: complete ==> [c(np:[head=W]):member(W,[genetics,genes,'DNA',chromosomes]),c(vg:[head=K,pol=pos]):member(K,[identical,same,exact])].

% genes are all the same

question(5,a,ii): rule(1,11,1):: complete ==> [c(np:[head=W]):member(W,[genetics,genes,'DNA',chromosomes]),c(vg:[head=V,pol=pos]):member(V,[are,is]),?(w(_All)),?(w(T):member(T,[the,'The'])),w(K):member(K,[identical,same,exact])].

% the chromosomes which give them their appearance are identical
% ... relative pronoun vg np (np)

/*
question(5,a,ii): rule(1,11,1):: complete ==> [c(np:[head=W]):member(W,[genetics,genes,'DNA',chromosomes]), W/'WDT', c(vg:[head=_K]),c(np:[head=_L]),?(c(np:[head=_F])), c(vg:[head=K]):member(K,[identical,same,exact])].
*/

question(5,a,ii): rule(1,111,1):: complete ==> [c(np:[head=T]):member(T,[genetics,genes,'DNA',chromosomes]), w(W):member(W,[which,that]), c(vg:[pol=pos,head=_K]),c(np:[head=_L]),?(c(np:[head=_F])), c(vg:[head=K,pol=pos]):member(K,[identical,same,exact])].	 
% set 2
% genetic info/material/information/code are identical/(for both) are the same 
question(5,a,ii): rule(1,2,1):: complete ==> [w(genetic),w(W):member(W,[material,information,info,code,make]),?(w(_L1)),?(w(_L2)),?(w(_L3)), ?(w(_L4)),w(K):member(K,[identical,same,exact])].
	
	

% set 2,11
% genetic make up is identical/(for both) is the same
question(5,a,ii): rule(1,211,1):: complete ==> [w(genetic),w(make),w(up),?(w(_L1)),?(w(_L2)),?(w(_L3)),w(K):member(K,[identical,same,exact])].
	

% set 2,111
% genetic info/material.... (derives/derived) from the same gametes 
question(5,a,ii): rule(1,2111,1):: complete ==> [w(genetic),w(K):member(K,[material,information,info,code]), ?(c(vg:[head=V,pol=pos]):alternatives(V,[derived,derive])),?(w(_L1)),?(w(_L2)), w(same),w(gametes)].
	
	

% set 2,1111
% genetic make up (derives/derived) from the same gametes 
question(5,a,ii): rule(1,21111,1):: complete ==> [w(genetic),w(make), w(up),?(c(vg:[head=V,pol=pos]):alternatives(V,[derived,derive])),?(w(_L1)),?(w(_L2)), w(same),w(gametes)].
	%member(K,[material,information,info,code]),
	

% set 3
% same/identical/exact genetic material/information/info/code
question(5,a,ii): rule(1,3,1):: complete ==> [w(W):member(W,[same,identical,exact]), w(genetic),w(K):member(K,[material,information,info,code,make,makeup]),?(w(up))].
	
	
/*
% set 3,11
% same/identical/exact genetic make up
question(5,a,ii): rule(1,311,1):: complete ==> [w(W):member(W,[same,identical,exact]),w(genetic),w(make),w(up)].
	
*/
% set 4
% same/identical/exact genetics/genes/DNA/chromosomes
question(5,a,ii): rule(1,4,1):: complete ==>  [w(W):member(W,[same,identical,exact]), w(K):member(K,[genetics,genes,'DNA',chromosomes])].
	
	

% set 5
% genetically ... same/identical/exact 
question(5,a,ii): rule(1,5,1):: complete ==> [w(genetically), ?(w(_L1)),?(w(_L2)), w(W):member(W,[same,identical,exact])].
	


% ---------------------------equivalence class 2


% set 1
% come/formed/are from ... same/single egg and (same/single) sperm

question(5,a,ii): rule(2,1,1):: complete ==> [w(W):member(W,[come,formed,are]), w(from), ?(w(_L1)), w(K):member(K,[same,single]), w(egg), w(J):alternative(J,and), ?(w(S):member(S,[same,one,'One','1',single])), w(sperm)].
	
	
% set 2
% come/formed/are from ..only one egg and (one/single/same) sperm
question(5,a,ii): rule(2,2,1):: complete ==> [w(W):member(W,[come,formed,are]), w(from),?(w(_L2)),w(only),w(K):member(K,[one,'One','1']), w(egg), w(J):alternative(J,and),?(w(only)), ?(w(S):member(S,[same,one,'One','1',single])), w(sperm)].
	
	
	
	
/*
question(5,a,ii): rule(2,3,1):: complete ==> [d([w(come),w(formed),w(are)]), w(from), k(1,_S1), d([w(same),(w(only),d([w(one),w('One'),w('1')])), w(single)]), w(sperm), alt(w(and)), d([w(same),w(one),w('One'),w('1'), w(single)]), w(egg)] --> [action1]).

*/

% set 3
% come/formed/are from ... same/single sperm and (same/single) egg

question(5,a,ii): rule(2,3,1):: complete ==> [w(W):member(W,[come,formed,are]), w(from),?(w(_L1)), w(K):member(K,[same,single]), w(sperm), w(J):alternative(J,and), ?(w(S):member(S,[same,one,'One','1',single])), w(egg)].
	
	
	
	

% set 4
% come/formed/are from ..only one sperm and (one/single/same) egg
question(5,a,ii): rule(2,4,1):: complete ==> [w(W):member(W,[come,formed,are]), w(from), ?(w(_L1)),w(only),w(K):member(K,[one,'One','1']), w(sperm), w(J):alternative(J,and),?(w(only)), w(S):member(S,[same,one,'One','1',single]), w(egg)].
	

% without the second determiner --the following should be combined with the previous rules

/*  done - combined with previous ones
rule(number(5),part(a), subpart(ii),2, 3, [d([w(come),w(formed),w(are)]), w(from), k(1,_S), d([w(same),w(one),w('One'),w('1'), w(single)]), w(egg), alt(w(and)), w(sperm)] --> [action1]).
*/

/* the following two rules have been incorporated in the above previous rules
% the other way conjunction
rule(number(5),part(a), subpart(ii),2, 6, [d([w(come),w(formed),w(are)]), w(from), k(1,_S), d([w(same),w(one),w('One'),w('1'), w(single)]), w(sperm), alt(w(and)), d([w(same),w(one),w('One'),w('1'), w(single)]), w(egg)] --> [action1]).

rule(number(5),part(a), subpart(ii),2, 7, [d([w(come),w(formed),w(are)]), w(from), k(1,_S), d([w(same),w(one),w('One'),w('1'), w(single)]), w(sperm), alt(w(and)), w(egg)] --> [action1]).

rule(number(5),part(a), subpart(ii),2, 8, [d([w(same),(w(only),d([w(one),w('One'),w('1')])), w(single), w(a), w(the)]), w(sperm), k(2,_S), alt(w(fertilise)), k(1,_S), d([w(same),w(one),w('One'),w('1'),w(single), w(a), w(the)]), w(egg)] --> [action1]).
*/

% set 5
% active and passive (fertilises, fertilized by)
% look at training data again because this can be written as vg:passive,etc

% same/single/a/the egg is/will be/has been fertilised by same/one/1...sperm
question(5,a,ii): rule(2,5,1):: complete ==> [c(np:[head=egg ,mods=[W]]):member(W,[same,single]), c(vg:[pol=pos,head=K,passive=yes]):alternative(K,fertilised), ?(w(_By)), (c(np:[head=sperm,mods=[L]]):member(L,[same,one,'One','1',single]); c(np:[head=cell,mods=[L,E]]):(member(L,[same,one,'One','1',single]),member(E,[sperm])  ))].
	
% The egg has been fertilised by the/one sperm 

question(5,a,ii): rule(2,51,1):: complete ==> [c(np:[det=I,head=egg]):member(I,[the,'The']), c(vg:[pol=pos,head=K,passive=yes]):alternative(K,fertilised), ?(w(_By)), (c(np:[head=sperm,det=J]):member(J,[the,'The']);c(np:[head=sperm,mods=[P]]):member(P,[one,'One',single,'1',same]))].
	
%  the egg becomes fertilised (and starts to develop it multiplies and) splits up in to 2 different eggs  -- this may overgenerate

question(5,a,ii): rule(2,511,1):: complete ==> [c(np:[head=egg]),c(vg:[pol=pos,head=K]):member(K,[fertilised,fertilized]),?(_G/'CC'), ?(c(vg:[pol=pos,head=_P])),?(c(vg:[pol=pos,head=_O])),?((_W/'PRP'; c(np:[head=egg]))), c(vg:[pol=pos,head=_I]),?(_J/'CC'), c(vg:[pol=pos,head=S]):(alternative(S,split); member(S,[broken,gone,broke]))].
						 
% the same sperm fertilising the same egg
question(5,a,ii): rule(2,5111,1):: complete ==> [c(np:[head=sperm,mods=[L]]):member(L,[same,exact]),c(vg:[pol=pos,head=F]):member(F,[fertilising,fertilizing]), 
	c(np:[head=egg,mods=[L]]):member(L,[same,exact])].


% the same egg fertilised by the same sperm

% we need this rule because as it is fertilised is not passive and hence it is not captured in rule 2,5,1
question(5,a,ii): rule(2,51111,1):: complete ==> [c(np:[head=egg,mods=[L]]):member(L,[same,exact]),c(vg:[pol=pos,head=F]):member(F,[fertilised,fertilized]),?(w(_By)), 	c(np:[head=sperm,mods=[L]]):member(L,[same,exact])].


% set 6
% only one egg is/will be/has been fertilised by (same)...sperm
question(5,a,ii): rule(2,6,1):: complete ==> [w(O):member(O,[only,'Only']),c(np:[head=egg,mods=[W]]):member(W,[one,'One','1']), c(vg:[pol=pos,head=K,passive=yes]):alternative(K,fertilised), ?(w(_L3)), ?((c(np:[head=sperm,det=D]):member(D,[a,the,'The']);c(np:[head=sperm,mods=[L]]):member(L,[same,one,'One','1',single])))].
	
	
	

% set 7
% fertilises one/same .. egg
question(5,a,ii): rule(2,7,1):: complete ==> [w(K):alternative(K,fertilise), w(L):member(L,[same,one,'One','1',single,a,the,'The']), w(egg)].
	
	

% set 7,1
% same/single/one fertilised egg
question(5,a,ii): rule(2,71,1):: complete ==> [w(W):member(W,[the,same,one,'One','1',single,unique]),w(K):alternative(K,fertilised),w(egg)].
	
	
% set 7,11
% same/single/one egg has been fertilised   : isn't this subsumed by rule 6 above?
question(5,a,ii): rule(2,711,1):: complete ==> [w(W):member(W,[the,same,one,'One','1',single]),w(egg), c(vg:[pol=pos,head=K,passive=yes]):alternative(K,fertilised)].
	
% set 7,111
question(5,a,ii): rule(2,7111,1):: complete ==> [w(W):member(W,[the,same,one,'One','1',single]),w(egg),?(w(_L1)), ?(w(_L2)), w(K):alternative(K,fertilisation)].
	
	

% set 8
% come/are/formed/produced from the same one/single embryo
question(5,a,ii): rule(2,8,1):: complete ==> [(w(W):member(W,[come,formed,are]);w(K):alternative(K,produce)), w(from), ?(w(_L1)), w(L):member(L,[same,one,'One',single,'1']), w(embryo)].
	
	
	

% set 9
% come/are/formed/produced from the same/one/identical/exact  bundle of cells
question(5,a,ii): rule(2,9,1):: complete ==>  [?((w(L1);w(L2)):(member(L1,[come,formed,are]), alternative(L2,produced))), ?(w(from)), ?(w(_L1)), w(W):member(W,[same,one,'One',single,'1',identical,exact]), w(J):member(J,[bundle,bundles]),?(w(_L2)), w(cells)].
	
	
	
	

/*
	subsumed by the last rule 
% identical bundle(s) of cells
question(5,a,ii): rule(2,10,1):: complete ==> [w(W), ?(w(L1)), w(cells)]:-
	member(W,[same,one,'One',single,'1',identical]),
	member(J,[bundle,bundles]).
*/

% set 11
% same/one/single zygote  -- uniqueness is also assumed with the,The
question(5,a,ii): rule(2,11,1):: complete ==> [w(W):member(W,[the,'The',same,one,'One','1',single]),w(zygote)].
	
% set 12
% monozygote,monozygotic
question(5,a,ii): rule(2,12,1):: complete ==>  [w(W):member(W,[monozygote, monozygotic])].
	
% a zygote has split (into two)
question(5,a,ii): rule(2,121,1)::complete==>[c(np:[head=zygote]),c(vg:[head=S,pol=pos]):(member(S,[broken,broke,gone]);alternative(S,split)),?(w(_In)),?(w(_To)),w(T):member(T,[two,'Two','2'])].

% set 15
% mitosis
question(5,a,ii): rule(2,15,1):: complete ==> [w(mitosis)].


% set 16
% egg has been fertilised/after fertilisation (by one sperm) split/has split etc 
question(5,a,ii): rule(2,16,1):: complete ==> [w(egg), ?(w(_L)),?(w(_J)),?(w(_N)), w(J):alternatives(J,[fertilisation,fertilised]), ?(w(_L1)),?(w(_L2)), c(vg:[head=S,pol=pos]):alternative(S,split)].

% a sperm  had fertilised the/an egg (and or pnct or then) the egg/it (then) splits into two
question(5,a,ii): rule(2,161,1):: complete ==> [c(np:[head=sperm]),c(vg:[pol=pos,head=F]):member(F,[fertilised,fertilized,fertilizes,fertilises,fertilise,fertilize]),c(np:[head=egg]),?(((_E/'CC';_U/',' ); _K/'RB')),(_W/'PRP';c(np:[head=egg])), ?(_R/'RB'),c(vg:[pol=pos,head=V]):(alternative(V,split);member(V,[broken,gone,broke]))].  

% a sperm cell had fertilised the/an egg (and or pnct or then) the egg/it (then) splits into two

question(5,a,ii): rule(2,1611,1):: complete ==> [c(np:[head=cell,mods=R]):member(sperm,R),c(vg:[pol=pos,head=F]):member(F,[fertilised,fertilized,fertilizes,fertilises,fertilise,fertilize]),c(np:[head=egg]),?(((_E/'CC';_U/',' ); _K/'RB')),(_W/'PRP';c(np:[head=egg])), ?(_R/'RB'),c(vg:[pol=pos,head=V]):(alternative(V,split);member(V,[broken,gone,broke]))].

% set 17
% egg split/has split etc (into two) after being fertilised/fertilisation
question(5,a,ii): rule(2,17,1):: complete ==> [w(W):member(W,[egg,fetus,foetus]),c(vg:[head=J,pol=pos]):alternative(J,split), ?(w(_L1)),?(w(_L2)), ?(w(F):member(F,[two,'Two','2'])),w(after), ?(w(_L1)),w(S):alternatives(S,[fertilisation,fertilised])].
	
%	 w(S):member(S,[fertilisation,fertilization,fertilised,fertilized])]w(S):alternat

% set 18
% egg after fertilisation has gone/being broken/been broken in two halves
question(5,a,ii): rule(2,18,1):: complete ==> [w(egg), ?(w(_L2)),?(w(_O)),?(w(_I)), w(K):alternatives(K,[fertilisation,fertilised]), ?(w(_L1)), c(vg:[pol=pos,head=M]):member(M,[broken,gone]), w(J):alternative(J,in), w(L):alternative(L,two),w(S):member(S,[half,halves])].
	

% set 19
% egg has gone/being broken (after fertilisation) in two halves
% we should have written the rule also for the following
% (fertilised) egg has gone/being broken (after fertilisation) in two halves
% we decided to make the rules a bit easier to read
% however, see rule 19,1 it takes all the possibilities together

question(5,a,ii): rule(2,19,1):: complete ==> [w(egg), c(vg:[pol=pos,head=M]):member(M,[broken,gone]), ?(w(_W)), w(K):alternatives(K,[fertilisation,fertilised]), w(J):alternative(J,in), w(L):alternative(L,two),w(S):member(S,[half,halves])].
	

% set 19,1
% fertilised egg has gone/being broken in two halves( after fertilisation)
question(5,a,ii): rule(2,191,1):: complete ==> [w(W):member(W,[fertilised,fertilized]),w(egg), c(vg:[pol=pos,head=M]):member(M,[broken,gone]), w(J): alternative(J,in) , w(L):alternatives(L,[two,'2']),w(S):member(S,[half,halves]),  ?(w(_W)),?(w(K):alternatives(K,[fertilisation,fertilised]))].
	
	
	
% set 19,2	
% (fertilised) egg has gone/being broken in two halves after fertilisation	
question(5,a,ii): rule(2,192,1):: complete ==> [w(egg), c(vg:[pol=pos,head=M]):member(M,[broken,gone]), w(J): alternative(J,in) , w(L):alternatives(L,[two,'2']),w(S):member(S,[half,halves]),  w(after),w(K):alternatives(K,[fertilisation,fertilised])].
	
% set 20
% one fertilised egg has split
question(5,a,ii): rule(2,20,1):: complete ==>  [w(A):member(A,[1,one,same,the,'One']), ?(w(_W)), w(K):alternatives(K,[fertilisation,fertilised]), w(A), ?(w(_L)), w(egg), c(vg:[head=N,pol=pos]):alternative(N,split)].
	
	
% fertilised, & the egg has split
question(5,a,ii): rule(2,201,1):: complete ==> [w(F):alternative(F,fertilised), ?(_W/','),?(_K/'CC'), c(np:[head=egg]),c(vg:[head=N,pol=pos]):alternative(N,split)].
% fertilised, & the egg has gone into two 
question(5,a,ii): rule(2,2011,1):: complete ==> [w(F):alternative(F,fertilised), ?(_W/','),?(_K/'CC'), c(np:[head=egg]),c(vg:[head=N,pol=pos]):member(N,[gone]),w(I):member(I,[in,into]),w(J):alternative(J,two)].


% set 21
% a sperm has fertilised/fertilises an egg which has broken/broke
question(5,a,ii): rule(2,21,1):: complete ==> [w(G):member(G,['Same',same,a,'A',the,'The',an]), w(sperm), c(vg:[head=L,pol=pos,passive=no]):alternatives(L,[fertilise,fertilised]), w(A):member(A,['Same',same,a,'A',the,'The',an]), ?(w(_L)), w(egg), ?(w(_K)),c(vg:[pol=pos,head=M]):(member(M,[broken,gone,broke]);alternative(M,split))].

% one sperm has fertilised/fertilises one egg --this rule may overgenerate
% more than one ...but not all answers have only/just one ..
question(5,a,ii): rule(2,211,1):: complete ==> [w(G):member(G,['One','1',one]), w(sperm), c(vg:[head=L,pol=pos,passive=no]):alternatives(L,[fertilise,fertilised]), ?(_W/','),w(A):member(A,['One','1',one]), w(egg)].

% one egg fertilised by one sperm -- this rule may overgenerate
% more than one ...but not all answers have only/just one ..


question(5,a,ii): rule(2,2111,1):: complete ==> [w(G):member(G,['One','1',one]), w(egg), c(vg:[head=L,pol=pos]):alternatives(L,[fertilise,fertilised]), ?(_W/','),?(w(_By)),w(A):member(A,['One','1',one]), w(sperm)].



% one sperm has split the egg in two after being fertilized /after fertilisation

question(5,a,ii): rule(2,21111,1):: complete ==> [c(np:[head=sperm,mods=[L]]):member(L,[one,'One','1']), c(vg:[head=S,pol=pos]):(alternative(S,split);member(S,[broken,gone,broke])), c(np:[head=egg]),?(w(_IN)),?(w(_To)),?(w(T):member(T,['2','Two',two])),w(after), (c(vg:[pol=pos,head=V]):member(V,[fertilised,fertilized]); w(F):member(F,[fertilisation,fertilization]))].
        

% set 22
%  fertilised egg has split/split/splits
% (cause) fertilised egg to split
question(5,a,ii): rule(2,22,1):: complete ==> [w(W):alternative(W,fertilised), w(egg), ?(w(_L)), c(vg:[head=K,pol=pos]):alternative(K,split)].
	
	

% set 23
% fertilised egg has been broken/gone
% (cause) fertilised egg to be broken
question(5,a,ii): rule(2,23,1):: complete ==> [w(L):alternative(L,fertilised), w(egg), ?(w(_L)), c(vg:[pol=pos,head=M]):member(M,[gone,broken])].
	
	

% set 24
% (cause) embryo to split
% embryo have split ..
question(5,a,ii): rule(2,24,1):: complete ==> [c(np:[head=embryo]), c(vg:[head=W,pol=pos]):alternative(W,split)].
	

% set 25
% same as rule 23 but with embryo instead of fertilised egg
question(5,a,ii): rule(2,25,1):: complete ==> [ w(embryo), ?(w(_L)), c(vg:[head=M,pol=pos]):member(M,[broken,gone])].
	
% same/one/1 embryo  -- check with a biologist is this correct?
question(5,a,ii): rule(2,251,1):: complete ==> [ w(S):member(S,[same,unique,'One',one,'1']),w(embryo)].


%  passive(fertilise) of some previous rules

% set 26
% one egg has been fertilised by a sperm and/which has broken
question(5,a,ii): rule(2,26,1):: complete ==>[w(W):member(W,['One',one,'Same',same,a,'A',the,'The']), w(egg),c(vg:[head=K,passive=yes,pol=pos]):alternative(K,fertilised), ?(w(_K)), w(J):member(J,[one,same,a,the]), ?(w(_L)), w(sperm),?(w(_W)), c(vg:[pol=pos,head=M]):member(M,[broken,gone])].
	
	
	
	

% set 27
% an egg that has been fertilised has been broken
question(5,a,ii): rule(2,27,1):: complete ==> [w(A):member(A,['One',one,'Same',same,a,'A',the,'The',an]), w(egg), ?(w(_W)),c(vg:[head=B,passive=yes,pol=pos]):alternative(B,fertilised), c(vg:[pol=pos,head=M]):(member(M,[broken,gone]);alternative(M,split))].
	
% set 28
% the egg from the mother must have split and so while fertilised there are now two eggs
question(5,a,ii): rule(2,28,1):: complete ==> [c(np:[head=egg]),?(w(from)),?(c(np:[head=_])),c(vg:[pol=pos,head=S]):(alternative(S,split);member(S,[broken,broke])),?((_P/'CC';_O/',')),?(w(_So)),?(w(_While)), c(vg:[pol=pos,head=V]):member(V,[fertilised,fertilized]),w(there),w(J):member(J,[are,is]),?(w(_Now)),w(T):member(T,[two,'Two','2'])].
	
% set 29 -- unique example!
% the/The egg produced by the women interacted with the sperm (i.e. got fertilised!) then the egg split into (in to ..) two /in half etc

question(5,a,ii): rule(2,29,1):: complete ==> [c(np:[head=egg]), ?(c(vg:[head=_P,pol=pos])),?(w(_By)),c(np:[head=W]):member(W,[women,woman,mother,female]),c(vg:[head=I,pol=pos]):member(I,[interact,interacts,interacted]),_W/'IN',c(np:[head=sperm]),?(((_K/'RB' ;_L/',' );_G/'CC' )), (_J/'PRP'; c(np:[head=egg])), c(vg:[head=S,pol=pos]):(alternative(S,split);member(S,[broke,broken,gone]))].


% set 30
% one egg, however (,) after it/the egg is fertilised, the cell splits/gone into two

question(5,a,ii): rule(2,30,1):: complete ==> [c(np:[head=egg]),?(_O/','),?((_U/'RB';_M/'CC')),?(_Y/','),w(after),(c(np:[head=egg]);_J/'PRP'), c(vg:[pol=pos,head=F]):member(F,[fertilised,fertilized]),?(_H/','), (c(np:[head=C]):member(C,[cell,egg]);_D/'PRP'),c(vg:[head=V,pol=pos]):(member(V,[broken,broke,gone]);alternative(V,split))].




full_mark(question(5,a,ii),2).

%:-compile('c:/Documents and Settings/jana/My Documents/conversion/training_foundation/5(a)(ii).pl').
%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/5(a)(ii).pl').
