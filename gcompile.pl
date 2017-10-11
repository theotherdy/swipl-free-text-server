/*******************************************************************

GRAMMAR COMPILER
----------------

File: gcompile.pl 
Version 1, January 1994.
Stephen Pulman, SRI Cambridge
(C) the FraCaS project

This file contains the rule compiler, turning rules in the notation
described in `formalism.txt' into things suitable for parsing with.
Not yet extensively debugged.


Changes Nov 97 for MPhil usage sgp.
Changes Aug 98 for HOL usage: :: functor etc.

Sept 2003: Version of original gcompile.pl for patterns
June 2005: Note that patterns only use a subset of the constructs
supported by this compiler.
*******************************************************************/

/*******************************************************************
Rules/patterns are of the form:

Name syn/sem  Mother ==> [Daughter1,...,DaughterN]

where Name is a term, and Mother and Daughters are categories.

Lexical entries are of the form:

Word syn/sem Category.
*******************************************************************/

:- op(1000,xfx,'::'). % not used in current grammar (but used in patterns)

:- dynamic cmp_startcat/2,
           cmp_synrule/3,
           cmp_synword/2,
           cmp_semrule/3,
           cmp_semword/2,
           bits/3,
           types/2,
           id/3,
           bv/2,
           boolean_feature_models/2.


/*******************************************************************
Predicate: GCOMPILE
Args: none
Succeeds: once
Comment: Assumes relevant declarations, grammar
         and words have been loaded. Cleans up from
         last time and compiles everything
*******************************************************************/

gcompile :-
 (clause('::'(_,_),_) -> expand_any_colon_rules ; true),
 syn_compile,
 sem_compile.


/*---------------------------------------------------------------------
rules with a colon may make use of prolog predicates
to produce the compile time form of the rule. The colon
form is therefore expanded into the syn forms before compilation
----------------------------------------------------------------------*/

/* Not used in this application:

expand_any_colon_rules :-
 (Id :: Body),
 assert((Id syn Body)),
 fail.

expand_any_colon_rules.


*/


/*---------------------------------------------------------------------
Predicate: re_initialise_syntax
Args: none
Succeeds: once
Comment: Assumes relevant declarations, grammar
         and words have been loaded. Cleans up from
         last time.
----------------------------------------------------------------------*/


re_initialise_syntax :-
 retractall(cmp_startcat(_,_)),
 retractall(cmp_synrule(_,_,_)),
 retractall(cmp_synword(_,_)),
 retractall(types(_,_)),
 retractall(bits(_,_,_)),
 retractall(id(_,_,_)),
 retractall(bv(_,_)),
 retractall(boolean_feature_models(_,_)).

/*---------------------------------------------------------------------
Predicate: re_initialise_semantics
Args: none
Succeeds: once
Comment: Assumes relevant declarations, grammar
         and words have been loaded. Cleans up from
         last time.
----------------------------------------------------------------------*/


re_initialise_semantics :-
 retractall(cmp_semrule(_,_,_)),
 retractall(cmp_semword(_,_)).


/*******************************************************************
Predicate: SYN_COMPILE
Args: none
Succeeds: once
Comment: Assumes relevant declarations, grammar
         and words have been loaded. Cleans up from
         last time and compiles syn rules and words
*******************************************************************/

syn_compile :-
 re_initialise_syntax,
 (boolean_feature(none,_) ; compile_boolean_declarations),
 (lattice_feature(none,_) ; compile_lattice_declarations),
 write('Compiling syn rules...'),nl,
 compile_synrules,
 write('Compiling syn words...'),nl,
 compile_synwords,
 write('Compiling start categories...'),nl,
 compile_start_category.


/*******************************************************************
Predicate: SEM_COMPILE
Args: none
Succeeds: once
Comment: Assumes relevant declarations, grammar
         and words have been loaded. Cleans up from
         last time and compiles syn rules and words
*******************************************************************/

sem_compile :-
 re_initialise_semantics,
 write('Compiling sem rules...'),nl,
 compile_semrules,
 write('Compiling sem words...'),nl,
 compile_semwords.




/*******************************************************************
Predicate: COMPILE_SYNWORDS
-------------------------
Args: none
Succeeds: always, more than once if there are compilable words
Comments: Like compile_rules, but for single categories.
*******************************************************************/

compile_synwords :-
  \+clause(syn(_Word,_Cat:_Feats),_Body),
  write('!!! Cannot find any syn word entries'),
  nl,
  !.

