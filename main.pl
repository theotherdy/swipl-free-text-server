/*---------------------------------------------------------------------
File main.pl
----------------------------------------------------------------------*/

% load libraries:

:- compile(library(lists)).
%:- compile(library(xml)).


% some declarations:

:- multifile '::'/2.
:- multifile '==>'/2.
:- op(900, xfx, '::').
:- op(800, xfx, '==>').


% the following features are instantiated by the FSM interpreter:
category(np,[det,head,mor,mods,sem,stem]).

% det takes as value any determiner that is present, or `nulldet' if none
% head is the (possibly inflected) head noun, or a list if a name
% mor is a boolean morphology feature, just as in the FraCaS grammar
% mods is a list of anything coming between a det and the head, if the NP is not
% a name
% sem is intended to be used to build a simple semantics for an NP etc
% stem is the stem as found by stemmer.pl (usually accurate)

category(vg,[pol,head,mor,passive,modal,adv,stem]).

% pol = polarity and has as value neg or pos. Will be neg if VG contains n't or not.
% passive = yes or no: test is whether VG contains a VBN + some form of `be'
% modal - value is that of (first) MD tagged word, or `null'
% adv is (first) VG internal adverb, or `null'
% stem is the stem as found by stemmer.pl (usually accurate)

% declarations needed by gcompile.pl:

boolean_feature(mor,[[s1,s2,s3,pl,inf,ing,en,to,psv]]).

lattice_feature(none,dummy).

hol_feature(none).

ignore_feature(dummy).

flist_feature(dummy,_).


% redefine to show all levels of lists:
portray(X) :- write(X).

% end of declarations

%%% load the main code files:

% Hidden Markov Model tagger:

:- compile('tagger.pl').

:- compile('lexical.pl').

:- compile('tokenise.pl').

% data and probabilities:

:- compile('penn_tree_bank_lex_and_ngrams.pl').

:- compile('tweaks_to_lex_and_ngrams.pl').

% additional words and entries:

:- compile('additional_lex_from_bnc/main_compile.pl').

% finite state machine NP and VG finder:

:- compile('find_phrases.pl').

:- compile('stemmer.pl').

:- compile('npvgfsm.pl').

% compiler for categories and patterns:

:- compile('gcompile.pl').

% pattern matcher:

:- compile('pattern_chart.pl').

% some display predicates:

:- compile('display.pl').

% spelling checker:

:- compile(edit_distance).

% the marking engine:

%:- compile('marking_engine.pl').
:- compile('marking_engine_final.pl').



%%%% load data files for 2001 questions:


/*---------------------------------------------------------------------
%:- compile('spellcheck_data_2001.pl').



% files containing the rules/patterns:

:- compile('BioPatterns_2001/conditions.pl').
:- compile('BioPatterns_2001/biology_patterns_4(a)_f_01.pl').
:- compile('BioPatterns_2001/biology_patterns_5(a)(ii)_f_01.pl').
:- compile('BioPatterns_2001/biology_patterns_6(a)_h_01.pl').
:- compile('BioPatterns_2001/biology_patterns_6(b)_h_01.pl').
:- compile('BioPatterns_2001/biology_patterns_6(c)_h_01.pl').
:- compile('BioPatterns_2001/biology_patterns_8(b)_h_01.pl').
:- compile('BioPatterns_2001/biology_patterns_9(c)_f_01.pl').
:- compile('BioPatterns_2001/biology_patterns_12(c)(i)_f_01.pl').
:- compile('BioPatterns_2001/biology_patterns_12(c)(ii)_f_01.pl').
%:- compile('BioPatterns_2001/biology_patterns_13(b)(ii)_f_01.pl').


% the answers:

:- compile('Answers_2001/4(a).pl').
:- compile('Answers_2001/5(a)(ii).pl').
:- compile('Answers_2001/6(a).pl').
:- compile('Answers_2001/6(b).pl').
:- compile('Answers_2001/6(c).pl').
:- compile('Answers_2001/8(b).pl').
:- compile('Answers_2001/9(c).pl').
:- compile('Answers_2001/12(c)(i).pl').
:- compile('Answers_2001/12(c)(ii).pl').
%:- compile('Answers_2001/13(b)(ii).pl').


% mapping between original question numbers and their number in the demo


map_question(1,question(4,a,_)):- !.
map_question(2,question(5,a,ii)):- !.
map_question(3,question(6,a,_)):- !.
map_question(4,question(6,b,_)):- !.
map_question(5,question(6,c,_)):- !.
map_question(6,question(8,b,_)):- !.
map_question(7,question(9,c,_)):- !.
map_question(8,question(12,c,i)):- !.
map_question(9,question(12,c,ii)):- !.

----------------------------------------------------------------------*/


