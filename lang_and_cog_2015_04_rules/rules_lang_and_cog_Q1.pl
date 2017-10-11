/*
Paper: Language and Cognition
Paper set for: April 2015
Question number: 1
Question: "What is the Wada test used for?"
Model answer: "To assess language laterality in patients undergoing brain surgery". 2 marks.
*/


%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).




/*
 % FOR TESTING ONLY
 question(1,0,0): rule(5,1,1):: complete ==> 
%[(c(vg:[pol=pos,stem=G]):member(G,[consume]);w(B):member(B,[eat])),
[c(vg:[pol=pos,stem=G]):member(G,[consume]),
 c(np:[stem=R]):member(R,[book,banana])].

mark(question(1,0,0), "To assess lateralisation of function in the brain").
mark_all_answers(_,_,_).
 
 */


% RULES FOR LANG & COG Q1

% DEFINE THE FIRST EQUIVALENCE CLASS
% Equivalence classes are answer types that are equivalent such that if the student 
% gives more than one of them in the answer, only one of them will count towards the final mark for that question.


% EQUIVALENCE CLASS 1 
% This class is worth the whole mark = two whole points.
% The idea of independence of brain hemispheres.
% Plus
% The idea of language ability being the point of the test.


/*
RULE 1_1: 
"Assess lateralisation of language"
"To investigate hemispheric lateralisation of language"
"look for laterality of language."
"To determine the lateralisation of linguistic processing"
"To test for the hemispheric lateralisation of language"
"Determine the lateralisation of language processing"

System cannot analyse:
Ans. 42: "Assessing lateralization (of especially language) by temporarily inactivating one hemisphere."
owing to 'assessing' and the brackets. Revised to:
Ans. 1042: "Assess lateralization of especially language by temporarily inactivating one hemisphere."

System does not recognise 'test' as a verb so it fails for the below.
Ans. 3: "Test for laterality of language... "
Ans. 19: "Test lateralisation of language..."

I have found a note saying "if first element on the RHS of the rule is a disjunction i.e. of
the form ( ...; ...) then it doesn't work", so that makes it difficult/impossible to use a disjunction like this
at the beginning of each rule:
 %(c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]);
 % c(np:[stem=K]):member(K,[ascertainment,assessment,checking,determining,determination,investigation,measuring,measurement,testing,test])),
Whether it would work anyway I don't know, because the disjuncts have different phrase types.

mark(question(1,0,0), "Assess lateralisation of language").
*/
 
 
question(1,0,0): rule(1,1,1):: complete ==> 
[ 
 c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(C):member(C,[for,at,of])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 c(np:[stem=D]):member(D,[lateralisation,lateralization,laterality,liberality]), 
 _/'IN', % of/for/in
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])),
 ?(_/'IN'), % of/for/in
 c(np:[stem=E,mods=I]):(member(E,[ability,capability,contribution,function,processing,role]), 
		member(J,I),member(J,[linguistic,language]));c(np:[stem=language])].

/*
RULE 1_2
"The Wada test is used to assess lateralisation of brain function eg language"

System can't do:
Ans. 34: "The Wada test is used to assess lateralisation of brain function e.g. language"
owing to the "e.g" so replaced with
Ans. 1034: "The Wada test is used to assess lateralisation of brain function eg language"

mark(question(1,0,0), "The Wada test is used to assess lateralisation of brain function e.g. language").
*/
question(1,0,0): rule(1,2,1):: complete ==> 
[ 
 c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(C):member(C,[for,at,of])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 c(np:[stem=D]):member(D,[lateralisation,lateralization,laterality,liberality]), 
 _/'IN', % of/for/in
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])),
 ?(_/'IN'), % of/for/in
 % Note that 'brain' in 'brain function' is not an adj. System not happy with 'brain' being a modifier of the noun 'function'.
 %c(np:[stem=B,mods=I]):(member(B,[ability,capability,contribution,function,processing,role]),
 %		member(J,I),member(J,[brain])),
 w(brain),w(function),
 ?(w(_EG1)), ?(w(_EG2)), 
 w(E):member(E,[language,linguistic])].

 
 /*
 RULE 1_3:
"To check hemispheric localisation of language"
"To test for hemisphere specialisation for language"
"Determining hemispheric dominance for language"
"To assess hemisphere dominance for language"
"to assess hemispheric specialisation "

System does not award any points for:
Ans. 45 "To asses hemisphere dominance for language, particularly whether it varies as a function of being left or right handed"
owing to the spelling error 'asses'. 
*/

