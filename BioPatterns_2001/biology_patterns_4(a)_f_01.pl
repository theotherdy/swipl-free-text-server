
%rules for question 4 (a) foundation paper 2001

% changed so that conditions are in the RHS of rule, rather than
% in body of prolog clause.

%:-multifile answer/4.


:- multifile full_mark/2.

:- multifile alternative/2.

:- multifile alternatives/2.
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

% rules for question 4 (a) foundation paper 2001 
/*--------------------------------------------------------------------------------------
question 4(a)
Write down two things about asexual reproduction in plants which make it different from
sexual reproduction.

-----------------------------------------------------------------------------------------*/


 
 % ------------------ equivalence class 1
%set 1
 % (only/just) require one (single) parent/plant,etc
 % require (only/just) one (single) parent/plant etc
/*
need to change the representation of this rule :
1. cannot start with an optional element on the RHS
2. in 'one plant' one is not considered a Det but a modifier for plant! 
question(4,a,0): rule(1,1,1):: complete ==> [?(w(W)), c(vg:[pol=pos,head=M]), ?(w(W)),c(np:[det=C,head=N,mods=Mod])] :-
	member(W,[only,'Only',just,'Just']),
        member(C,['1',one,'One']),
        member(N,[parent,plant,organism,producer]),
	alternative(M,require).
	feature_value(Mod,[[single]]). % Mod could be [] or unified to
                                     % any of the elements of the list
*/

question(4,a,0): rule(1,1,1):: complete ==> [c(vg:[pol=pos,head=M]):(alternatives(M,[require,required]);member(M,[come,comes])),?(w(_From_With)),?(w(W2):member(W2,[only,'Only',just,'Just'])),c(np:[head=N,mods=[C|Mod]]):(member(C,['1',one,'One']),member(N,[parent,plant,organism,producer]),feature_value(Mod,[[single]]))].

% it is done/made/produced/reproduced by one (single) plant and not by two
% this shouldn't overgenerate for something like : more than one
% if it does then make the last bit 'not by two' compulsory not optional
question(4,a,0): rule(1,2,1):: complete ==> [c(vg:[pol=pos,head=M]):member(M,[done,made,produced,reproduced]),?(w(_By)), c(np:[head=P,mods=[E|L]]):(member(P,[parent,plant,organism,producer,thing]),member(E,['1',one,'One']),feature_value(L,[[single]])),?(_W/'CC'),?(w(not)),?(w(_By)),?(w(T):member(T,[two,'Two','2']))].

% set 2
% (only/just) require/occurs with (only/just) a single parent/plant,etc
question(4,a,0): rule(1,3,1):: complete ==> [c(vg:[pol=pos,head=M]):alternatives(M,[require,required]),?(w(_With)),?(w(W1):member(W1,[only,'Only',just,'Just'])),c(np:[det=C,head=N,mods=[single]]):(member(C,[a,nulldet]),member(N,[parent,plant,organism,producer]))].

% (only/just)require (only/just) one single parent

question(4,a,0): rule(1,4,1):: complete ==> [c(vg:[pol=pos,head=M]):alternatives(M,[require,required]),?(w(_With)),?(w(W1):member(W1,[only,'Only',just,'Just'])),c(np:[head=N,mods=[E|L]]):(member(E,[one,'1','One']),feature_value(L,[[single]]),member(N,[parent,plant,organism,producer]))].


% set 3
% (only/just) require (only/just) one (single) living thing
question(4,a,0): rule(1,5,1):: complete ==> [c(vg:[pol=pos,head=M]):alternatives(M,[require,required]),?(w(_With)),?(w(W1):member(W1,[only,'Only',just,'Just'])),w(C):member(C,['1',one,'One']),?(w(single)), w(living),w(T):member(T,[thing,organism])].
	
        
% set 4
% (only/just) require (only/just) a/one single living thing
question(4,a,0): rule(1,6,1):: complete ==> [c(vg:[pol=pos,head=M]):alternatives(M,[require,required]),?(w(_With)),?(w(W1):member(W1,[only,'Only',just,'Just'])),
c(np:[det=C,head=K,mods=[single,living]]):(member(C,[a,nulldet]),alternative(K,thing))].

