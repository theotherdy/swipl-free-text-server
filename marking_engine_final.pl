/*-----------------Matcher----------------------------------------------------

If you want to mark all answers for a particular question - after you've
consulted them in main.pl then when you start Prolog type:

mark_all_answers(_,_,_).

If you want to mark all answers for a particular student (or one answer)
then type:

mark_all_answers(_,_,_,N) where N is the number of candidate

If you want to mark a string by typing it directly to the screen then you
have to specify the question number:

mark(Question,String) where Question is for e.g. question(12,c,i) or
                                                 question(1,a,0)

original by Jana Sukkarieh 2003
-- a refined version of the one written in Feb 2003

Sept 2004 : added simple recording of results. Stephen Pulman

reinstated negative pattern handling, SGP July 2005
--------------------------------------------------------------------------*/

:-multifile answer/4.
:-multifile or_rule/2.
:-multifile full_mark/2.

:- dynamic results/4,current_disagreements/1.

clean_up_old_results :-
	retractall(results(_,_,_,_)),
	%retractall(result(_,_,_)),
	retractall(rules_used(_,_)),
	retractall(spelling_correction(_,_)),
	!.

report_results(Question) :-
 findall(C,M^results(Question,C,M,M),All),length(All,L),  % agree
 findall(C1,M1^N^(results(Question,C1,M1,N),\+M1=N),All1),length(All1,L1), % disagree
 X is L/(L+L1),
 format('~nQuestion ~w: ~w correct, ~w incorrect, ~w~n',[Question,L,L1,X]),
 !.


report_rules_unused(Q):-
	 findall(R,(rules_used(Q,RS),member(R,RS)),All),
	 findall(Id,X^Y^((Q:Id :: X ==> Y), \+member(Id,All)),Unused),
	 member(U,Unused),
	 write(Q:U),nl,
	 fail.

report_rules_unused(_).



% the following reports the candidate numbers where there is a disagreement
% between the system and the examiners:
% JZS
report_disagreement(Question,All1):-
	findall(C1,M1^N^(results(Question,C1,M1,N),\+M1=N),All1),
	assert(current_disagreements(All1)).

report_differences(Q) :-
	retract(current_disagreements(Old)),
	report_disagreement(Q,New),
	write(Old),nl,
	write(New),nl,
	findall(X,(member(X,Old),\+member(X,New)),Fixed),
	findall(Y,(member(Y,New),\+member(Y,Old)),Broken),
	write('Fixed'-Fixed),nl,
	write('Broken'-Broken),nl.

mark_and_report :-
	setof(question(Num,Part,Sub),L^answer(number(Num),part(Part),subpart(Sub),L),Questions),
	member(question(A,B,C),Questions),
	mark_all_answers(A,B,C),
	nl,write('******'),nl,
	report_results(question(A,B,C)),
	write('******'),nl,nl,
	fail.

mark_and_report.


/* main predicate - mark all students' answers for a particular question */

%%-------------------------------------------------------------------%%
%% Name : mark_all_answers/3                                         %%
%% Arguments :                                                       %%
%%   arg1 : ? :  Number of GCSE biology question at hand             %%
%%               atom                                                %%
%%   arg2 : ? : atom - part of the question                          %%
%%   arg3 : ? : atom - subpart of the question                       %%
%%                                                                   %%
%%                                                                   %%
%% Description :                                                     %%
%%   given a GCSE biology question it gives a score                  %%
%%   and justification for each answer provided                      %%
%%                                                                   %%
%% Example:                                                          %%
%% |?- mark_all_answers(4,c,ii).                                     %%
%% Question number 4, part c, subpart ii, candidate 8                %%
%%  EXAMINER'S MARK IS: 1                                            %%
%%  THE SYSTEM'S MARK IS:1                                           %% 
%%  FOR ANSWER                                                       %%
%% they will not have another bucardo to act as a surrogate or host. %%
%% MATCHES:                                                          %% 
%%will not have another bucardo                                      %%
%%
%% ----------                                                        %%
%%Question number 4, part c, subpart ii, candidate 9                 %%
%%                                                                   %%  
%% EXAMINER'S MARK IS: 1                                             %%

%%THE SYSTEM'S MARK IS:1                                             %%
%%FOR ANSWER 
%%They do not have another Bucardo to implant the embryo into so it will be difficult to implant it into another goat without its body rejecting it. %%
%%MATCHES:                                                           %%
%%to implant the embryo                                              %%
%%                                                                   %%
%% ----------                                                        %%   
%%    etc                                                            %%
%%------------------------------------------------------------------ %%


% answers are already marked by examiners
%  answer(number(2),part(a),subpart(0),[1,1,"to pump blood around are entire body"]).

mark_all_answers(Num,P,Sub):-
	clean_up_old_results,
	answer(number(Num),part(P),subpart(Sub),[N,Mark_Given,Answer]),
	format('~n ---------- ~nPrint: Question number ~w, part ~w, subpart ~w, candidate ~w~n',[Num,P,Sub,N]),
	mark_each_answer(N,Answer,Mark_Given,question(Num,P,Sub),_Stream),
	fail.

%mark_all_answers(_,_,_).

%  answers are not already marked by examiners