question(1,0,0): rule(1,3,1):: complete ==> 
[ 
 c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(C):member(C,[for,at,of])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 %w(F):member(F,[hemisphere,hemispheric])), 
 c(np:[stem=D,mods=F]):(member(D,[dominance,specialisation,specialization,localisation,localization,liberality,isolation]), 
		member(L,F),member(L,[hemisphere,hemispheric])),
 _/'IN', % of/for/in
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])),
 ?(_/'IN'), % of/for/in
(c(np:[stem=E,mods=I]):(member(E,[ability,capability,contribution,function,processing,role]), 
		member(J,I),member(J,[linguistic,language]));c(np:[stem=language]))].


 /*
 RULE 1_4:
 "to test which hemisphere is more specialised for language"
 
 mark(question(1,0,0), "to test which hemisphere is more specialised for language").

 */
 
 question(1,0,0): rule(1,4,1):: complete ==> 
[
 c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(C):member(C,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 c(np:[stem=M]):member(M,[hemisphere]),
 % Note this is not a passive because 'specialise' is intransitive
 ?(w(is)), ?(w(more)),  w(D):member(D,[dominant,specialised,specialized,localised,localized,lateralised,lateralized,responsible]),
 _/'IN', % of/for/in
 w(E):member(E,[language,linguistic])].


/* Simpler version of the above rule sent to Steve for testing with.
question(1,0,0): rule(1,1,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(C):member(C,[for,at])), 
 w(D):member(D,[dominance,specialisation,localisation,lateralisation,laterality]), 
 w(B):member(B,[of,for,in]),
 w(E):member(E,[language,linguistic])].
*/ 
 
 
/*
RULE 1_5: 
Ans. 8: "to assess language lateralisation"
Ans. 33: "Sodium amitol used to test language laterality - injected into irregular and paralyses one hemisphere at a time - can see impact on language or which side has dominance"
mark(question(1,0,0), "Sodium amitol used to test language laterality - injected into irregular and paralyses one hemisphere at a time - can see impact on language or which side has dominance").
*/

question(1,0,0): rule(1,5,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(C):member(C,[the,a])), 
 ?(w(especially)),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])), 
 ?(_/'IN'), % of/for/in 
 c(np:[stem=D,mods=I]):(member(D,[dominance,specialisation,localisation,lateralisation,lateralization,laterality,liberality,isolation]), 
		member(J,I),member(J,[linguistic,language]))].

 
/*
RULE 1_6:  
Ans. 20: "To assess language abilities in the right hemisphere and left hemisphere"
Ans. 21: "To assess the linguistic capabilities of each brain hemisphere"
Ans. 46: "To test the spated language ability in the impaired hemisphere"

System can't do:
Ans. 44: "...and testing language abilities of each hemisphere independently"
owing to the 'testing'. I can't get any present participle to work in this position. Have substituted infinitive:
Ans. 1044: "...and to assess language abilities of each hemisphere independently"

mark(question(1,0,0),  "To assess language abilities in the right hemisphere and left hemisphere").
mark(question(1,0,0),  "To assess the linguistic capabilities of each brain hemisphere").
mark(question(1,0,0),  "To test the spated language ability in the impaired hemisphere").

*/

question(1,0,0): rule(1,6,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])), 
 ?(_/'IN'), % of/for/in 
 c(np:[stem=B,mods=I]):(member(B,[ability,capability,contribution,function,processing,role]), member(J,I),member(J,[linguistic,language])), 
 w(C):member(C,[of,in,that]),
 ?(w(only)), c(np:[stem=A]):member(A,[hemisphere,side,function])].

/* 
RULE 1_7: 
"For the assessment of the role of each hemisphere in a particular function eg language"

The system cannot do Ans. 14 with "(e.g. language)"
Ans 14. "For the assessment of the role of each hemisphere in particular in a particular function (e.g. language) by anaesthetising the other."
It doesn't like "e.g." and it doesn't like the parentheses.
So I have replaced it with:
Ans 1014. "For the assessment of the role of each hemisphere in particular in a particular function eg language by anaesthetising the other."

mark(question(1,0,0), "For the assessment of the role of each hemisphere in particular in a particular function eg language by anaesthetising the other.").
*/

