% rules for question 4(c)(ii) higher tier paper 2003

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
 question : if the scientists do manage to produce a bucardo
 embryo, what problem will they face next?

 answer keys:

 they will need to find a suitable animal to gestate the
 embryo in/no bucardo to implant it in;
 only produce females/no males to mate with;
 no genetic variability/perpetuate genetic diseases
 

% full mark is 1
-----------------------------------------------------------------*/
% equivalence class 1: implant embryo (into host)

full_mark(question(4,c,ii),1).

question(4,c,ii): rule(1,1,1)::complete ==>
    [c(vg:[stem=S,pol=pos]):member(S,[insert,implant,put,grow,develop,
				      gestate,place,transfer,host]),
     c(np:[stem=V]):member(V,[embryo,it,this]) %,
    % ?(_/'IN'),
    % ?c(np:[stem=T]):member(T,[womb,uterus,animal])
    ].


% nominalisation equivalent:

question(4,c,ii): rule(1,'1_1',1)::complete ==>
    [c(np:[stem=S]):member(S,[insertion,implantation,putting,growth,gestation,placing,hosting,development]),
     ?(_/_),
     c(np:[stem=V]):member(V,[embryo]),
     ?(_/'IN')
    ].



% passive equivalent:

question(4,c,ii): rule(1,2,1)::complete ==>
    [
     c(np:[stem=V]):member(V,[embryo,it,this]),
     c(vg:[stem=S,pol=pos,passive=yes]):member(S,[insert,implant,put,grow,gestate,place,transfer,host,develop
						 ]),
     ?(_/'IN')
    ].

% need a surrogate

question(4,c,ii): rule(1,3,1)::complete ==>
    [c(vg:[stem=S,pol=pos]):member(S,[need,find,get]),
     ?(_/_),?(_/_),?(_/_),
     c(np:[stem=V,mods=M]):(member(V,[mother,parent,animal]),member(surrogate,M)),     
     ?(_/'IN')
    ].


% need a female bucado/womb/uterus
question(4,c,ii): rule(1,4,1)::complete ==>
    [c(vg:[stem=S,pol=pos]):member(S,[need,find,get,reproduce]),
     (c(np:[stem=V,mods=M]):(member(V,[bucado]),member(female,M))
      ;
      c(np:[stem=A]):member(A,[womb,uterus,female])
     ),
     ?(_/'IN')
    ].


% will not have a bucado as surrogate or host:


% will not have a female bucado
question(4,c,ii): rule(1,5,1)::complete ==>
    [c(vg:[stem=S,pol=neg]):member(S,[have,get,find]),
     c(np:[stem=V,mods=M]):(member(V,[bucardo]),member(female,M)),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     ?((w(surrogate);w(host)))
    ].


% will have no female bucado
question(4,c,ii): rule(1,'5_1',1)::complete ==>
    [c(vg:[stem=S,pol=pos]):member(S,[have,get,find]),
     c(np:[stem=V,mods=M,det=no]):(member(V,[bucardo]),member(female,M)),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     ?((w(surrogate);w(host)))
    ].


% no female/bucado to carry/gestate embryo
question(4,c,ii): rule(1,6,1)::complete ==>
    [
     c(np:[stem=V,det=no]):member(V,[bucardo,mother,female]),
     c(vg:[stem=S,pol=pos]):member(S,[carry,gestate,implant]),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     c(np:[stem=T]):member(T,[embryo,foetus,it])
    ].



% no bucado womb
question(4,c,ii): rule(1,7,1)::complete ==>
    [
     c(np:[stem=V,mods=M, det=no]):(member(V,[womb,uterus]),
				    member(bucardo,M))
    ].



% equivalence class 2: only produce females/no males to mate with

question(4,c,ii): rule(2,1,1)::complete ==>
    [w(only),
     c(vg:[stem=S,pol=pos]):member(S,[produce,breed,grow,have,get]),
     c(np:[stem=V]):member(V,[bucardo,female]),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     ?(c(vg:[stem=X,pol=pos]):member(X,[breed,mate,reproduce])),
     ?(_/'IN')
    ].


% will not be/produce grow

question(4,c,ii): rule(2,2,1)::complete ==>
    [
     c(vg:[stem=S,pol=neg]):member(S,[produce,breed,grow,be,able,have,get]),
     (c(np:[stem=V]):member(V,[bucardo,male])
     ;
      c(np:[stem=X,mods=M]):(member(X,[clone,animal,mate]),
			     member(male,M))
     )
    %  ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_) %,
   %  c(vg:[stem=X,pol=pos]):member(X,[breed,mate,reproduce]),
    
    ].