mark_all_answers(Num,P,Sub):-
	clean_up_old_results,
	answer(number(Num),part(P),subpart(Sub),[N,Answer]),
	format('~n ---------- ~nQuestion number ~w, part ~w, subpart ~w, candidate ~w~n',[Num,P,Sub,N]),
	mark(question(Num,P,Sub),Answer),
	fail.

mark_all_answers(_,_,_).

/* another main predicate if one wants to mark all answers for a particular student :
given a candidate Number find the mark for all his/her answers
*/
%%-------------------------------------------------------------------------%%
%% Name : mark_all_answers/4                                               %%
%% Arguments :                                                             %%
%%   arg1 : ? :  Number of GCSE biology question at hand                   %%
%%               atom                                                      %%
%%   arg2 : ? : atom - part of the question                                %%
%%   arg3 : ? : atom - subpart of the question                             %%
%%   arg4 : ? : atom - candidate number                                    %%
%%                                                                         %%
%%                                                                         %%
%% Description :                                                           %%
%%   given a GCSE biology question and a candidate number                  %%
%%      it gives a score                                                   %%
%%   and justification for the corresponding answer                        %%
%%                                                                         %%
%% Examples:                                                               %%
%% 1.                                                                      %%
%% | ?- mark_all_answers(4,c,ii,101).                                      %%
%%                                                                         %%
%%  EXAMINER'S MARK IS: 1                                                  %%
                                                                           %%
%% THE SYSTEM'S MARK IS:1                                                  %%
%% FOR ANSWER                                                              %%
%% They have to insert it into the womb of a more common species, and then keep it alive when it's born.
%% MATCHES:                                                                %%
%% to insert it                                                            %%
%% 2.                                                                      %%
%% mark_all_answers(4,c,ii,100).                                           %% 
%%                                                                         %%
%% EXAMINER'S MARK IS: 0                                                   %%
%%                                                                         %%
%% SYSTEM' S MARK IS 0 FOR: making another one so that they can reproduce. %%
%% REMARKS:
%% you can't leave all of them uninstantiated 
%%------------------------------------------------------------------------ %%

mark_all_answers :-
	mark_all_answers(_,_,_,_).



mark_all_answers(Num,P,Sub,N):-
	clean_up_old_results,
	answer(number(Num),part(P),subpart(Sub),[N,Mark_Given,Answer]),
	format('~n ---------- ~nPrint: Question number ~w, part ~w, subpart ~w, candidate ~w~n',[Num,P,Sub,N]),
	mark_each_answer(N,Answer,Mark_Given,question(Num,P,Sub),_Stream),
	fail.

% no mark given in advance
mark_all_answers(Num,P,Sub,N):-
	clean_up_old_results,
	answer(number(Num),part(P),subpart(Sub),[N,Answer]),
	format('~n ---------- ~nPrint: Question number ~w, part ~w, subpart ~w, candidate ~w~n',[Num,P,Sub,N]),
	mark(question(Num,P,Sub),Answer),
	fail.

mark_all_answers(_,_,_,_N).








%%-------------------------------------------------------------------------%%
%% Name : mark_each_answer/4                                               %%
%% Arguments :                                                             %%
%%   arg1 : + : candidate number                                           %%
%%   arg2 : + : String-  an answer                                         %%
%%   arg3 : + : Mark given by examiners                                    %%
%%   arg4 : + : question(Number,Part,Subpart)                              %%
%%                                                                         %%
%%                                                                         %%
%% Description :                                                           %%
%% Given a candidate number, a question number and an answer then mark the %%
%% answer, compare the system's Mark to the examiners mark and display     %%
%% the result with a justification on how the student got the mark         %%
%%                                                                         %%
%% Example:                                                                %%
%%
%% |?- mark_each_answer(1,"they have to insert it into the womb",1,question(4,c,ii)).
%          
% EXAMINER'S MARK IS: 1                                                    %% 
%                                                                          %%
%THE SYSTEM'S MARK IS:1                                                    %%
%FOR ANSWER                                                                %%
%they have to insert it into the womb                                      %% 
%MATCHES:                                                                  %%
%to insert it                                                              %%
%%------------------------------------------------------------------------ %%



mark_each_answer(Candidate_Number,String,Mark_Given,question(Num,P,Sub),Stream):-
	mark_string(question(Num,P,Sub),String,System_Mark,Justify,Stream),
	check_ignore_reject_rules(System_Mark,New_Mark,_BigList),
    format('Print: THE EXAMINER\'S MARK IS: ~w ~n', [Mark_Given]),
    !,
    justify(String,New_Mark,Justify,Stream,_MatchedStrings),
    assert(results(question(Num,P,Sub),Candidate_Number,Mark_Given,New_Mark)).



check_ignore_reject_rules(System_Mark,New_Mark,BigList):-         
	findall(rule(I,J,1),
		edge(_In,_Out,_Id,
		     phrase(_Question:rule(I,J,1)),reject_ignore_deduct,[],_List), BigList),
	length(BigList,N),
	(N > 0 ->
	  format('~n *** negative pattern matches:~n~w~n',[BigList])
	  ; true),
        (System_Mark > 0 ->                % avoid negative marks
	    New_Mark is System_Mark - N
	;
	    New_Mark is System_Mark).