question(1,0,0): rule(1,7,1):: complete ==> 
[c(np:[stem=G]):member(G,[ascertainment,assessment,checking,determining,determination,investigation,measuring,measurement,testing,test]),
 _/'IN', % of/for
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 c(np:[stem=B]):member(B,[ability,capability,contribution,function,processing,role]),
 w(C):member(C,[of,in,that]),
 ?(w(H):member(H,[the,only])), ?(w(D):member(D,[each,right,left,one,the,a,which])),
 ?(w(E):member(E,[and,or])),
 c(np:[stem=K]):member(K,[hemisphere,side,function]),
 ?(w(in)),?(w(particular)), % in particular
 _/'IN', c(np:[stem=J]):member(J,[hemisphere,side,function]), % in a particular function
 ?(w(_EG1)), ?(w(_EG2)), 
 w(L):member(L,[language,linguistic])].

/*
RULE 1_8
Ans. 25: "To assess the contribution of one hemisphere or another on language"
mark(question(1,0,0), "To assess the contribution of one hemisphere or another on language").
*/

question(1,0,0): rule(1,8,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)), 
 c(np:[stem=B]):member(B,[ability,capability,contribution,function,processing,role]),
 w(C):member(C,[of,in,that]),
 ?(w(H):member(H,[the,only])), ?(w(D):member(D,[each,right,left,one,the,a,which])),
 ?(w(E):member(E,[and,or])),
 c(np:[stem=K]):member(K,[hemisphere,side,function]),
 ?(w(or)),?(w(another)), % in particular
 _/'IN', % on 
 w(L):member(L,[language,linguistic])].

 
 /*
 RULE 1_9: 
 "to assess how each side of the brain contributed to language"
 
 Ans. 47: "It is used for measuring/determining how each side of the brain contributed to language"
 mark(question(1,0,0), "It is used for measuring/determining how each side of the brain contributed to language").
 */
 question(1,0,0): rule(1,9,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),
 w(F):member(F,[that,how]),
 ?(w(A):member(A,[the,only])), ?(w(D):member(D,[each,right,left,one,the,a,which,brain])), % "each brain hemisphere"
 c(np:[stem=K]):member(K,[hemisphere,side,function]),  % "each side of the brain"
 ?(_/'IN'), % of/in
 ?(c(np:[stem=L]):member(L,[brain])),
 c(vg:[pol=pos,stem=B]):member(B,[contribute]),
 w(to),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])),
 ?(_/'IN'), % of/for/in
(c(np:[stem=E,mods=I]):(member(E,[ability,capability,contribution,function,processing,role]), 
		member(J,I),member(J,[linguistic,language]));c(np:[stem=language]))].

 

/* 
RULE 1_10: 
"To assess ability of the right hemisphere in language processing"
"To assess the role of each hemisphere in the processing of language"
Ans 39: "Studying the role of each hemisphere in the use of language"
Ans 50: "To determine the role of the separate hemispheres in the processing of language"
mark(question(1,0,0), "To determine the role of the separate hemispheres in the processing of language").

*/

question(1,0,0): rule(1,10,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 c(np:[stem=B]):member(B,[ability,capability,contribution,function,processing,role]),
 w(C):member(C,[of,in,that]),
 ?(w(only)), 
 c(np:[stem=A]):member(A,[hemisphere,side,function]),
 ?(_/'IN'), % on/to/in
 ?(w(especially)),
 c(np:[stem=H]):member(H,[processing,use,liberality]),
 ?(_/'IN'), % of/for/in
 w(E):member(E,[language,linguistic])]. 


/*
RULE 1_11:
Ans. 27: "Shows language is lateralized to the left hemisphere"
mark(question(1,0,0), "Demonstrates language is lateralized to the left hemisphere").
*/

