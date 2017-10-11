/*---------------------------------------------------------------------
stemmer.pl

Attempts to find stem for words tagged as one of:
['JJR','JJS','MD','NN','NNS','PRP','PRP$','RB','VB','VBD','VBG',
'VBN','VBP','VBZ','WP','WP$'] ).

stem_match is a list of irregular forms and exceptions to rules.
suffix_match is a list of suffixes and replacements to give stems.

Both of these are adapted from text files in the BNC distribution,
although I have changed and added to this where necessary.
It seems to give quite good results, with two exceptions:

US spellings of things like `traveling' are not handled correctly,
although UK spelling of them is.


There are rules for comparative and superlative adjective endings.
These are difficult to get right. The original rules gave
`bittere' as the stem of `bitterest' and `severe' as the
stem for `severest'. They currently get things the
other way round: `bitter' but `sever'. You can't get this
right without information about stress, I think.

This is version 1, Sept 2004

(C) Stephen Pulman and Oxford University

----------------------------------------------------------------------*/

:- compile(stem_match).
:- compile(suffix_match).


find_stem(Word,Tag,Stem) :-
	change_all_to_lower_case(Word,DWord),
	(stem_match(DWord,Stem,Tag)
	;
	(atom_codes(DWord,Codes),
	reverse(Codes,Reversed),
	suffix_match(Tag,_Id,Reversed,Prefix,NewSuffix),
	append(NewSuffix,Prefix,RStemCodes),
	reverse(RStemCodes,StemCodes),
	atom_codes(Stem,StemCodes))),
	!.

find_stem(Word,'NNP',Word) :- !.

find_stem(Word,'NNPS',Word) :- !.

find_stem(Word,_,DWord) :-
	change_all_to_lower_case(Word,DWord).



test_stemmer :-
	lx(Word,Entry),
	atom(Word),
	member(Tag/_,Entry),
	member(Tag,
	       ['JJR','JJS','MD','NN','NNS','PRP','PRP$','RB',
		'VB','VBD','VBG','VBN','VBP','VBZ','WP','WP$'] ), 
	find_stem(Word,Tag,Stem),
 	format('Stem for ~w as ~w is ~w~n',[Word,Tag,Stem]),
	fail.

test_stemmer.
	       