% set 5
/* if first element on the RHS of the rule is a disjunction i.e. of
the form ( ...; ...) then it doesn't work so I put them in different rules
% (only/just) one (a single) parent (only) is required (only)
question(4,a,0): rule(1,111111,1):: complete ==>
[(c(np:[det=C,head=N,mods=[single]]):(member(C,[a]),member(N,[parent,plant,organism,producer]));c(np:[head=N,mods=[E|Mod]]):(member(E,[one,'1','One']),feature_value(Mod,[[single]]))), ?(w(only)), c(vg:[pol=pos,passive=yes,head=M]):alternative(M,required)].
*/

% (only/just) one (single) parent (only) is required (only)
question(4,a,0): rule(1,7,1):: complete ==>
[c(np:[head=N,mods=[E|Mod]]):(member(E,[one,'1','One']),member(N,[parent,plant,organism,producer]),feature_value(Mod,[[single]])), ?(w(only)), c(vg:[pol=pos,passive=yes,head=M]):alternative(M,required)].

% (only/just) a single parent (only) is required (only)
question(4,a,0): rule(1,8,1):: complete ==>
[c(np:[det=C,head=N,mods=[single]]):(member(C,[a]),member(N,[parent,plant,organism,producer])), ?(w(only)), c(vg:[pol=pos,passive=yes,head=M]):alternative(M,required)].


% set 6
% (only/just) one (a single) living thing (only) is required (only)
question(4,a,0): rule(1,9,1):: complete ==> [c(np:[det=C,head=K,mods=[single,living]]):(member(C,[a,one]),alternative(K,thing)),?(w(only)),
c(vg:[pol=pos,passive=yes, head=M]):alternative(M,required)].



%  require only/just one/one to reproduce/ for reproducing/reproduction
question(4,a,0): rule(1,10,1):: complete ==> [c(vg:[pol=pos,head=M]):alternative(M,require),?(w(W):member(W,[only,'Only',just,'Just'])),w(O):member(O,['1',one,'One']),?(w(K):member(K,[to,for])),(c(vg:[pol=pos,head=J]):alternative(J,reproduce);w(R):alternative(R,reproduction))].
	

						      
% only/just requires one to reproduce/ for reproducing/reproduction
question(4,a,0): rule(1,11,1):: complete ==> [w(W):member(W,[only,'Only',just,'Just']),c(vg:[pol=pos,head=M]):alternative(M,require),w(O):member(O,['1',one,'One']),?(w(K):member(K,[to,for])),
(c(vg:[pol=pos,head=J]):alternative(J,reproduce);
w(R):alternative(R,reproduction))].

% only/just happens in (single) one/a single plant
/*
question(4,a,0): rule(1,12,1):: complete ==>[w(W):member(W,[only,'Only',just,'Just']),c(vg:[pol=pos,head=M]):alternative(M,happens),?(w(I):member(I,[in,with,to])),(c(np:[head=Y,mods=[E|_List]]):(member(Y,[parent,plant,organism,producer]),member(E,[one,'One','1'])); c(np:[det=C,head=K,mods=[single]]):(member(K,[parent,plant,organism,producer]),member(C,[a])))].
*/
% something like 'only/just happens in more than one plant' will fail because of the existence of more edges not because there is any difference on the mods in the np
question(4,a,0): rule(1,12,1):: complete ==>[c(vg:[pol=pos,head=M]):alternative(M,happens),?(w(I):member(I,[in,with,to])),(c(np:[head=Y,mods=[E|_List]]):(member(Y,[parent,plant,organism,producer]),member(E,[one,'One','1'])); c(np:[det=C,head=K,mods=[single]]):(member(K,[parent,plant,organism,producer]),member(C,[a])))].