compile_synwords :-
  syn(Word,Cat:Feats),
  compile_cat(Cat:Feats,Compiled),
  assert(cmp_synword(Word,Compiled)),
  fail.

compile_synwords.


/*******************************************************************
Predicate: COMPILE_SEMWORDS
-------------------------
Args: none
Succeeds: always, more than once if there are compilable words
Comments: Like compile_rules, but for single categories.
*******************************************************************/

compile_semwords :-
  \+clause(sem(_Word,_Cat:_Feats),_Body),
  write('!!! Cannot find any sem word entries'),
  nl,
  !.

compile_semwords :-
  sem(Word,Cat:Feats),
  compile_cat(Cat:Feats,Compiled),
  assert(cmp_semword(Word,Compiled)),
  fail.

compile_semwords.


/*******************************************************************
Predicate: COMPILE_START_CATEGORY
---------------------------------
Args: none
Succeeds: always, more than once if there are compilable
          start categories
Comment: start categories are so that the parser knows
         what to look for.
*******************************************************************/

compile_start_category :-
 \+clause(start_category(_Cat,_Result),_Body),
 write('!!! Cannot find any start_category entries'),
 nl,
 !.

compile_start_category :-
 start_category(S,Result),
 compile_cat(S,Compiled),
 assert(cmp_startcat(Compiled,Result)),
 fail.

compile_start_category.






/*******************************************************************
Predicate: COMPILE_SYNRULES
------------------------
Args: 0
Succeeds: Always, more than once if there are compilable rules.
Comments: Main entry point. The other is `compile_words' below.

Like the preceding, uses a failure driven loop to find all the rules,
compile them into the approved format, and assert the compiled form.

*******************************************************************/


compile_synrules :-
 \+clause(syn(_Name,==>(_Mother,_Daughters)),_Body),
 write('!!! Cannot find any synrule  entries'),
 nl,
 !.


compile_synrules :-
  
  syn(Name,==>(Mother,Daughters)),
  write('Compiling syn rule:  '),write(Name),nl,
  compile_categories([Mother|Daughters],[M1|D2]),
  assert(cmp_synrule(Name,M1,D2)),
  fail.

compile_synrules.



/*******************************************************************
Predicate: COMPILE_SEMRULES
------------------------
Args: 0
Succeeds: Always, more than once if there are compilable rules.
Comments: Main entry point. The other is `compile_words' below.

Like the preceding, uses a failure driven loop to find all the rules,
compile them into the approved format, and assert the compiled form.

*******************************************************************/

compile_semrules :-
   \+clause(sem(_Name,==>(_Mother,_Daughters)),_Body),
   write('!!! Cannot find any sem rules'),
   nl,
   !.


compile_semrules :-
  
  sem(Name,==>(Mother,Daughters)),
  write('Compiling sem rule:  '),write(Name),nl,
  compile_categories([Mother|Daughters],[M1|D2]),
  assert(cmp_semrule(Name,M1,D2)),
  fail.

compile_semrules.




/*******************************************************************
Predicate: COMPILE_CATEGORIES(+ListOfUnCompiled,-ListOfCompiled).
-----------------------------------------------------------------
Args: ListOfUnCompiled is a list of categories in their original form:
      e.g. np:[f=v]
      ListOfCompiled is a list of terms representing the compiled form.
Succeeds: Once, if all declarations etc are valid.
Comments:

Compile a list of categories. A category of the form
x:[f1=v1,f2=v2, etc] will be compiled into a term of the form
x(v1,v2,...), where the ordering of the feature values will be
identical to that in the category(x,...) declaration.
*******************************************************************/



compile_categories(X,X) :- 
   var(X), 
   !.

% this covers the case where there is a tail variable

compile_categories([],[]) :- 
   !.

% termination

compile_categories([X|Rest],[X|Rest1]) :-
   var(X),
   !,
   compile_categories(Rest,Rest1).


% this covers the case where there is a variable in a list
% of categories. It's not recommended to do this, as it
% can lead to inefficiency in parsing.

compile_categories([Cat:Feats|Rest],[CompiledCat|Rest1]):-
 compile_cat(Cat:Feats,CompiledCat),
 compile_categories(Rest,Rest1).