:- compile('spellcheck_data_2003.pl').

%:- compile('BioPatterns_2003/bio_patterns_2(a)_h_03.pl').

:- compile('lang_and_cog_2015_04_rules/rules_lang_and_cog_Q1.pl').
/*
:- compile('BioPatterns_2003/bio_patterns_2(a)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_2(b)(i)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_2(b)(ii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_2(b)(iii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_2(c)(i)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_2(c)(ii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(a)_fur_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(a)_hooves_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(b)(i)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(b)(ii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(b)(iii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(c)(i)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(c)(ii)_h_03.pl').
:- compile('BioPatterns_2003/bio_patterns_4(d)_h_03.pl').
*/


:- compile('lang_and_cog_2015_04_answers/answers_lang_and_cog_Q1_chars_amended.pl').

/*
:-compile('Answers_2003/2(a).pl').
:-compile('Answers_2003/2(b)(i).pl').
:-compile('Answers_2003/2(b)(ii).pl').
:-compile('Answers_2003/2(b)(iii).pl').
:-compile('Answers_2003/2(c)(i).pl').
:-compile('Answers_2003/2(c)(ii).pl').
:-compile('Answers_2003/4(a)_fur.pl').
:-compile('Answers_2003/4(a)_hooves.pl').
:-compile('Answers_2003/4(b)(i).pl').
:-compile('Answers_2003/4(b)(ii).pl').
:-compile('Answers_2003/4(b)(iii).pl').
:-compile('Answers_2003/4(c)(i).pl').
:-compile('Answers_2003/4(c)(ii).pl').
:-compile('Answers_2003/4(d).pl').
*/
% mapping between original questions numbers and their number in the demo:


/*
map_question(1,question(2,a,_)):- !.
map_question(2,question(2,b,i)):- !.
map_question(3,question(2,b,ii)):- !.
map_question(4,question(2,b,iii)):- !.
map_question(5,question(2,c,i)):- !.
map_question(6,question(2,c,ii)):- !.
map_question(7,question(4,a_fur,0)):- !.
map_question(8,question(4,a_hooves,0)):- !.
map_question(9,question(4,b,i)):- !.
map_question(10,question(4,b,ii)):- !.
map_question(11,question(4,b,iii)):- !.
map_question(12,question(4,c,i)):- !.
map_question(13,question(4,c,ii)):- !.
map_question(14,question(4,d,0)):- !.
*/



% now compile the patterns to internal format:

:- compile_boolean_declarations.

:- compile_patterns.

% Setting up the http daemon
:- use_module(library(http/http_unix_daemon)).
:- initialization http_daemon.

% Setting up the web server

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- multifile http_json/1.

http_json:json_type('application/x-javascript').
http_json:json_type('text/javascript').
http_json:json_type('text/x-javascript').
http_json:json_type('text/x-json').

% server(Port) :- http_server(http_dispatch, [port(Port)]). % to allow user to specify port
% alternative is just to launch on port 80
% :- http_server(http_dispatch, [port(80)]).

:- http_handler('/api/mark', handle_api, []).

% Need query in format: mark(question(2, a, 0), "pump blood").