question(1,0,0): rule(1,11,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[demonstrate,determine,establish,identify,show]),
 ?(w(F):member(F,[that,whether,if])),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])),
 ?(_/'IN'), % of/for/in 
 (c(np:[stem=B,mods=I]):(member(B,[ability,capability,contribution,function,processing,role]), member(J,I),member(J,[linguistic,language]));c(np:[stem=language])), 
 c(vg:[passive=yes,head=D,pol=pos]):member(D,[lateralised,lateralized])].

 
 /*
RULE 1_12:
"to identify whether language or other functions are localised to one hemisphere."

System can't do:
Ans. 29: to identify whether language (or other functions) a localised to one hemisphere.
I think it's the parentheses. Plus there is a spelling mistake: 'a' instead of 'are'. So revised:
Ans. 1029: "to identify whether language or other functions are localised to one hemisphere."

mark(question(1,0,0), "to identify whether language or other functions are localised to one hemisphere.").
*/

 question(1,0,0): rule(1,12,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[demonstrate,determine,establish,identify,show]),
 ?(w(F):member(F,[that,whether,if])),
 ?(c(np:[stem=H]):member(H,[processing,use,liberality])), 
 ?(_/'IN'), % of/for/in
 (c(np:[stem=B,mods=I]):(member(B,[ability,capability,contribution,function,processing,role]), 
		member(J,I),member(J,[linguistic,language]));c(np:[stem=language])), 
 ?(w(or)), %?(w(other)),
 c(np:[stem=A]):member(A,[ability,capability,contribution,function,role]),
 c(vg:[passive=yes,head=D,pol=pos]):member(D,[localised,situated]),
 ?(w(K):member(K,[to,in])),
 % Will not recognise 'one or other hemisphere' as NP so need to do the 'one or' separately.
 ?(w(only)), 
 ?(w(L):member(L,[each,right,left,one,the,a,which])),
 ?(w(K):member(K,[and,or])),
 c(np:[stem=E]):member(E,[hemisphere,side,function])
 ].
 

/*
% EQUIVALENCE CLASS 2
% This class is worth one point only.
% The idea of independence of brain hemispheres.
*/
   
 /*
 RULE 2_1
 "The Wada test is used to assess lateralisation"
 "It is used to test for lateralisation - you inject sodium amytal, so you can see what one hemisphere does."
 "good for looking at lateralisation of cognitive processes."
 "to assess hemispheric specialisation".
 "It is used to investigate the laterality of brain function."
 
 System can't do:
 Ans. 31: "Testing lateralisation of brain function"
 Ans. 41: "Measuring hemisphere specialisation"
 so changed to:
 Ans. 1031: "Assess lateralisation of brain function"
 Ans. 1041: "Assess hemisphere specialisation"
 Note that this rule matches Ans. 33 with "to test language laterality" and it also matches rule (1,4,1) with the same phrase.

 mark(question(1,0,0), "It is used to test for lateralisation - you inject sodium amytal, so you can see what one hemisphere does.").
 mark(question(1,0,0), "It is used to investigate the laterality of brain function.").
 */
 question(1,0,0): rule(2,1,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(C):member(C,[the,a])), 
 ?(w(especially)),
 c(np:[stem=D]):member(D,[dominance,specialisation,localisation,lateralisation,lateralization,laterality,liberality,isolation])]. %member(J,I),member(J,[hemisphere,hemispheric]))].
 

 
/*
RULE 2_2: 
Ans. 23: "To test one hemisphere in isolation"

mark(question(1,0,0), "To test one hemisphere in isolation").
*/
 
question(1,0,0): rule(2,2,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(C):member(C,[the,a])), 
 ?(w(especially)),
 c(np:[stem=F]):member(F,[hemisphere,side,function]), % one hemisphere
 ?(w(H):member(H,[in])),
 c(np:[stem=D]):member(D,[dominance,specialisation,localisation,lateralisation,lateralization,laterality,liberality,isolation])].

 
/*
RULE 2_3:
"compare the resulting impairments following temporary suppression of the right or left hemisphere"

System cannot do:
Ans. 4: "compare resulting impairments following temporary suppression of the right or left hemisphere."
System is not analysing "resulting impairments" although it will do "the resulting impairments".
I have tried making the DETs explicit, but that hasn't helped.
So I have an edited answer:
Ans. 1004: "compare the resulting impairments following temporary suppression of the right or left hemisphere.
mark(question(1,0,0), "compare the resulting impairments following temporary suppression of the right or left hemisphere.").

*/
 