/*******************************************************************
Predicate: COMPILE_CAT(+UnCompiled,-Compiled).
----------------------------------------------
Args: Single members of the list supplied by `compile_categories.
Succeeds: Once, if the category is legal.
Comments: Compile a single category.
*******************************************************************/


compile_cat(Cat:Feats,Compiled) :-
  atomic(Cat),               % because : also used for type suffixes now
  category(Cat,Flist),
  compile_feats(Cat,Feats,Flist,Compiled),
  !.

% Get the category declaration, and then compile the features
% accordingly, ...


compile_cat(Cat:_,_) :-
  atomic(Cat),
  \+(category(Cat,_)),
  format("!!! ~w not compiled as category~n",[Cat]),
  fail.

% or issue a warning if no declaration found.

/*******************************************************************
Predicate: COMPILE_FEATS/4.
---------------------------
Args:
 compile_feats(+CategoryName,              % an atom A
               +FeaturesActuallyPresent,   % list of f=v
               +FeaturesFromDeclaration,   % list of atoms
               -TermRepresentingResult).   % term with A as functor
Succeeds: Always succeeds once, if only to issue a warning.
Comments:
Make a template term with the category as the functor, and each
feature value as an argument. The order of arguments will be the same
for a particular category everywhere and will be determined by the
`category' declaration. 
*******************************************************************/



compile_feats(Cat,Feats,Flist,Compiled) :- 
 all_feats_legal(Feats,Flist),
 length(Flist,N),
 functor(Compiled,Cat,N),
 compile_flist(Feats,Flist,Compiled),
 !.

% Put each feature value in the appropriate argument of the term Compiled.
% Succeeds only if all feats are declared for that category

compile_feats(Cat,Feats,Flist,_) :-
    write('!!! Warning - invalid feature spec in this rule '),nl,
    write('!!! Offending category'=Cat:Feats),nl,
    write('!!! Valid features'=Flist),nl.

% Issues the above warning otherwise.



/*******************************************************************
Predicate: ALL_FEATS_LEGAL(+ListOfFeatValEqns,+ListOfFnames)
-----------------------------------------------------------
Args:+ListOfFeatValEqns  % those present in the category
     +ListOfFnames)      % those elsewhere declared to be valid
                         % for that category.
Succeeds: Once, if the feature is valid for that category
Comments: Doesn't check that the feature has a legal value.
          Left as an exercise for the reader...
*******************************************************************/

all_feats_legal([],_).

all_feats_legal([F=_|T],Flist) :-
 member(F,Flist),
 all_feats_legal(T,Flist).




/*******************************************************************
Predicate: COMPILE_FLIST(+FeaturesActuallyPresent,
------------------------ +FeaturesFromDeclaration,
                         -TermRepresentingResult).

Args: FeaturesActuallyPresent, % list of f=v
      FeaturesFromDeclaration, % list of atoms
      TermRepresentingResult.  % a term representing the whole category
Succeeds: once
Comments: Puts each feature value, compiled, in the appropriate
          argument of the term 
*******************************************************************/


compile_flist([],_,_).

compile_flist([Feat=Value|Rest],Flist,Compiled) :-
  position(Feat,Flist,N),
  compile_value(Feat,Value,Val),
  arg(N,Compiled,Val),
  !,
  compile_flist(Rest,Flist,Compiled).




/*******************************************************************
Predicate: COMPILE_VALUE(+FeatName,+FeatureValue,-CompiledVersion).
-----------------------------------------------------------------
Args: FeatName        % an atom
      FeatureValue    % a term of the appropriate type
      CompiledVersion % a term
Succeeds: Once. It always succeeds.
Comments: checks to see whether the feature is the subject
          of a declaration, and if so, uses the appropriate
          compilation method
*******************************************************************/

compile_value(Feat,_Val,*) :-
   ignore_feature(Feat),
   !.

% if we've been told to ignore this feature, just give it a *

compile_value(_,X,X) :- 
   var(X),
   !.

% if it's a variable, leave it alone

compile_value(_,Cat:Feats,Compiled) :-
   compile_cat(Cat:Feats,Compiled), 
   !.

% if it's a category, compile that.


compile_value(Feat,ListOfEqns,Compiled) :-
 flist_feature(Feat,DeclaredFeats),
 compile_feats(Feat,ListOfEqns,DeclaredFeats,Compiled),
 !.

% if it's an flist feature, fake up a category

compile_value(Feat,[H|T],Compiled) :-
   map_compile_value(Feat,[H|T],Compiled),
   !.