%%-------------------------------------------------------------------------%%
%% Name : mark/2                                                           %%
%% Arguments :                                                             %%
%%   arg1 : + : Question  - question(Num,Part,Subpart)                     %%
%%   arg2 : + : String-  an answer                                         %%
%%                                                                         %%
%%                                                                         %%
%%                                                                         %%
%% Description :                                                           %%
%% mark(Question,String) can be used as a main predicate i.e. if one       %%
%% wants to  test an answer by typing it directly to the screen otherwise  %%
%% it is used by the predicate mark_each_answer after reading the answer   %%
%% from some file, marks the answer and displays a justification           %%
%%                                                                         %% 
%% Example :                                                               %%
%% mark(question(2,b,ii),"As the blood enters the pulmonary vein it        %%
%%       enters the atrium and then the ventricle.  The valves close       %%
%%       once the blood has passed in the ventricle to stop it             %%
%%       flowing backwards").                                              %%
%%THE SYSTEM'S MARK IS:1                                                   %%
%%FOR ANSWER                                                               %%
%%As the blood enters the pulmonary vein it enters the atrium and then the %%
%%ventricle.  The valves close once the blood has passed in the ventricle  %%
%%to stop it flowing backwards                                             %%
%%MATCHES:                                                                 %%
%% The valves close                                                        %%
%%-------------------------------------------------------------------------%%

mark(Question,String):-
	clean_up_old_results,
	mark_string(Question,String,System_Mark,Justify,Stream),
	check_ignore_reject_rules(System_Mark,New_Mark,_BigList),
    justify(String,New_Mark,Justify,Stream,_MatchedStrings).



% Rule: Front End Mark One Answer

fe_mark_one_ans(QuestionNum,AnswerString,System_Mark,MatchedStrings):-
	clean_up_old_results,
	mark_string(QuestionNum,AnswerString,System_Mark,Justify,Stream),
	check_ignore_reject_rules(System_Mark,New_Mark,_BigList),
    justify(AnswerString,New_Mark,Justify,Stream,MatchedStrings).

	
	


:- assert(edge(1,2,3,4,5,6,7)). % dummy edge needed?
:- assert(edgeid(1)).
:- assert(invisible(a,b,c)).

%%-------------------------------------------------------------------------%%
%% Name : mark_string/4                                                    %%
%% Arguments :                                                             %%
%%   arg1 : ? : Question  - question(Num,Part,Subpart)                     %%
%%   arg2 : ? : String-  an answer                                         %%
%%   arg3:  ? : Mark given by examiners                                    %%
%%   arg4:  ? : justification - list of edges                              %% 
%%                                                                         %%
%%                                                                         %% 
%% Description :                                                           %%
%%Given a question and a string (answer)                                   %% 
%% 1. tok and tag the string and find_phrases i.e. np and vg in that       %%
%%    string                                                               %%
%% 2. apply patterns or rules that have been already compiled              %%
%% 3. mark by going through the 'complete' rules                           %% 
%% Mark is an argument holding the system's mark                           %%
%% Justify is an argument holding the number of rules matched and          %%
%% corresponding edges on which the matches, if any, occur.                %%
%% If no rules are matched Justify is unified to [].                       %% 
%%-------------------------------------------------------------------------%%

mark_string(Question,String,Mark,Justify,Stream):-
	retractall(edge(_,_,_,_,_,_,_)),
	phrases(String),
	apply_patterns_chart(Question:_R),
	record_rules_used(Question,Stream), % for debugging
	!,
	mark_answer(Question,Mark,Justify).% ,	write('mark_string:mark_answer'),nl.


record_rules_used(Question,_Stream):-
	setof(Id,F^T^I^Cat^Con^edge(F,T,I,phrase(Question:Id),Cat,[],Con), RulesUsed),
	assert(rules_used(Question,RulesUsed)),
	format('Print: RULES USED: ~w~n',[RulesUsed]),
	!.

% setof will fail if none:
record_rules_used(Question,_Stream) :-
	assert(rules_used(Question,[])).

	

% in predicate mark_answer below:
% add an argument that keeps count/accumulates the mark and initialize it to 0
% add an argument as an accumulator for the justification

mark_answer(Question,Mark,Justify):-
	mark(Question,0, Mark,[],Justify).

%%-------------------------------------------------------------------------%%
%% Name : mark/5                                                           %%
%% Arguments :                                                             %%
%%   arg1 : ? : Question  - question(Num,Part,Subpart)                     %%
%%   arg2 : ? : Count - Integer - was initialized above to 0               %%
%%   arg3:  ? : Mark given by examiners                                    %%
%%   arg4:  ? : Acc_justification - list of edges -                        %%
%%              initialiazed above to []                                   %% 
%%   arg5:  ? : Justification - list of edges                              %%
%%                                                                         %%
%% Description:                                                            %%
%% how to mark?  mark(Question,Count,Mark,Acc_Justify,Justify)             %%
%% if any edge at level 1 (i.e. corresponding to rule(X,Y,1)) is           %% 
%% complete & if rule is of type awarding then give a mark                 %%
%% (add an argument saying if a rule is awarding or not later)             %%
%% Find all complete edges then take the first element of List             %%
%% add 1 to the  mark that was initialized to 0                            %%
%% check the 2nd element of the list against the first                     %%
%%(in case they belong to  the same equivalence class.                     %%
%% if that is the case then the 2nd does not take                          %%
%% a mark). All this while keeping track of the full mark                  %%
%% (i.e. if we reach full-mark then that is it )                           %%
%%-------------------------------------------------------------------------%%

mark(Question,Count,Mark,Acc,Justify):-
findall((rule(I,J,1),List),edge(_In,_Out,_Id,phrase(Question:rule(I,J,1)),complete,[],List), BigList),
	full_mark(Question,Full_Mark),
	to_marking(Question,BigList,Count,Mark,Full_Mark,[],Acc,Justify).


%% -------------------------------------------------------------------------%%
%% Name : to_marking/8                                                      %%
%% Arguments :                                                              %%
%%   arg1 : + : Question                                                    %%
%%   arg2 : + : List: contains 'complete' or matched parts of the answers   %%
%%   arg3:  + : Integer Count  -- initiliazed earlier                       %%
%%   arg4:  + : Integer: Mark                                               %%
%%                                                                          %%
%%   arg5: + : Integer: Full_Mark                                           %%
%%   arg6: +   List : initialization                                        %%
%%   arg7: + : List : Accumulator                                           %%
%%   arg8: ? : List : Justification                                         %%
%%                                                                          %%
%%  Description                                                             %% 
%%                                                                          %%
%% 2 cases occur when marking                                               %%
%% 1. or_rules do not exist                                                 %%
%%2. or_rules exist                                                         %%
%%in both cases first transform the list of matching rules                  %%
%% into a list i.e. get rid of repetition, in case there is any,            %%
%% from the list.                                                           %%
%% If no or_rules for the question at hand exist then                       %%
%% marking is straightforward see predicate marking/7.                      %%
%% If or_rules exist then we need to look for these or_rules in the list of %%
%% matching rules, if there is any, and decide which of them will take the  %%
%% maximum mark see predicate mark_or_rules/8.                              %%
%% -------------------------------------------------------------------------%%


% or_rules do not exist
% we chose to put this clause first because in all the the
% questions we encountered there were 1 or_rule

to_marking(Question,BigList,Count,Mark,Full_Mark,[],Acc,Justify):-
	\+ or_rule(Question, _),
	my_list_to_set(BigList,BigSet),
	marking(BigSet,Count,Mark,Full_Mark,[],Acc,Justify).

% or_rules exist
to_marking(Question,BigList,Count,Mark,Full_Mark,[],Acc,Justify):-
	or_rule(Question,List_Or_Rules),
	my_list_to_set(BigList,BSet),
	mark_or_rules(List_Or_Rules,BSet,Count,Mark,Full_Mark,[],Acc,Justify).


/*-------------------------------------------------------------------
marking/7.  when or_rules do not exist
2 cases:
1. no matches i.e. List of matching rules is empty then do nothing
2. if the list is non-empty then increment the counter with 1 mark for the 1st rule (we are assuming that each rule is worth 1 mark but this can change if
need be later -- however it seems better to divide the full mark into 1s.
Also we are assuming that all rules are awarding at the moment but this may
need to be changed) and continue marking the rest of the rules.
Acc1 accumulates the equivalence class of the matching rule
Acc2 accumulates the Ids of the edges that match the rule
Jus eventually hold all edges for all rules matched
Note: in this version we do not make use of Acc1/equivalence classes or
the number of rules. We may later find though that we need them to output a
clearer justification.
--------------------------------------------------------------------*/

% no matches then mark is 0
marking([],_,0,_,_,J,J):-!.

marking([(rule(I,_J,1),L1)|Rest],Count,Mark,Full_Mark,Acc1,Acc2,Jus):-
	Count1 is Count+1,
	marking_the_rest(Rest,Count1,Mark,Full_Mark,[I|Acc1],[L1|Acc2],Jus).

/*--------------------------------------------------------------------
marking_the_rest/7.
repeat the same for the rest of the rules 
---------------------------------------------------------------------*/

% we 've gone through the whole list
marking_the_rest([],Mark,Mark,_,_,Justify,Justify).

% we reached full mark (all remaining rules are skipped)
marking_the_rest([(rule(_N,_J,1),_L)|_Rest],Mark,Mark,Mark,_Acc,Jus,Jus).

% otherwise
% if the current rule does not belong to the same equivalence class
% as the last rule then a mark is given 
marking_the_rest([(rule(N,_J,1),L)|Rest],Count,Mark,Full_Mark,Acc,Acc2,Jus):-
   Count < Full_Mark,
   different(N,Acc),
   NCount is Count+1,
   marking_the_rest(Rest,NCount,Mark,Full_Mark,[N|Acc], [L|Acc2],Jus).

% we haven't reached full mark yet N is not different
% i.e. the current rule belongs to the same equiv. class hence
% it is skipped and other rules are tried i.e. no marks are given

marking_the_rest([(rule(N,_J,1),_L)|Rest],Count,Mark,Full_Mark,Acc,Acc2,Jus):-
   Count < Full_Mark,
   \+ different(N,Acc),
   marking_the_rest(Rest,Count,Mark,Full_Mark,[N|Acc], Acc2,Jus).

/*--------------------------------------------------------------------
mark_or_rules/8. case where or_rules exist

or_rules are of the form (an e.g.):

or_rule(Question,[[(rule(3,_K,1),_X),(rule(4,_L,1),_Y)],
		  [(rule(5,_L,1),_Z),(rule(6,_M,1),_W)]]).
           <==>  (rule3 AND rule4) OR (rule5 and rule6)
They will be stated in each question's corresponding patterns.
The first argument is obviously the question at hand. The 2nd argument
is a list of lists. Each element i.e. each list that belongs to the 2nd arg.
is the set of rules that should be together for e.g. in the above example
rule 3 and rule 4 should be together.
We cannot give a mark to rule 3 and rule 5, or rule 3 and rule 6
it is either one of them. However, we can give marks to rule 3 and rule 4.
The rest of the arguments in the above declaration are needed and they unify
with anything.


In such a case i.e. when an or_rule exist how does the marking proceed?

1. if no or_rule is complete then mark as previously i.e. use marking/7.
2. if only 1 or_rule is complete
  then mark as previously also
3. if more than one or_rule is complete
  then choose highest mark among all of them - they may all be the same
  and add it to previous marks (as long as total is still less or equal
  than full_mark)

The above 3 can be collapsed into two clauses:

mark as usual i.e. use marking/7 unless
 1 (or more) of each list in the or_list lists coincide with the elements of
 listing of matching rules/patterns, call it bigList.

  For e.g. Assume: 
 or_list={{1,2,3},{4,5},{6,7}}
 
 different cases could occur:
 only 1 belong to bigList then mark as before
 only 4 belong to bigList then mark as before
 not even one element belong to bigList then mark as before
 if 1 (or more) belong to bigList
    and 5 (or more) belong to bigList

IN OTHER TERMS:

IF AT LEAST ANY TWO LISTS in or_list HAVE A NON-EMPTY INTERSECTION
  WITH bigList
THEN
     MARK EACH LIST SEPARATELY
     AND CHOOSE THE MAXIMUM AMONG THEM. 
---------------------------------------------------------------------*/

% at least one element of each list in the list of or_rules, call it,
% List_Or_Rules coincide with
% one element with the list of rules matched/complete, call it BigList.
% Intersect:  is a list of Lists where each element is the intersection
% between each element of List_Or_Rules and BigList.
% Diff : is the difference list between BigList and a flattened Intersect

mark_or_rules(List_Or_Rules,BigList,Count,Mark,Full_Mark,[],Acc,Justify):-
	more_than_1_coincide(List_Or_Rules,BigList,Intersect,Diff),
	!,
	marking_all(Intersect,Diff,Count,Mark,Full_Mark,[],Acc,Justify).

% otherwise
mark_or_rules(_List_Or_Rules,BigList,Count,Mark,Full_Mark,[],Acc,Justify):-
        marking(BigList,Count,Mark,Full_Mark,[],Acc,Justify).

/*---------------------------------------------------------------------
% first mark the difference lists
% then find the max mark from the intersection lists

% the Mark below is the sum of Mark1 and MaxMark only if the intersection and
% difference are disjoint (which is normally the case but here there is a lot
of repetition and the list is not a set). Hence, in the previous step i.e. 
% we should transform BigList into a set i.e. no repetition before going
% any further in more_than_1_coincide(List_Or_Rules,BigList,Intersect,Diff).
% note: this has been done at an earlier stage (in to_marking/8)
----------------------------------------------------------------------*/

marking_all(Inter,Diff,Count,Mark,Full_Mark,[],Acc,Justify):-
	marking(Diff,Count,Mark1,Full_Mark,[],Acc,J1),
        max_marking(Inter,Count,MaxMark,Full_Mark,[],J1,Justify),
	Mark is Mark1+MaxMark.

/*----------------------------------------------------------------
find the mark according to usual marking/7 for each Intersection.
If current mark is larger than previous one then consider this into account
and consider only to accummulate the justification corresponding to this
intersection otherwise keep the mark of the previous intersection registered
and previous accummulator of the justification
Note: later we may have to carry both justifications i.e. current and previous
in case we need to output a full justification --  
------------------------------------------------------------------*/

max_marking([Inter|Sect],Count,Mark,Full_Mark, [],Acc,J):-
	max_marking([Inter|Sect],Count,Mark,Full_Mark,0, [],Acc,J).

max_marking([Int|Sect],Count,Mark,Full_Mark,AccM, [],Acc,Justify):-
	marking(Int,Count,Mark1,Full_Mark,[],Acc,J1),
	(Mark1 > AccM ->
	max_marking(Sect,Count,Mark,Full_Mark,Mark1,[],J1,Justify);
	max_marking(Sect,Count,Mark,Full_Mark,AccM,[],Acc,Justify)).

max_marking([],_Count,Mark,_Full_Mark,Mark,[],J,J).

/*---------------------------------------------------------------------
% the intersection between bigList and each element of List of rules is non
% empty -- these intersections are elements of Intersect 
% Intersect is a list of lists
% Flat_Intersection is a flattened intersection of Intersect - we need it
% in the next step 
% Diff is BigList-(union of all elements of Intersect)
Assumption: lists are ordered since this is assumed in the predicates
for finding the intersection and difference lists -- see below
intersection/3 and difference/3
---------------------------------------------------------------------*/
more_than_1_coincide([List|Or_Rules],BigList,Inter,Diff):-
	insert_sort(BigList,Big),
	find_inter([List|Or_Rules],Big,Inter,Flat_Inter),
	at_least_2_non_empty(Inter),
	insert_sort(Flat_Inter,Sorted), % just to have an ordered list
        difference(Big,Sorted,Diff).

find_inter([List|Or_Rules],BigList,Intersect,Flat):-
	find_inter([List|Or_Rules],BigList,Intersect,Flat,[],[]).

find_inter([List|Or_Rules],BigList,Intersect,Flat,Acc,FAcc):-
        my_intersection(List,BigList,Int),
	%\+ Int = [],
	append(Int,FAcc,NewFAcc),
	find_inter(Or_Rules,BigList,Intersect,Flat,[Int|Acc],NewFAcc).

find_inter([],_BigList,Intersect,Flat,Intersect,Flat).

% at least 2 intersections are non-empty
at_least_2_non_empty([[_X|_L]|P]):-
	one_non_empty(P).

at_least_2_non_empty([[]|P]):-
		    at_least_2_non_empty(P).
		    
one_non_empty([[_X|_L]|_J]):-!.
one_non_empty([[]|J]):-
one_non_empty(J).

/*----------------------------------------------------------------------
No repetition 
e.g. 1st arg: [(rule(4,1,1),[182,49]),(rule(4,1,1),[182,49]),(rule(4,1,1),
	[182,49]),(rule(4,1,1),[182,49]),(rule(5,1,1),[19])]
2nd arg:
[(rule(4,1,1),[182,49]),(rule(5,1,1),[19])]
-----------------------------------------------------------------------*/

my_list_to_set(List,Set):-
        get_set(List,Set1),
	reverse(Set1,Set).

get_set(List,Set):-	
	no_repetition(List,[],[],Set).

no_repetition([],_,Set,Set).
no_repetition([(rule(H,_Y1,_Z1),_L)|T],Acc1,Acc2,Set):-
	member(rule(H,_Y,_Z),Acc1),
	!,
	no_repetition(T,Acc1,Acc2,Set).
	
no_repetition([(rule(H,Y,Z),L)|T],Acc1,Acc2,Set):-
	% \+ member(H,Acc)
	  no_repetition(T,[rule(H,Y,Z)|Acc1],[(rule(H,Y,Z),L)|Acc2],Set).

/*----------------------------------------------------------------------
justify/3 transforms the collected argument Justify into a display of
English words etc 
------------------------------------------------------------------------*/

% if mark is 0

justify(String,0,[],Stream,[]):-  % dgf: there are no matched strings if the mark is 0
	write('Print: THE SYSTEM\'S MARK IS: 0 '),nl,
	write('Print: FOR ANSWER: '), nl, write('Print: '),
	name(Name,String),
	write(Name),nl,
	write_spellings(Stream),
	!.  
  

% if mark >0

justify(String,Mark,List_of_lists,Stream,MatchedStrings):-
%	Mark >0,
	%uniform_list(List_of_lists,List), this is done already but we may
	% need to reverse the list here (in order of appearance in text)
	!,
	write_uniform(String,Mark,List_of_lists,Stream,[],MatchedStrings).


write_uniform(String,Mark,List,Stream,MatchedStringsIn,MatchedStringsOut):-
	write('Print: THE SYSTEM\'S MARK IS: '), write(Mark),nl,
	write('Print: FOR ANSWER: '),nl, write('Print: '),
	name(Name,String),
	write(Name),nl,
	write_spellings(Stream),

	write('Print: MATCHES: '),nl,write('Print:  '), !,
	write_list_of_edges(List,_Stream,MatchedStringsIn,MatchedStringsOut).
	



write_list_of_edges([X|[Y|List]],Stream,MatchedStringsIn,MatchedStringsOut):- % dgf: If there's more than one list of edges, more than one part of the answer has been matched
	reverse(X,Rev),
	write_list(Rev,Stream,MatchedString1), nl,
	write('Print: ALSO MATCHES'),nl,write('Print:  '),!,
	write_list_of_edges([Y|List],Stream,[MatchedString1|MatchedStringsIn],MatchedStringsOut).


write_list_of_edges([X|[]],Stream,MatchedStringsIn,[MatchedString1|MatchedStringsIn]):-
	reverse(X,Rev),
	write_list(Rev,Stream,MatchedString1),nl.


write_list(Edges,Stream,MatchedString) :-
	collect_words_from_edges(Edges,Words),
	write_out_words(Words,Stream),
	my_list_to_string(Words,Stream,[],MatchedString).  % Prepare a version of the matched string for the front end	


collect_words_from_edges([],[]).

collect_words_from_edges([E|R],[Contents|R1] ):-
		edge(_,_,E,_,_,[],Contents),
		atomic(Contents),
		!,
		collect_words_from_edges(R,R1).


collect_words_from_edges([E|R],Results ):-
		edge(_,_,E,_,_,[],Contents),
	%	\+atomic(Contents),
		!,
		sort(Contents,Reversed), % edge ids reflect order
		collect_words_from_edges(Reversed,R1),
		collect_words_from_edges(R,R2),
		append(R1,R2,Results).

write_out_words([],_Stream).

write_out_words([H|T],Stream):-
	write(H),
	write(' '),
	!,
	write_out_words(T,Stream).
		
		
% Prepare the matched string for front end to print out
% ?- my_list_to_string([apple,box],_,[],X).
% apple box 
% X = apple box .		
my_list_to_string_i([],_Stream,Y,Out):-
		string_codes(Out,Y). % Map the codes back into letters
		
my_list_to_string_i([H|T],Stream,In,Out):-
	atom_codes(H,AtomCodes), % Takes one word at a time and maps word to a list atom codes 
	append(AtomCodes,[32],X), % Adds a space char code after the word 
	append(X,In,Y), % Appends new list to the growing list
	my_list_to_string_i(T,Stream,Y,Out). % Carries on down the tail
	
my_list_to_string(ListOfWords,Stream,String,Out):-
	reverse(ListOfWords,X),
	my_list_to_string_i(X,Stream,String,Out).
	%write(Out).
		




different(N,[X|L]):-
	\+N=X,
	different(N,L).

different(_N,[]).

/* dgf: xxxx
% the longest match is maximum the number of words i.e. Longest in
% edge(------tagged_sentence,tagged_sentence,....)
% but we just put 10

go_back_to_find_longest_but_not_complete_match(String):-
	%edge(_I,Longest,_K,tagged_sentence,tagged_sentence,[],_P),
	find_longest_match(10,String).

find_longest_match(0,_):-
	!,
	write('YOUR ANSWER is IRRELEVANT'),nl,!.

find_longest_match(Longest,String):-
	Longest > 0,
findall((Looking_For,Found),
	(edge(_I,_J,_K,_L,complete,Looking_For,Found),
	length(Found,Longest)),B),
        (B = [_|_] -> display_nicely(B),!;
	    NLong is Longest-1,
	    find_longest_match(NLong,String)).


display_nicely(List):-
	find_uniform(List,Rest),
	write('FOUND: '),nl,!,
	display_n(Rest),
	write('IT IS NOT ENOUGH FOR A MARK'),nl.


find_uniform([(_L,X)|K],R):-
	find_uniform(K,[X],R).

find_uniform([(_J,Y)|List],Acc,Result):-
	\+ member(Y,Acc),
	find_uniform(List,[Y|Acc],Result).

find_uniform([(_L,X)|List],Acc,Result):-
	member(X,Acc),
	find_uniform(List,Acc,Result).

find_uniform([],Result,Result).


display_n([Found|Rest]):-
         reverse(Found,Rev),
	write_list(Rev), nl,
	display_n(Rest).

display_n([]).


*/




% or_rules if they exist are defined in the file where the patterns for that
% rule exist

/*-------------------------------------
some basic predicates
--------------------------------------*/
% simple comparison of two integers 
compare_marks(Mark,System_Mark,Difference):-
	Difference is Mark - System_Mark.
 

% intersection and difference between lists
% these would work well if there is no repetition and in our case
% the lists are sets. However,
% in our case for e.g. rule(3,1,1) and rule(3,3,1) are different
% but we want to consider one of them only if one of them belongs to the or_rule set! 
my_intersection([X|TX],[X|TY],[X|TZ]):-
	my_intersection(TX,TY,TZ).
my_intersection([X|TX],[Y|TY],TZ):-
	lt(X,Y),
	my_intersection(TX,[Y|TY],TZ).

my_intersection([X|TX],[Y|TY],TZ):-
	lt(Y,X),
	my_intersection([X|TX],TY,TZ).

my_intersection([],_S,[]).
my_intersection(S,[],[]):- \+ S=[].


difference([X|TX],[X|TY],TZ):-
	difference(TX,TY,TZ).
		  
difference([X|TX],[Y|TY],[X|TZ]):-
	lt(X,Y),
	difference(TX,[Y|TY],TZ).

difference([X|TX],[Y|TY],TZ):-
	lt(Y,X),
	difference([X|TX],TY,TZ).

difference([],_S,[]).
difference(S,[],S):- \+ S=[].

lt((rule(X,_Y,_Z),_B),(rule(X1,_Y1,_Z1),_B1)):-var(X),var(X1).
lt((rule(X,_Y,_Z),_B),(rule(X1,_Y1,_Z1),_B1)):-nonvar(X),nonvar(X1),X<X1.

/*
order_list(List,Result):-
	reverse(List,Result).  % that's not enough 
*/
insert_sort(List,Sorted):-
	i_sort(List,[],Sorted).
i_sort([],Acc,Acc).
i_sort([H|T],Acc,Sorted):-
	insert(H,Acc,NAcc),
	i_sort(T,NAcc,Sorted).
insert((rule(X,N1,N2),M),[(rule(Y,O,P),I)|T],[(rule(Y,O,P),I)|NT]):-
	X>Y,
	insert((rule(X,N1,N2),M),T,NT).
insert((rule(X,N1,N2),M),[(rule(Y,O,P),I)|T],[(rule(X,N1,N2),M),(rule(Y,O,P),I)|T]):-
	X=<Y.
insert(X,[],[X]).


/*-------------------------------------------------


---------------------------------------------------*/


% added by SGP for demo:



demo_mark(CandidateId,ResponseId,QuestionIn,String,OutFile):-
	retractall(spelling_correction(_,_)),% from last time
	map_question(QuestionIn,Question),
	tell(OutFile),
	mark_string(Question,String,System_Mark,Justify),
        demo_justify(CandidateId,ResponseId,QuestionIn,Question,String,System_Mark,Justify),
	told,
	!.

demo_mark(_CandidateId,_ResponseId,QuestionIn,_String,OutFile):-
	tell(OutFile),
	format('<failed> ~w </failed>',[QuestionIn]),
	nl,
	told.


atom2num(A,N):-
	atom_codes(A,C),
	number_codes(N,C).




demo_justify(CandidateId,ResponseId,QuestionIn,_Question,_String,Mark,Justify):-
	atom_codes(Cand,CandidateId),
	atom_codes(Resp,ResponseId),
	write_out_list_of_words_no_spaces([
					  '<marking_result candidate_id="',
			     Cand,
			     '" ','response_id="',Resp,
			     '" ','question_id=','"',QuestionIn,'">']),
			     			     
	format('~n<awarded_marks> ~w </awarded_marks>~n',[Mark]),
	collect_list_of_words(Justify,MatchingWords),
	write('<components> '),
	write_out_list_of_words(MatchingWords),
	write(' </components> '),nl,
        write_spellings,
	write('</marking_result>'),nl,
	nl.


% was a case variant.

write_spellings(Stream):-
	spelling_correction(Bad,Good),
	\+member(Bad,Good),
	up_to_three(Good,Out),
	format('Print: <spelling incorrect=\"~w\"> ',[Bad]),
	write_out_list_of_words(Out,Stream),
	write(' </spelling>'),nl,
	fail.

write_spellings(_Stream):-
	retractall(spelling_correction(_,_)).

up_to_three([A,B,C|_],[A,B,C]):- !.

up_to_three(MustBeTwoOrLess,MustBeTwoOrLess).
	   


write_out_list_of_words([],_Stream).

write_out_list_of_words([H|T],Stream):-
	write(H),
	!,
	(\+T=[] -> (write(' '),	write_out_list_of_words(T,Stream)) ; true).


write_out_list_of_words_no_spaces([],_Stream).

write_out_list_of_words_no_spaces([H|T],Stream):-
	write(H),
	(\+T=[] -> (write_out_list_of_words_no_spaces(T,Stream)) ; true).

collect_list_of_words([],[]).

collect_list_of_words([X|[Y|List]],Output):-
	reverse(X,Rev),
	collect_list(Rev,O1), %nl,
	make_hyphenated_word(O1,[],Out1),
	collect_list_of_words([Y|List],Out2),
	append([Out1],Out2,Output).

collect_list_of_words([X|[]],[Word]):-
	reverse(X,Rev),
	collect_list(Rev,O1),
	make_hyphenated_word(O1,[],Word).

collect_list([X|Y],[Atom|Others]):-
	edge(_I,_J,X,_K,_L,[],Atom),
	\+ Atom= [_|_],
	collect_list(Y,Others).


collect_list([X|Y],Out):-
	edge(_I,_J,X,_K,_L,[],Atom),
	Atom= [_|_],
	collect_list(Atom,Out1), 
	collect_list(Y,Out2),
	append(Out1,Out2,Out).

collect_list([],[]).




make_hyphenated_word([Word],[],Word):- !.

make_hyphenated_word([Word],CodeListSoFar,HyphenatedWord):-
	atom_codes(Word,CodeList),
	append(CodeListSoFar,[45|CodeList],PreFinal),
	check_for_xml_escapes(PreFinal,Final),
	atom_codes(HyphenatedWord,Final).

make_hyphenated_word([H|T],[],Result):-
	atom_codes(H,H1),
	make_hyphenated_word(T,H1,Result).


make_hyphenated_word([H|T],CodeListSoFar,Result):-
	atom_codes(H,H1),
	append(CodeListSoFar,[45|H1],Next),
	make_hyphenated_word(T,Next,Result).


check_for_xml_escapes([60|R],[38,108,116,59|R1]) :-   % < becomes &lt;
	!,
	check_for_xml_escapes(R,R1).


check_for_xml_escapes([62|R],[38,103,116,59|R1]) :-  % > becomes &gt;
	!,
	check_for_xml_escapes(R,R1).


check_for_xml_escapes([38|R],[38,97,109,112,59|R1]) :- % & becomes &amp;
	!,
	check_for_xml_escapes(R,R1).


check_for_xml_escapes([H|R],[H|R1]) :- % don't change anything else yet
	!,
	check_for_xml_escapes(R,R1).


check_for_xml_escapes([],[]).