question(4,c,ii): rule(2,'2_1',1)::complete ==>
    [
     c(vg:[stem=S,pol=neg]):member(S,[produce,breed,grow,be,able]),
    
      ?(_/_), ?(_/_), % ?(_/_), ?(_/_), ?(_/_),
     c(vg:[stem=X,pol=pos]):member(X,[breed,mate,reproduce]),
       ?(_/_), ?(_/_), %?(_/_), ?(_/_), ?(_/_),
      c(np:[stem=V]):member(V,[bucardo,male])
    
    ].

% no male to mate with

question(4,c,ii): rule(2,3,1)::complete ==>
    [ 
      c(np:[stem=V,det=no]):member(V,[male]),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     c(vg:[stem=X,pol=pos]):member(X,[breed,mate,reproduce]),
     ?(_/'IN')
    ].


% no male bucardo to mate with

question(4,c,ii): rule(2,3,1)::complete ==>
    [ 
      c(np:[stem=V,det=no,mods=M]):(member(V,[bucardo]),
				    member(male,M)),
     ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
     ?(c(vg:[stem=X,pol=pos]):member(X,[breed,mate,reproduce])),
     ?(_/'IN')
    ].

question(4,c,ii): rule(2,4,1)::complete ==>
    [w(only),
     ?(_/_),     ?(_/_),     ?(_/_),  ?(_/_),     ?(_/_),     ?(_/_),
     w(female)
    ].

% need opposite sex/ only have same sex

question(4,c,ii): rule(2,5,1)::complete ==>
    [c(vg:[stem=S]):member(S,[have,be]),
       ?(_/_),     ?(_/_),     ?(_/_),
     (w(same);w(one)),
     ?(_/_),     ?(_/_),     ?(_/_),
     w(sex)
    ].


question(4,c,ii): rule(2,6,1)::complete ==>
    [
     c(vg:[stem=S]):member(S,[need,make,get,find]),
       ?(_/_),     ?(_/_),     ?(_/_),  ?(_/_),     ?(_/_),
     w(opposite),
     ?(_/_),     ?(_/_),     ?(_/_),
     w(sex)
    ].


% need/find ... male 
question(4,c,ii): rule(2,7,1)::complete ==>
    [
     c(vg:[stem=S]):member(S,[need,make,get,find]),
       ?(_/_),     ?(_/_),     ?(_/_),  ?(_/_),     ?(_/_),
     w(male)
  
    ].



% equivalence class 3: no genetic variability/inherit disease


question(4,c,ii): rule(3,1,1)::complete ==>
    [c(np:[stem=S,mods=M,det=D]):(member(S,[variation,variability,variety]),
				  (D=no;member(little,M)),
				  member(genetic,M))
  
    ].



% being/is etc little genetic v. gets misparsed sometimes:

question(4,c,ii): rule(3,1,1)::complete ==>
    [c(vg:[stem=little]),

    c(np:[stem=S,mods=M]):(member(S,[variation,variability,variety]),
			   member(genetic,M))
  
    ].



% no variation of species/gene pool

question(4,c,ii): rule(3,2,1)::complete ==>
    [
    c(np:[stem=S,mods=M,det=D]):(member(S,[variation,variability,variety]),
				  (D=no;member(little,M))),
    ?(_/_),?(_/_),?(_/_),
     c(np:[stem=T]):member(T,[species,pool])
    ].



% will be genetically identical

question(4,c,ii): rule(3,3,1)::complete ==>
    [
    c(vg:[stem=S,adv=A]):(member(S,[identical,similar]),
			     member(A,[genetically]))
    ].

% decrease/reduce gene pool


question(4,c,ii): rule(3,4,1)::complete ==>
    [
    c(vg:[stem=S]):member(S,[reduce,decrease]),
     ?(_/_),     ?(_/_),
    ?(c(np:[stem=V]):member(V,[variation,variety,variability])),
       ?(_/_),     ?(_/_),
     c(np:[stem=pool,mods=M]):member(gene,M)
    ].


% a reduced gene pool

question(4,c,ii): rule(3,5,1)::complete ==>
    [
        c(np:[stem=pool,mods=M]):(member(gene,M),member(reduced,M))
    ].


% clones prone to aging/disease?? this sometimes seems to get a mark, other times nit

/*
question(4,c,ii): rule(3,6,1)::complete ==>
    [
        c(np:[stem=clone,mods=M]),
       ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_), ?(_/_),
        c(np:[stem=S]):member(S,[aging,ageing,disease,deformity])
    ].
*/


