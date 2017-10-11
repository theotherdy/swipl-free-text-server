% LEXICAL LOOKUP
% wrap a few things around the basic look-up function, in case the
% word is not in the lexicon.

% it was in the lexicon: NB this doesn't mean that the entry is the
% right one here!

tags_for(Word,Tags) :-
 lx(Word,Tags),
 !.


% all numbers tagged as CD:
tags_for(Word,['CD'/(-8.17)]) :-  
 number(Word),
 !.

% see if string begins with a number:

tags_for(Word,['CD'/(-8.17)]) :-
 atom_chars(Word,[First|_]),
 name(Number,[First]),
 number(Number),
 !.


% Hyphenation: use tag of second component, if known:
tags_for(Word,Tags):-
 name(Word,WordChars),
 append(_FstChars,[45|SndChars],WordChars),  % 45 = '-'
 name(Snd,SndChars),
 lx(Snd,Tags).



% check for different case possibilities:
% Capitalised words: check for lower case form in lexicon.
tags_for(Word, Tags):-
 begins_with_uppercase(Word,Down),
 lx(Down,Tags),
 !.



% Upper-case words: treat as lower-case (or capitalised).
tags_for(Word,Tags) :-
 all_uppercase(Word),
 (change_all_to_lower_case(Word,Down);
  change_all_but_first_to_lower_case(Word,Down)),
 tags_for(Down,Tags),
 !.


% At this point we know the word isn't there in any case variant.


tags_for(Word,Tags):-
  % assert(unknown(Word)),  % uncomment this if you want a list of unknowns, e.g. for
	                    % customising to new domain.

                            % suggest possible correct forms if needed:
  spell_check3(Word,TargetWords,_),               
  assert(spelling_correction(Word,TargetWords)),

                            % strip off prefix and see if stem is known:
 (prefix(in,Word,Stem)
  ;
  prefix(un,Word,Stem)
  ;
  prefix(dis,Word,Stem)
  ;
  prefix(re,Word,Stem)
  ;
  prefix(ex,Word,Stem)
  ;
  prefix(de,Word,Stem)
  ;
  prefix(pre,Word,Stem)
  ;
  prefix(sub,Word,Stem)),
 lx(Stem,Tags),
 !.

% make guesses based on word endings:
% Endings that subsume others must appear first.

tags_for(Word, ['VBG'/(-6.89),'JJ'/(-8.58)]) :-
 ends_in(Word,gni),
 !.

tags_for(Word, ['RB'/(-6.37)]) :-  
 ends_in(Word,yl),
 !.

tags_for(Word, ['VBD'/(-6.61),'JJ'/(-8.58),'VBN'/(-6.85)]) :-
 ends_in(Word,de),
 !.

tags_for(Word, ['JJ'/(-8.58),'VBN'/(-6.85)]) :-
 ends_in(Word,ne),
 !.

tags_for(Word, ['VB'/(-6.8)]) :-  
 (ends_in(Word,esi)
  ;
  ends_in(Word,ezi)),
 !.

tags_for(Word,['JJ'/(-8.58)]) :- 
 (ends_in(Word,elba)
 ;
  ends_in(Word,tna) % new
 ;
 ends_in(Word,suo)
 ;
 ends_in(Word,evi)
 ;
 ends_in(Word,yr)
 ;
 ends_in(Word,ssel)
 ;
 ends_in(Word,ci)
 ;
 ends_in(Word,ht)
 ;
 ends_in(Word,la)),
 !.

tags_for(Word, ['NN'/(-8.48)]) :-
 (ends_in(Word,ro)
  ;
     ends_in(Word,re) % new
 ;
     ends_in(Word,msi) % new
 ;
  ends_in(Word,noi)
  ;
  ends_in(Word,ega)
  ;
  ends_in(Word,pihs)
  ;
  ends_in(Word,sse)
  ;
  ends_in(Word,yti)
  ;
  ends_in(Word,ecn)
  ;
  ends_in(Word,tnem)),
 !.


tags_for(Word, ['NNS'/(-7.8),'VBZ'/(-6.38)]) :-
 (ends_in(Word,s);ends_in(Word,'S')).

% If not found, and begins with uppercase, likely to be Name:


tags_for(Word,['NNP'/(-8.75)]) :-
	begins_with_uppercase(Word,_Down).


tags_for(_Word,['VB'/(-9.16290731874155E-01),'NN'/(-9.16290731874155E-01),
                'JJ'/(-1.6094379124341E00)]).

% various predicates for manipulating case, affixes etc.
% They could be made more efficient:

% ends_in(+Word,+EndingReversed)
%-------------------------------

ends_in(Word,Ending) :-
 name(Word,Chars),
 name(Ending,EndingChars),
 reverse(Chars,Reversed),
 append(EndingChars,_Stem,Reversed).


% prefix(+Pre,+Word,-Stem)
%-------------------------

prefix(Pfx,Word,Stem) :-
 name(Word,WordChars),
 name(Pfx,PfxChars),
 append(PfxChars,StemChars,WordChars),
 name(Stem,StemChars).


change_all_to_lower_case(In,Out) :-
 name(In,Upper),
 downcase(Upper,Lower),
 name(Out,Lower).

change_all_but_first_to_lower_case(In,Out) :-
 name(In,[First|Rest]),
 downcase(Rest,Lower),
 name(Out,[First|Lower]).

% downcase(+ListOfCharCodes,+DownCaseVersions)
%---------------------------------------------

downcase([],[]).

downcase([H|T],[H1|T1]) :-
 is_uppercase(H),
 !,
 H1 is H+32,
 downcase(T,T1).

% if upper, get lower: ascii code + 32


downcase([H|T],[H|T1]) :-
 !,
 downcase(T,T1).

% otherwise leave and recurse

% all_uppercase(+Word) - true if contains no character that is not upper case
%----------------------

all_uppercase(Word) :-
 name(Word,N), length(N,L), L>1,
 all_upper(N).

all_upper([]).
all_upper([H|T]):-
  is_uppercase(H),
  !,
  all_upper(T).

% begins_with_uppercase(Word,DowncasedVersion)
%----------------------------------------------
% true if word begins with upper case; returns with lower case
% assumes rest of word was already lower case

begins_with_uppercase(Word,Down) :-
 name(Word,[H|T]),
 is_uppercase(H),
 downcase([H],[H1]),
 name(Down,[H1|T]).

% char tests:
is_uppercase(Ascii) :-
  Ascii<91,
  Ascii>64.


is_lowercase(Ascii) :-
  Ascii<123,
  Ascii>96.

% just does the test:

begins_with_uppercase(W) :-
	name(W,[H|_]),
	is_uppercase(H).

begins_with_lowercase(W):-
	name(W,[H|_]),
	is_lowercase(H).

% used in development:

possible_tag(Word,Tag) :-
 lx(Word,Tags),
 member(Tag/_Score,Tags).

% end of file