question(1,0,0): rule(2,3,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,compare,determine,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])),
 c(np:[det=Det,stem=J,mods=I]):(member(Det,[nulldet,the,any]), member(J,[impairment]), member(L,I),member(L,[resulting])),
 _/'IN', % following/after
 c(np:[stem=K]):member(K, [suppression]),
 ?(_/'IN'), % of
 % System cannot analyse "the right or left hemisphere" as an NP so I need to break it up
 ?(w(H):member(H,[the,only])), ?(w(D):member(D,[each,right,left,one,the,a,which])),
 ?(w(E):member(E,[and,or])),
 c(np:[stem=C]):member(C,[hemisphere,side,function])].


/*
RULE 2_4:  
Ans. 6: "to determine the contribution each hemisphere makes."
Ans. 5: "Used to assess individual capabilities of each hemisphere in isolation."
"assess the capabilities of the other hemisphere"
"determine the function of the intact hemisphere"
System cannot do:
	Ans. 16: "Investigating function in only one hemisphere"
owing to 'investigating', so edited to:
	Ans. 1016: "Investigate function in only one hemisphere"
mark(question(1,0,0), "determine the function of the intact hemisphere").
*/

question(1,0,0): rule(2,4,1):: complete ==> 
%[c(np:[head=G]):member(G,[ascertainment,assessment,checking,determining,determination,investigation,investigating,measuring,measurement,testing,test]),
% ?(w(of)),
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),                %?(w(the)),
 c(np:[stem=B]):member(B,[ability,capability,contribution,function,functions,processing,role]), 
 ?(w(C):member(C,[of,in,that])),
 % System cannot analyse 'only one hemisphere' as an NP so 'only' is separate.
 ?(_/'RB'), % only
 c(np:[stem=A]):member(A,[hemisphere,side,function])].
 

/*
RULE 2_5:
"assess what remains in the intact hemisphere"

System cannot do:
Ans. 9: "...test what remains in the intact hemisphere"
as it does not recognise 'test' as a verb here so replaced with:
Ans. 1009: "...assess what remains in the intact hemisphere ..."

mark(question(1,0,0), "assess what remains in the intact hemisphere").
*/

question(1,0,0): rule(2,5,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(what)),
 c(vg:[pol=pos,stem=H]):member(H,[remain, persist]),
 _/'IN', % of/in
 c(np:[stem=A]):member(A,[hemisphere,side,function])].

/*
RULE 2_6:
"to assess which hemisphere is specialised for a function"

System cannot do 
Ans. 13 part: "The Wada test is used in order to assess which hemisphere is specialised for a function i.e in this case which hemisphere is responsible for language."
owing to the "i.e" in the middle, so replaced with:
Ans. 1013 part: "The Wada test is used in order to assess which hemisphere is specialised for a function ie in this case which hemisphere is responsible for language."
There is currently no rule that will give a point for "in this case which hemisphere is responsible for language"
because it's too far away  from 'assess'. I could either do away with the verb of assessing altogether,
or investigate the examples/code more.

mark(question(1,0,0), "The Wada test is used in order to assess which hemisphere is specialised for a function i.e in this case which hemisphere is responsible for language.").
*/
question(1,0,0): rule(2,6,1):: complete ==> 
[c(vg:[pol=pos,stem=G]):member(G,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]),
 ?(w(J):member(J,[for,at])), 
 ?(c(np:[head=effect])),?(w(on)), % "The effect of this on"
 ?(w(especially)),                
 c(np:[stem=A]):member(A,[hemisphere]),
 ?(w(is)), ?(w(more)),  w(D):member(D,[dominant,specialised,specialized,localised,localized,lateralised,lateralized,responsible]),
 _/'IN', % of/for/in
 c(np:[stem=C]):member(C,[function,functions])].


/*
RULE 2_7: 
"so that the abilities of a single hemisphere can be tested"
"so the function of the other hemisphere can be ascertained"
*/

% Modal example: c(vg:[pol=pos,stem=M,modal=C]):(member(M,[keep]), member(C,[cannot,'can\'t']))
% Passive example: c(vg:[passive=yes,head=W,pol=pos]):member(W,[stopped,prevented])