%  if it's a list of values, do them all

compile_value(Feat,Val,Compiled) :-
  boolean_feature(Feat,_),
  compile_bv(Feat,Val,Compiled),
  !.

% call the special compilation for boolean combinations of values

compile_value(Feat,Val,Compiled) :-
  lattice_feature(Feat,_),
  bv(Feat,Val,Vector),
  Compiled=..[l|Vector],
  !.

% look up the results of the compile-time call to the special
% compilation for type lattices


compile_value(Feat,Val,Compiled) :-
  hol_feature(Feat),
  (var(Val) 
      -> Compiled=Val:_Type
      ;
      qlf2lnf(Val,Compiled)),
  !.

% if using higher order logic package
% and the feature has HOL term as value, then
% turn to lambda normal form

compile_value(_,X,X). 

% all other cases



/*******************************************************************
Predicate: MAP_COMPILE_VALUE(+FeatName,+ListIn,-ListOut)
--------------------------------------------------------
Args:  FeatName   % an atom
       ListIn     % list of values
       ListOut    % list of terms representing compilation
Succeeds: Once
Comments:  map `compile-value' over a list of values.
           Give me a good higher order programming
           language any day...
*******************************************************************/


map_compile_value(_,A,A):- 
    var(A),
    !.

% for variable tails of lists

map_compile_value(_,[],[]) :-
    !.

map_compile_value(F,[H|T],[H1|T1]) :-
    compile_value(F,H,H1),
    !,
    map_compile_value(F,T,T1).



/*******************************************************************
Predicate: POSITION(+Feature,+FeatureList,-Number).
--------------------------------------------------
Args: Feature,       % atom
      FeatureList,   % list of atoms from category declaration,
                     % containing feature
      Number.        % position of feature in list
Succeeds: Once
Comment: Find the position of the current feature in the list
         from the declaration.
*******************************************************************/



position(Feat,[Feat|_],1):-
  !.

position(Feat,[_|T],P):-
 position(Feat,T,N),
 P is N+1.


/*******************************************************************
Predicate: COMPILE_BV(+FeatName,+Value,-Result)
----------------------------------------------
Args: FeatName, an atom figuring in a boolean_feature declaration
      Value, a boolean combination of atoms
      Result, a term of the form f(0,....,1)
Succeeds: once
Comments: assumes `boolean_feature_models' has already been
          asserted. Issues warning if Value unsatisfiable,
          but does not fail.
*******************************************************************/

compile_bv(_Feat,Val,Val) :-
  Val=..[f|_],
  !.

% feature has already occurred in category and
% is thus already instantiated. This occurrence
% is for corefernce.

compile_bv(Feat,Val,Result) :-
 boolean_feature_models(Feat,Models),
 make_vector_for(Val,Models,Vector),
 (add01(Vector); 
  (write('!!! Unsatisfiable: '-Val),nl)),
 Result=..[f|Vector].

% find the models, make a vector, add 0 and 1 as the
% first and last args



/*******************************************************************
Predicate: COMPILE_BOOLEAN_DECLARATIONS
---------------------------------------
Args: none
Succeeds: always succeeds
Comment: takes declaration and precomputes possible models
*******************************************************************/


compile_boolean_declarations :-
 boolean_feature(Feat,ValueSpace),
 make_models_for(ValueSpace,Models),
 assert(boolean_feature_models(Feat,Models)),
 fail.

compile_boolean_declarations.


/*******************************************************************
Predicate: MAKE_MODELS_FOR(+ValueSpace,-Models)
Args: ValueSpace % a list of lists of atoms, from declaration
                 % interpreted as [List1 X .... X ListN]
      Models     % a list of lists of atoms, representing
                 % the product set
Succeeds: once
Comments: recursively computes the product of a sequence of sets
- the models are each possible combination of  values in the declared
space.
*******************************************************************/

make_models_for([Only],Models) :-
 setof([Val], member(Val,Only), Models).

make_models_for([H|T],Models) :-
 setof([X|Y],
       (make_models_for(T,M),
        member(Y,M),
        member(X,H)),
       Models).



/*******************************************************************
Predicate: MAKE_VECTOR_FOR(+Value,+Models,-Vector)
Args: Value         % a boolean combination of atoms
      Models        % the models computed by `make_models_for'
      Vector        % list of variables
Succeeds: once
Comments: just calls auxiliary function, adding an extra
          variable to the list
% make a vector of args of length M+1, where M is
% the number of models. Each position between args
% represents 1 model, and the args will be
% unified if that model is not possible for this value.

*******************************************************************/