% happens (also) in just/only one plant
question(4,a,0): rule(1,13,1):: complete ==>[c(vg:[pol=pos,head=M]):alternative(M,happens),?(w(_Also)),(_W/'IN';_P/'TO'),w(J):member(J,[only,just,'Only','Just']),c(np:[stem=K,mods=L]):(member(K,[parent,plant,organism,producer]),member(E,L),member(E,[one,'One','1']))].																		

% no (need for) a partner/a mate/partners/mates
% no (need for) two plants/parents/gametes
% no (need for) more than one/plant/parent/gamete
% no (need for) another plant
question(4,a,0): rule(1,14,1):: complete ==> [w(W):member(W,[no,'No']),   ?(w(M):alternative(M,need)),  % 'need' has to be a noun --add to list of alt
					     ?(w(for)),
					     (c(np:[det=Det,head=N]):(member(N,[partner,mate,partners,mates]),
								      member(Det,[nulldet,a,the]));
					      c(np:[head=G,mods=[T]]):(member(T,['2','Two',two]),
								    member(G,[plants,parents,gametes]));
					      c(np:[det=another,head=J]):member(J,[plant,parent,gamete]))].


% doesn't need .. (same as above)
question(4,a,0): rule(1,15,1):: complete ==> [c(vg:[pol=neg,head=V]):alternative(V,require),((c(np:[det=Det,head=N]):(member(N,[partner,mate,partners,mates]),	  member(Det,[nulldet,a,the]));c(np:[head=G,mods=[T]]):(member(T,['2','Two',two]), member(G,[plants,parents,gametes,'Gametes'])));c(np:[det=A,head=J]):(member(A,[another]),member(J,[plant,parent,gamete])))].
	
	



% (same as above) are/is not required
% a partner/partners etc are not required
/*
question(4,a,0): rule(1,4,1):: complete ==> [(c(np:[det=Det,head=N]):(member(N,[partner,mate,partners,mates]),member(Det,[nulldet,a,the]));c(np:[head=G,mods=[T]]):(member(T,['2','Two',two]),member(G,[plants,parents,gametes,'Gametes']));
c(np:[det=A,head=J]):(member(A,[another]),member(J,[plant,parent,gamete]))),
c(vg:[pol=neg,passive=yes,head=V]):alternative(V,required)].
*/	
% the last rule 1,4,1 does not work as RHS starts with a disjunction
% so the next 3 rules are written instead
question(4,a,0): rule(1,16,1):: complete ==> [c(np:[det=Det,head=N]):(member(N,[partner,mate,partners,mates]),member(Det,[nulldet,a,the])),c(vg:[pol=neg,passive=yes,head=V]):alternative(V,required)].

question(4,a,0): rule(1,17,1):: complete ==> [c(np:[head=G,mods=[T]]):(member(T,['2','Two',two]),member(G,[plants,parents,gametes,'Gametes'])), c(vg:[pol=neg,passive=yes,head=V]):alternative(V,required)].

question(4,a,0): rule(1,18,1):: complete ==> [c(np:[det=A,head=J]):(member(A,[another]),member(J,[plant,parent,gamete])),
c(vg:[pol=neg,passive=yes,head=V]):alternative(V,required)].

					     
% (can) reproduce/produce/does it on its/their own 
question(4,a,0): rule(1,19,1):: complete ==> [w(W):alternatives(W,[produce,reproduce,fertilise,does]),?(w(it)), %k(2,_S),
			w(on),
			_K/'PRP$',
			w(own)].


% (can) reproduce/produce/does it alone
question(4,a,0): rule(1,20,1):: complete ==> [w(W):alternatives(W,[produce,reproduce,fertilise,does]),
					     ?(w(it)), %k(2,_S),
					     w(alone)].
	

