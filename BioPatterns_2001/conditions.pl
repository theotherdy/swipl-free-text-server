
:- multifile alternatives/2.
:- multifile alternative/2.
:- multifile alt/2.

feature_value(Feature_V,List):-
	(member(Feature_V,List); Feature_V=[]).


alternative(W,Word):-
	alt(Word,List),
	member(W,List).

alternatives(W,[X|L]):-
	(alternative(W,X);
	alternatives(W,L)).



% alternatives: synonyms and other...

% questions 12(c)(i) and 12(c)(ii)
alt(further,[further,more]).
alt(bigger,[more,double,bigger,higher,further,larger,greater]).
alt(faster,[faster,quicker]).
alt(steeper,[steeper]).
alt(intake,[intake]).
alt(smaller,[smaller,little,lesser,reduced,minute,microscopic,atomic]).
alt(slower,[slower]).
alt(active,[active,energetic]).
alt(different,[different]).


	

% question 5(a)(ii) and 4(a)  'is for 'there is', 'was' for 'there was' 
 % (w(call),w(for)), (w(have),w(got)),(come,from)  
alt(require, [require,requires, use,uses,need,needs,have,has,demand,demands, involve,involves,necessitate,necessitates, take,takes, want, wants,is,are,occur,occurs]).

%(w(have),w(got))
%(w(called),w(for))
alt(required, [required, needed,had,demanded,involved,necessitated,took, wanted, was, were,used,occured]).
alt(produce, [produce, produces, produced,make, makes, create,creates, develop, develops, get, gets, grow, grows]).
alt(reproduce,[reproduce, reproduces,multiply,multiplies, procreate, procreates,reproducing,multiplying,procreating,make,making]).
alt(reproduction,[reproduction,multiplication,procreation]).
alt(does, [does,make, manage]).
alt(happens,[happens,happen,happened]).
alt(meiosis, [reduction, division]).  % check this is a multi-word
alt(fertilisation,[fertilisation,fertilization,fecundation,impregnation]).
alt(fertilised, [fertilised, fertilized, fertilising,fertilizing]).
		 %(w(has),w(fertilised)), (w(has),w(fertilized)),(w(has),(w(been), w(fertilised))), (w(has),(w(been), w(fertilized))), (w(being), w(fertilised)), (w(being), w(fertilized))]).
alt(fertilise,[fertilise,fertilize, fertilises, fertilizes]).
alt(thing,[thing,being]).
% 5(a) (ii) only
alt(split, [split, splits, splitting, divides, divided, divide]).  
alt(in, [in,into]).
alt(two, [two,'2','Two']).
alt(and,[and,'&']).
alt(derive,[derive,derives,deduce,deduces,infer,infers,come,comes]).
alt(derived,[derived,deduced,inferred,come]).



% question 9(c)
alt(wrist, [wrist, wrists, 'Wrist']). 
alt(neck,[neck, necks, 'Neck', 'Necks']). %(w(jugular),w(vein))]). 
alt(beat,[beat,beats,beating, pump, pumps, pumping, pumped, pulses, contracting]).
alt(surge,[surge, surges,surging,wave,waves]). %(w(wave),w(down)), (w(waves), w(down))]).
alt(heart, [heart, hearts, 'Heart', 'Hearts']).



% indication of speed
alt(speed,[speed,slowly,quickly,quicker,fast,slow,faster,slower]).
alt(detected,[discovered,noticed,observed,found]).
alt(detect,[discovers,discover,notice,notices,observes,observe,find,finds]).
%%%%%%%%%%%