make_vector_for(Val,Models,[Var|Vector]) :-
  mvf_aux(Val,Models,Var,Vector).



/*******************************************************************
Predicate: MVF_AUX(+Value,+Models,+LastVar,-ListOfVars)
Args: Value      % boolean combination of atoms
      Models     % list of lists of atoms
      LastVar    % results of last time
      ListOfVars % adjacent vars are unified if value does
                 % not hold of model
Succeeds: once
Comments: goes down the list of models. If the Value holds,
go on to the next with a new variable. If not, then link the
var with the one from the last round
*******************************************************************/

mvf_aux(_,[],_,[]).

mvf_aux(Val,[H|T],_Var,[NewVar|R]):-
 holds(Val,H), !, 
 mvf_aux(Val,T,NewVar,R).

mvf_aux(Val,[_|T],Var,[Var|R]) :-
 mvf_aux(Val,T,Var,R).



/*******************************************************************
Predicate: HOLDS(+Value,+Model)
Args: Value, a boolean combination of atoms
      Model, a list of atoms
Succeeds: once
Comments: evaluates boolean expression against a model
*******************************************************************/


holds(X,P) :-
    (atom(X);number(X)),member(X,P).

holds(and(X,Y),P) :-
 
 holds(X,P),holds(Y,P).

holds(or(X,Y),P) :-
  holds(X,P);holds(Y,P).
  
holds(not(X),P) :-
 \+(holds(X,P)).



/*******************************************************************
Predicate: add01(+Vector)
Args: Vector, a list of variables
Succeeds: once
Comments: unifies first member of list with 0 and
          last member with 1,  so that if the expression is 
          satisfied by no model, now or later,  unification fails
*******************************************************************/

add01(Vector) :- 
 Vector=[0|_],
 reverse(Vector,[1|_]).





% Encoding type hierarchies as bit vectors
%-----------------------------------------

/*******************************************************************
Predicate: COMPILE_LATTICE_DECLARATIONS
Args: none
Succeeds: always
Comments: repeatedly gets a declaration, decomposes
 it into the necessary assertions, and compiles the
 partial order representation.
*******************************************************************/



compile_lattice_declarations :-
 lattice_feature(Feat,Types),
 assert_type_structure(Feat,Types,[]),
 compile_lattice_feature(Feat),
 fail.

compile_lattice_declarations.


/*******************************************************************
Predicate: ASSERT_TYPE_STRUCTURE(+Feat,+TypeDescription,Types) 
--------------------------------------------------------------
Args: Feat, a feature name
      TypeDescription, a list of items of the form
        Mother:[Daughter1, ..., DaughterN]
      representing the immediate domination relations
      in a lattice of types
      Types, the complete list of types
Succeeds: once
Comments: takes the abbreviated declared form and asserts the
info in a form handy for the compiler
*******************************************************************/



assert_type_structure(Feat,[],Types) :-
   delete_duplicates(Types,T),
   assert(types(Feat,T)).

assert_type_structure(Feat,[Mthr:Daughters|Rest],TypesSoFar) :-
  assert(id(Feat,Mthr,Daughters)),
  append([Mthr|Daughters], TypesSoFar, Types),
  assert_type_structure(Feat,Rest,Types).


/*******************************************************************
Predicate: SUBTYPE(+FeatName,?SubType,?Type)
--------------------------------------------
Args: FeatName, name of a lattice valued feature
      Subtype, an atom
      Type, an atom
Succeeds: can succeed more than once, depending
on which args are instantiated
Comments:  the relation `subtype' is inferred from the `id'
relation.
*******************************************************************/


subtype(Feat,Sub,Type) :-
 id(Feat,Type,Subtypes),
 member(Sub,Subtypes).

% basic case

subtype(Feat,Sub,Type) :-
 id(Feat,Type,Subtypes),
 member(Intermediate,Subtypes),
 subtype(Feat,Sub,Intermediate).

% transitive

subtype(Feat,Sub,Sub) :- 
  types(Feat,Types),
  member(Sub,Types).

% reflexive

%subtype(_,btm,_).   % not used if btm not explicit