% (can) make/reproduce/produce/fertilise/does it (by) (new plant/plants/organism...) itself/oneself/themselves/himself/herself

question(4,a,0): rule(1,21,1):: complete ==> [w(W):alternatives(W,[produce,reproduce,fertilise,does]),
					     ?(w(it)),
					     ?(w(by)),
					     ?(c(np:[head=N]):member(N,[plant,plants,organism,organisms])),
					     w(K):member(K, [themselves, itself, himself, herself,oneself,themself])].
    
    
 % there does not have to be 2 plants/parents/organisms/producers
question(4,a,0): rule(1,22,1):: complete ==> [c(vg:[head=have,pol=neg]),c(vg:[head=be,pol=pos]),c(np:[head=P,mods=[T]]):(member(P,[plants,parents,organisms,producers]),member(T,['2','Two',two]))].

% there isn't /aren't two parents etc


% does not need to have any contact with another plant
question(4,a,0): rule(1,23,1):: complete ==>[c(vg:[head=V,pol=neg]):alternatives(V,[require,required]),c(vg:[head=have,pol=pos]),c(np:[head=contact]),?(w(_With)),c(np:[head=P,det=another]):member(P,[organism,plant,thing])].

%------------- equivalence class 2


% set 4
% identical/exact/same/copy/copies/replica  of/to/as  the/that/its  parent/original /original plant/parent plant/organism ...
% identical/exact/same   copy/copies/replica  of/to/as  the/that/its  parent/original /original plant/parent plant/organism ...
% identical/exact/same   copy/copies/replica  of/to/as  itself/oneself/herself/himself
question(4,a,0): rule(2,4,1):: complete ==> [w(W):member(W,[identical,exact,same,copy,copies,replica]),
					     ?(w(C):member(C,[copy,copies,replica,replicas])),
					     ?(w(P):member(P,[of,to,as])),
					     (c(np:[head=K]):member(K,[parent,plant,thing,organism,producer]);
					      w(L):member(L,[itself,himself,herself,oneself]))].
	

% set 5
% identical/exact/same/copy/copies/replica  of/to/as  the/that/its old one
% exact/identical  copy/copies  of/to/as  the/that/its old one
question(4,a,0): rule(2,5,1):: complete ==> [w(W):member(W,[identical,exact,same,copy,copies,replica]),
					     ?(w(C):member(C,[copy,copies,replica,replicas])),
					     ?(w(P):member(P,[of,to,as])),
					     c(np:[mods=[old], head=one])].

% set 6
% same/exact/identical genetic material/information ...(to its parent/to the original/original plant ...)
question(4,a,0): rule(2,6,1):: complete ==> [w(W):member(W,[same,identical,exact]),
					     w(genetic),
					     w(K):member(K,[material,information,info,code])].
	


% set 7
% same/identical/exact genetic make up
question(4,a,0): rule(2,7,1):: complete ==> [w(W):member(W,[same,identical,exact]), w(genetic),w(make),w(up)].
	

% set 8
% same/identical/exact genetics/genes/DNA chromosomes 
question(4,a,0): rule(2,8,1):: complete ==>  [w(W):member(W,[same,identical,exact]),
					      w(K):member(K,[genetics,genes,'DNA',chromosomes])].
	
	

% set 9
% genetics/genes/chromosomes/DNA/genetic material/info/code  of the new plant will be identical to the ones of its parent


% set 10
% no genetic variation
% no genetic or DNA variation ... etc
question(4,a,0): rule(2,10,1):: complete ==>  [w(W):member(W,[no,'No']), w(genetic), ?(w(_W)),?(w(_P)),w(variation)].
	

% set 11
% genes/genetics/chromosomes/DNA/genetic material/info/code  are only taken into account from that parent

question(4,a,0): rule(2,11,1):: complete ==> [c(np:[head=G]):member(G,[genes,genetics,chromosomes,'DNA']),c(vg:[head=taken,adv=only]),w(into),w(A):member(A,[account,consideration]),?(w(_From)),c(np:[head=P]):member(P,[parent,producer])].