handle_api(Request) :-
		%format(user_output,"I'm here~n",[]),
		http_read_json(Request, DictIn,[json_object(dict)]),
		%format(user_output,"Request is: ~p~n",[Request]),
   		%format(user_output,"DictIn is: ~p~n",[DictIn]),
		%format(user_output,"Answer is: ~p~n",[DictIn.answer]),
		%format(user_output,"q_no is: ~p~n",[DictIn.q_no]),
		%format(user_output,"q_part is: ~p~n",[DictIn.q_part]),
		%format(user_output,"q_subpart is: ~p~n",[DictIn.q_subpart]),
		%Q_part_string = DictIn.q_part,
		%atom_string(Q_part_atom,Q_part_string),
		%format(user_output,"q_part_string is: ~p~n",[Q_part_atom]),
		%format(user_output,"System_Mark is: ~p~n",[DictIn.mark]),
		%format(user_output,"MatchedStrings is: ~p~n",[DictIn.justification]),
		dict_create(X,tag,[q_no:DictIn.q_no,q_part:DictIn.q_part,q_sub:DictIn.q_sub,answer:DictIn.answer,mark:0,justification:0]),
		fe_mark_one_ans(question(X.q_no, X.q_part,X.q_sub), X.answer, Mark, Justification),
		Y = X.put([mark=Mark,justification=Justification]),
		%mark(question(DictIn.q_no, 0, 0), DictIn.answer),
		format(user_output,"System_Mark is: ~p~n",[Y.mark]),
		format(user_output,"MatchedStrings is: ~p~n",[Y.justification]),
		reply_json(Y).

% sept 2004 Changed definition of phrases because it was not backtracking over
% all tagged sentence edges SGP:

phrases(String):-
	tok_and_tag_string(String),
	!,
	apply_find_phrases. %,	write('phrases: apply_find_phrases'),nl.

apply_find_phrases:-
	edge(From,To,_,tagged_sentence,_,_,[_|_]),
	find_phrases(['VB','IN','RB','NN'],From,To),
	find_phrases([np,vg],From,To),
	fail.

apply_find_phrases.




% For building an executable:


runtime_entry(start) :-
	prolog_flag(argv,Args,Args),
	test_args(Args),	% exit with code 0 if wrong number of args
%	flush_output,
        Args = [FileIn,FileOut],

	(FileOut='-stdout' -> OutputFile = 'user_output';OutputFile=FileOut),
                        	% NB -stdin option handled by read_whole_file/2 in tokenise.pl
	catch(test_demo(FileIn,OutputFile),_,halt(0)),
				% exit with code 0 if exception
	halt(1).


test_args(Args) :-
	length(Args,2),
	!.

test_args(_):-
	halt(0).



% test_demo can be used to test the whole system before building the executable.
% xml_*** are from the xml library.
/*---------------------------------------------------------------------
test_demo(FileIn,FileOut):-
	read_whole_file(FileIn,CodeList),
	xml_parse(CodeList,Document),
	xml_subterm(Document,element(candidate_response,
				     [candidate_id=CandId,
				      response_id=RespId,
				      question_id=QCodes],
				     [element(answer,_,[pcdata(AnswerString)])])),
	number_codes(QuestionIn,QCodes),
        demo_mark(CandId,RespId,QuestionIn,AnswerString,FileOut).


----------------------------------------------------------------------*/


test_demo(FileIn,FileOut):-
	read_whole_file(FileIn,CodeList),
	xml_parse(CodeList,Document),
	xml_subterm(Document,element(candidate_response,
				     AttributeList,
				     [element(answer,_,[pcdata(AnswerString)])])),
        member(candidate_id=CandId,AttributeList),
	member(response_id=RespId,AttributeList),
	member(question_id=QCodes,AttributeList),
	number_codes(QuestionIn,QCodes),
        demo_mark(CandId,RespId,QuestionIn,AnswerString,FileOut).

% end of file