/*******************************************************************
Predicate: COMPILE_LATTICE_FEATURE(+Feat) 
-----------------------------------------
Args: Feat, a name
Succeeds: at most once
Comments: makes a vector representing the partial order
then one as a boolean-type vector
*******************************************************************/

compile_lattice_feature(Feat) :-
 types(Feat,T),
 make_codes(Feat,T), 
 make_bv_codes(Feat).



/*******************************************************************
Predicate: MAKE_CODES(+Feat,+Types)
----------------------------------
Args: Feat, a name
      Types, a list of atoms
Succeeds: once
Comments: makes a bit vector for each type.
Algorithm:
 for each type (row)
   for each type (column)
   find the appropriate bit as defined by `codes'
 assert it as bits/3.  
*******************************************************************/


make_codes(_,[]).

make_codes(Feat,[Next|Rest]) :-
 types(Feat,T),                        % get a new copy for the column
 codes(Feat,Next,T,Bits),              % make the vector
 assert(bits(Feat,Next,Bits)),         % assert it
 !,
 make_codes(Feat,Rest).                % and recurse


/*******************************************************************
Predicate: CODES(+Feat,+Type,+AllTheTypes,-BitVector)
-----------------------------------------------------
Args: Feat, an atom;
      Type, an atom;
      AllTheTypes,  a list of atoms
      BitVector, a list of 0 and 1s
Succeeds: once
Comments: calculate bit vector. go down the list of types
 and put 1 where Type is a supertype of the next member of AllTheTypes,
 0 otherwise.
*******************************************************************/


codes(_,_,[],[]).

codes(Feat,X,[Y|R],[Z|R1]):-
  code_for(Feat,X,Y,Z),
  !,
  codes(Feat,X,R,R1).


/*******************************************************************
Predicate: CODE_FOR(+Feat,+Val,+Types,-Bit)
-------------------------------------------
Args: Feat, a name
      Val, an atom
      Types, a list of atoms
      Bit, 0 or 1
Succeeds: once
Comments: 1 if Val is supertype of first member of Types, else 0
*******************************************************************/

code_for(Feat,X,Y,1) :- subtype(Feat,Y,X),!.
code_for(_,_,_,0).



/*******************************************************************
Predicate: MAKE_BV_CODES(+Feat)
-------------------------------
Args: Feat, a feature name
Succeeds: always
Comments: repeatedly looks up bitstrings,
turns then into a boolean vector, and asserts.
We keep both the bitstring and the vector around for
printing purposes.
*******************************************************************/



make_bv_codes(Feat) :-
 bits(Feat,Type,Bitstring1),
 make_boolean_vector(Bitstring1,0,P),
 Glb_vector=[0|P],
 assert(bv(Feat,Type,Glb_vector)), 
 fail.

make_bv_codes(_).



/*******************************************************************
Predicate: MAKE_BOOLEAN_VECTOR(+ListOfBits,+LastArgOfVector,-RemainingArgsOfVector)
Args: ListOfBits, 
      LastArgOfVector, a variable representing the last call
      RemainingArgsOfVector
Succeeds: once
Comments: turn bitstring into boolean vector. 
*******************************************************************/

make_boolean_vector([0],1,[1]).

% if last bit is 0 then link last two arguments, i.e.  
% make them both 1 (we are assuming 0 is first arg and 
% 1 is last)

make_boolean_vector([1],_,[1]).

% if last bit is 1 then don't link last two args, 
% but last arg is still 1

make_boolean_vector([0|R],X,[X|R1]):- 
  make_boolean_vector(R,X,R1).

% if current bit is 0 then link this arg to next and recurse

make_boolean_vector([1|R],_,[Y|R1]):- 
   make_boolean_vector(R,Y,R1).

% if current bit is 1 then don't link this arg to next; recurse


/*******************************************************************
Predicate: delete_duplicates(+ListIn,-Listout)
Args: ListIn, a list
      ListOut, the same list with duplicates removed
Succeeds: once
Comment: a utility
*******************************************************************/


delete_duplicates([],[]).

delete_duplicates([H|T],T1) :-
 member(H,T),
 !,
 delete_duplicates(T,T1).

delete_duplicates([H|T],[H|T1]) :-
 delete_duplicates(T,T1).