question(4,a,0): rule(2,12,1):: complete ==> [c(np:[head=G,mods=[genetic]]):member(G,[material,info,code,make]),?(w(up)),c(vg:[head=taken,adv=only]),w(into),w(A):member(A,[account,consideration]),?(w(_From)),c(np:[head=P]):member(P,[parent,producer])].

%  produce/reproduce the exact same thing/plant
question(4,a,0): rule(2,13,1):: complete ==> [c(vg:[head=V,pol=pos]):alternatives(V,[produce,reproduce,does]), c(np:[head=P,mods=L]):(member(P,[plant,thing]),(member(same,L);(member(exact,L);member(identical,L))))].

% the first 3 sets can overgenerate  -- these rules are not in order 

% set 1
% identical (to the/that/its parent/to the original /original plant/parent plant/organism .../plants .../to the one it has come from)
question(4,a,0): rule(2,1,1):: complete ==>[w(identical)].

% set 2
% a clone (to/with/of the/that/its parent/to the original /original plant/parent plant/organism ...)
question(4,a,0): rule(2,2,1):: complete ==>[w(clone)].

% set 3
% clones (to/with/of the/that/its parent/to the original /original plant/parent plant/organism ...)
question(4,a,0): rule(2,3,1):: complete ==> [w(clones)].


% ---------------------equivalence class 3

% set 1
% does not require (any) flowering/flowers/flower
% does not require to flower 
question(4,a,0): rule(3,1,1):: complete ==>  [c(vg:[pol=neg,head=W]):alternative(W,require),
					      ?(w(_W)),
					      w(K):member(K,[flower,flowers,flowering])].

% set 2
% flowers/flowering/flower are/is not required

question(4,a,0): rule(3,2,1):: complete ==>  [w(K):member(K,[flower,flowers,flowering]),
					      c(vg:[pol=neg,passive=yes,head=W]):alternative(W,require)].
	

% set 3
% no need for/to flower/flowering/flowers
question(4,a,0): rule(3,3,1):: complete ==>  [w(N):member(N,['No',no]),
					      w(W):alternative(W,require),
					      ?(w(P):member(P,[to,for])),
					      w(K):member(K,[flower,flowers,flowering])].
	

	


%------------------------equivalence class 4

% set 1 (can this rule be written any better)
%rule(number(4),part(a), subpart(0),4, [modal(vg),w(done),w(at), d([(w(any),w(time)), w(anytime)])] --> [action1]).
% can/may be done at any time
question(4,a,0): rule(4,1,1):: complete ==> [c(vg:[pol=pos,modal=C,head=W]):(member(C,[can,may]),member(W,[do,done])),
					     ?(w(_S)), w(any),w(time)].



% set 2
% can/may be done at anytime
question(4,a,0): rule(4,2,1):: complete ==> [c(vg:[pol=pos,modal=C,head=W]):(member(W,[do,done]),
								     member(C,[can,may])),
					     ?(w(_S)), w(anytime)].
	


% -----------------------equivalence class 5

% set 1
% no fertilisation
question(4,a,0): rule(5,1,1):: complete ==> [w(W):member(W,[no,'No']), w(K):alternative(K,fertilisation)].

	

% -----------------------equivalence class 6

% set 1
% no meiosis 
question(4,a,0): rule(6,1,1):: complete ==> [w(W):member(W,[no,'No']), w(K):alternative(K,meiosis)].


/*
feature_value(Feature_V,List):-
	(member(Feature_V,List); Feature_V=[]).
*/



full_mark(question(4,a,0),2).
	     
%:-compile('c:/Documents and Settings/jana/My Documents/conversion/training_foundation/4(a).pl').

%:- compile('c:/Documents and Settings/jana/My Documents/NPVGTagger_v3/system/data/4(a).pl').