question(1,0,0): rule(2,7,1):: complete ==> 
[c(np:[stem=B]):member(B,[ability,capability,contribution,function,processing,role]), 
 w(D):member(D,[of,in]),
 c(np:[stem=E]):member(E,[hemisphere,side,function]),
 c(vg:[pol=pos,stem=M,passive=yes,modal=C]):(member(M,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]), member(C,[can]))].

/*
RULE 2_8:
"one hemisphere of the brain so that the other can be studied"

Prepared for Ans. 1: "Sodium amytal administered to one hemisphere of the brain so that the other can be studied in isolation".
mark(question(1,0,0), "one hemisphere of the brain so that the other can be studied").
*/

question(1,0,0): rule(2,8,1):: complete ==> 
 [
 c(np:[stem=D]):member(D,[hemisphere,side,function]),
 ?(w(B):member(B,[of,in])),
 ?(c(np:[head=L]):member(L,[brain])),
 w(so),w(that),
%(c(np:[stem=E,mods=I]):(member(E,[hemisphere,hemispheres,side,function,functions]), 
%		member(J,I),member(J,[right,left,other,intact,separate,particular,single])); w(the), w(other) ),
 w(the), w(other),% This is poor, I would like to find a better way of doing this but the above doesn't work, I think because the second part of the disjunction is not an 'np'.
 %?(w(F):member(F,[right,left,other,intact,separate,particular,single])),
 %?(w(J):member(J,[hemisphere,hemispheres,side,function,functions])),
 c(vg:[pol=pos,stem=M,passive=yes,modal=C]):(member(M,[ascertain,assess,check,determine,establish,identify,investigate,look,measure,show,study,test]), member(C,[can]))].


% STATE VALUE OF FULL MARK FOR THIS QUESTION

full_mark(question(1,0,0),2).

/*
STATE ANY 'OR' RULES 
'Or' rules are used to define combinations of equivalence classes where combinations are required in order to score a full mark.
Equivalence classes are answer types that are equivalent such that if the student gives more 
than one of them in the answer, only one of them will count towards the final mark for that question.
Here is an example from 'biology_patterns_6(c)_h_01.pl'
      or_rule(question(6,c,0),[[(rule(3,_K,1),_X),(rule(4,_L,1),_Y)],[(rule(5,_D,1),_Z),(rule(6,_M,1),_W)]]).
See file 'dgf_or_rules_notes.txt' for more explanation.
I don't yet know about how to award 1 mark for one correct part only of a 2-mark answer.
*/


/* 
Examples from UCLES 
 
% 1.(to) pump/pumps/pumping/circulate/rotate/push/move (the/this)
% (oxygenated/deoxygenated/de-oxygenated/oxygenated and& deoxygenated)  blood

question(2,a,0): rule(1,1,1):: complete ==>
[c(vg:[pol=pos,stem=V]):member(V,[pump,circulate,rotate,push,move]), 
?(w(_THE)),
?(w(_OXY)),?(_/'CC'),
c(np:[stem=blood])].

% 3.	grasp/dig (into) the rocks

question(4,'a_hooves',0): rule(1,3,1):: complete ==> [c(vg:[pol=pos,stem=G]):member(G,[grasp,dig]),?(_/'IN'),(c(np:[stem=R]):member(R,[rock,mountain]); c(np:[stem=M,mods=L]):(member(M,[surface]),member(Z,[rock,mountain]),member(Z,L)))].
UCLES examples finished

% 2003
% mark(question(2,c,i),  "He introduced the idea of the heart pumping around the blood and the arteries and veins that are involved in the process.").
%8.	(blood flowed) (the ) arteries, capillaries and veins (? 17, 79,81…)  (any other combination - in pairs also) / [(the) veins and/to/& arteries/arterial] /[capillaries and veins and arteries] /[arteries and/&/to veins]

question(2,c,i): rule(2,'9b',1)::complete ==> [c(np:[stem=V]):member(V,[artery,capillary,vein]),?(_/'CC'),c(np:[stem=J]):member(J,[artery,capillary,vein])].

full_mark(question(2,c,i),2).
*/

% For example
% ?(c(np:[head=E]):member(E,[example,instance]))