/*******************************************************************
% these functions are for debugging and printing.


% turn boolean vectors back into bitstrings. Note that these
% should have had their variables turned to new constants by `numbervars':

decode_bv([_],[]).

% we're at the end, whatever the last position was

decode_bv([X,X|R],[0|R1]):- decode_bv([X|R],R1).

% if last two args were identical then 0

decode_bv([_|R],[1|R1]):-
  decode_bv(R,R1).

% otherwise 1


uni(Type1,Type2,GLB) :-
 bv(X,Type1,BV),
 bv(X,Type2,BV),
 numbervars(BV,1,_),
 decode_bv(BV,Bits),
 bits(X,GLB,Bits),
 !.




% print a simply formatted  array


print_array(Feat) :-
 types(Feat,X),
 write('['),
 write_init(X),nl,
 write_bits(Feat,X),
 nl.

% write initial letter of type for top row info:

write_init([H]):-
 name(H,[I|_]),
 name(N,[I]),
 write(N),
 write(']').

write_init([H|Y]):-
 name(H,[I|_]),
 name(N,[I]),
 write(N),write(','),
 write_init(Y).


% write out the row of bits for that type:

write_bits(_,[]).
write_bits(Feat,[H|T]):-
 bits(Feat,H,B),
 write(B),write(H),nl,
 write_bits(Feat,T).


*******************************************************************/
/*---------------------------------------------------------------------
Compiling patterns.
---------------------
See pattern_spec.txt for syntax of patterns. Where
patterns contain categories of the type used in the real grammar,
i.e. Cat:ListOfFeat=Value
these need to be compiled into terms

Version 1 Sept 2003
Cosmetic changes, June 2003, SGP
----------------------------------------------------------------------*/


:- dynamic cmp_pattern/3.

remove_old_patterns :-
	retractall(cmp_pattern(_,_,_)),
	!.

compile_patterns:-
	remove_old_patterns,
	(Id :: LHS ==> RHS), %; ((Id :: LHS ==> RHS):-Goal)),
	compile_pattern((Id :: LHS ==> RHS)),
	write('Compiled pattern':Id),nl,
	fail.

compile_patterns.

% in case people put c(X) on LHS (which would be more uniform, in fact):

compile_pattern((Id :: c(LHS) ==> RHS)) :-
	pcompile_cat(LHS,LHSCompiled),
	compile_rhs(RHS,RHSCompiled),
	assert(cmp_pattern(Id,LHSCompiled,RHSCompiled)),
	!.

compile_pattern((Id :: LHS ==> RHS)) :-
	pcompile_cat(LHS,LHSCompiled),
	compile_rhs(RHS,RHSCompiled),
	assert(cmp_pattern(Id,LHSCompiled,RHSCompiled)).

% pcompile(+Category,-CompiledIfNeeded)
%--------------------------------------
% Category is any X in c(X).
% check to see what we have. If it's a genuine declared category
% (since tags can also be categories) make sure it's
% in right format for compile_cat. Otherwise leave it unchanged.

pcompile_cat(Cat,Cat) :-
	var(Cat).

pcompile_cat(Cat,Compiled) :-
	atomic(Cat),
	(category(Cat,_) ->
	    compile_cat(Cat:[],Compiled)
	    ;
	    Compiled=Cat).

pcompile_cat(Cat:Feats,Compiled) :-
	compile_cat(Cat:Feats,Compiled).

% compile_rhs(+ListOfElements,-ListWithCatsCompiled).
%----------------------------------------------------

compile_rhs([],[]).

compile_rhs([Nxt|Rst],[NxtCompiled|RstCompiled]):-
	compile_element(Nxt,NxtCompiled),
	!,
	compile_rhs(Rst,RstCompiled).

% compile_element(+PatternElement,-CompiledIfAppropriate)
% -------------------------------------------------------

% just runs through the different types of element  

compile_element(c(Cat),c(Compiled)):-
	pcompile_cat(Cat,Compiled),
	!.

compile_element(c(Cat):Cond,c(Compiled):Cond):-
	pcompile_cat(Cat,Compiled),
	!.

compile_element(?(c(Cat)),?(c(Compiled))):-
	pcompile_cat(Cat,Compiled),
	!.

compile_element(?(c(Cat):Cond),?(c(Compiled):Cond)):-
	pcompile_cat(Cat,Compiled),
	!.


compile_element((A;B),(CompiledA;CompiledB)):-
	compile_element(A,CompiledA),
	compile_element(B,CompiledB),
	!.

% disjunction associates left, so this will recurse down a complex disjunction

compile_element(X,X).

% leave everything else (words, word/tag, etc) unchanged.


% end of file
