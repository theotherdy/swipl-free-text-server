% suffix_match.pl
% adapted from suffix_match_orig.pl

prefix_gt(Prefix,Num):-
	length(Prefix,L),
	L > Num.

prefix_lt(Prefix,Num):-
	length(Prefix,L),
	L < Num.


% all lower case:

vowel(97).
vowel(101).
vowel(105).
vowel(111).
vowel(117).
vowel(121). % let y count as vowel

consonant(98).
consonant(99).
consonant(100).
consonant(102).
consonant(103).
consonant(104).
consonant(106).
consonant(107).
consonant(108).
consonant(109).
consonant(110).
consonant(112).
consonant(113).
consonant(114).
consonant(115).
consonant(116).
consonant(118).
consonant(119).
consonant(120).
%consonant(121). y doesn't count as a consonant
consonant(122).

% suffix_match(+Tag, +Suffix-StemEnding, +SuffixCharList, +StemCharList, +StemEndingCharList)


% JJR
suffix_match('JJR', sser-ss, [114,101,115,115|A], A, [115,115]).
suffix_match('JJR', ffer-ff, [114,101,102,102|A], A, [102,102]).
suffix_match('JJR', ller-ll, [114,101,108,108|A], A, [108,108]).
suffix_match('JJR', pler-ple, [114,101,108,112|A], A, [101,108,112]).
suffix_match('JJR', 'CCer'-'C', [114,101,C,C|A], A, [C]):-
	consonant(C).
suffix_match('JJR', ier-y, [114,101,105|A], A, [121]).
suffix_match('JJR', wer-w, [114,101,119|A], A, [119]).
suffix_match('JJR', 'CVCer'-'CVCe', [114,101,C1,V,C2|A], A, [101,C1,V,C2]):-
	prefix_lt(A,2), % test added
	consonant(C1),
	vowel(V),
	consonant(C2).
/* this seems to give garbage
suffix_match('JJR', 'VCer'-'VrCe', [114,101,C,V|A], A, [101,C,114,V]):-
	consonant(C),
	vowel(V).
*/

suffix_match('JJR', eer-ee, [114,101,101|A], A, [101,101]).
suffix_match('JJR', er-0, [114,101|A], A, []).

% JJS
suffix_match('JJS', ssest-ss, [116,115,101,115,115|A], A, [115,115]).
suffix_match('JJS', ffest-ff, [116,115,101,102,102|A], A, [102,102]).
suffix_match('JJS', llest-ll, [116,115,101,108,108|A], A, [108,108]).
suffix_match('JJS', plest-ple, [116,115,101,108,112|A], A, [101,108,112]).
suffix_match('JJS', 'CCest'-'C', [116,115,101,C,C|A], A, [C]):-
	consonant(C).
suffix_match('JJS', iest-y, [116,115,101,105|A], A, [121]).
suffix_match('JJS', west-w, [116,115,101,119|A], A, [119]).
suffix_match('JJS', 'CVCest'-'CVCe', [116,115,101,C1,V,C2|A], A, [101,C1,V,C2]):-
	prefix_lt(A,2), % test added. Still gets some wrong
	consonant(C1),
	vowel(V),
	consonant(C2).
suffix_match('JJS', 'VrCest'-'VrCe', [116,115,101,C,114,V|A], A, [101,C,114,V]):-
	consonant(C),
	vowel(V).
suffix_match('JJS', eest-ee, [116,115,101,101|A], A, [101,101]).
suffix_match('JJS', est-0, [116,115,101|A], A, []).

% VBZ
suffix_match('VBZ', ches-ch, [115,101,104,99|A], A, [104,99]).
suffix_match('VBZ', shes-sh, [115,101,104,115|A], A, [104,115]).
suffix_match('VBZ', sses-ss, [115,101,115,115|A], A, [115,115]).
suffix_match('VBZ', zzes-zz, [115,101,122,122|A], A, [122,122]).
suffix_match('VBZ', ies-y, [115,101,105|A], A, [121]) :-
        prefix_gt(A, 1).
suffix_match('VBZ', xes-x, [115,101,120|A], A, [120]).
suffix_match('VBZ', s-0, [115|A], A, []).

% VBD only
suffix_match('VBD', went-go, [116,110,101,119|A], A, [111,103]).
suffix_match('VBD', ead-ead, [100,97,101|A], A, [100,97,101]).
suffix_match('VBD', fell-fall, [108,108,101,102|A], A, [108,108,97,102]).

% VBD or VBN
suffix_match(Tag, ied-y, [100,101,105|A], A, [121]) :-
	member(Tag,['VBD','VBN']),
        prefix_gt(A, 1).
suffix_match(Tag, yed-y, [100,101,121|A], A, [121]):- % only VBD originally
	member(Tag,['VBD','VBN']).
suffix_match(Tag, 'Ved'-'Ve', [100,101,V|A], A, [101,V]):-
	member(Tag,['VBD','VBN']),
	vowel(V).
suffix_match(Tag, ffed-ff, [100,101,102,102|A], A, [102,102]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, lled-ll, [100,101,108,108|A], A, [108,108]) :-
	member(Tag,['VBD','VBN']),
        prefix_lt(A, 4).
suffix_match(Tag, ssed-ss, [100,101,115,115|A], A, [115,115]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, 'CCed'-'C', [100,101,C,C|A], A, [C]):-
	member(Tag,['VBD','VBN']),
	consonant(C).
suffix_match(Tag, ced-ce, [100,101,99|A], A, [101,99]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, ged-ge, [100,101,103|A], A, [101,103]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, 'Vthed'-'Vthe', [100,101,104,116,V|A], A, [101,104,116,V]):-
	member(Tag,['VBD','VBN']),
	vowel(V).
suffix_match(Tag, 'VVled'-'VVl', [100,101,108,V1,V2|A], A, [108,V1,V2]):-
	member(Tag,['VBD','VBN']),
	vowel(V1),
	vowel(V2).
suffix_match(Tag, rled-rl, [100,101,108,114|A], A, [108,114]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, wled-wl, [100,101,108,119|A], A, [108,119]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, led-le, [100,101,108|A], A, [101,108]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, ened-en, [100,101,110,101|A], A, [110,101]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, oned-on, [100,101,110,111|A], A, [110,111]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, ered-er, [100,101,114,101|A], A, [114,101]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, sed-se, [100,101,115|A], A, [101,115]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, iated-iate, [100,101,116,97,105|A], A, [101,116,97,105]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, ited-it, [100,101,116,105|A], A, [116,105]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, ved-ve, [100,101,118|A], A, [101,118]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, wed-w, [100,101,119|A], A, [119]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, xed-x, [100,101,120|A], A, [120]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, zed-ze, [100,101,122|A], A, [101,122]):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, uVCed-uVCe, [100,101,C,V,117|A], A, [101,C,V,117]):-
	member(Tag,['VBD','VBN']),
	consonant(C),
	vowel(V).
suffix_match(Tag, 'CVCed'-'CVCe', [100,101,C1,V,C2|A], A, [101,C1,V,C2]):-
	member(Tag,['VBD','VBN']),
	consonant(C1),
	vowel(V),
	consonant(C2).
suffix_match(Tag, ed-0, [100,101|A], A, []):-
	member(Tag,['VBD','VBN']).
suffix_match(Tag, aid-ay, [100,105,97|A], A, [121,97]):-
	member(Tag,['VBD','VBN']).

%VBN only
suffix_match('VBN', gone-go, [101,110,111,103|A], A, [111,103]).
suffix_match('VBN', ead-ead, [100,97,101|A], A, [100,97,101]).
suffix_match('VBN', iven-ve, [110,101,118,105|A], A, [101,118]).
suffix_match('VBN', wn-w, [110,119|A], A, [119]).


% VBG
suffix_match('VBG', ffing-ff, [103,110,105,102,102|A], A, [102,102]).
suffix_match('VBG', lling-ll, [103,110,105,108,108|A], A, [108,108]) :-
        prefix_lt(A, 4).
suffix_match('VBG', ssing-ss, [103,110,105,115,115|A], A, [115,115]).
suffix_match('VBG', zzing-zz, [103,110,105,122,122|A], A, [122,122]).
suffix_match('VBG', 'CCing'-'C', [103,110,105,C,C|A], A, [C]):-
	consonant(C).
suffix_match('VBG', cing-ce, [103,110,105,99|A], A, [101,99]).
suffix_match('VBG', nging-ng, [103,110,105,103,110|A], A, [103,110]).
suffix_match('VBG', ging-ge, [103,110,105,103|A], A, [101,103]).
suffix_match('VBG', 'Vthing'-'Vthe', [103,110,105,104,116,V|A], A, [101,104,116,V]):-
	vowel(V).
suffix_match('VBG', rling-rl, [103,110,105,108,114|A], A, [108,114]).
suffix_match('VBG', wling-wl, [103,110,105,108,119|A], A, [108,119]).
suffix_match('VBG', 'VVling'-'VVl', [103,110,105,108,V1,V2|A], A, [108,V1,V2]):-
	vowel(V1),
	vowel(V2).
suffix_match('VBG', ling-le, [103,110,105,108|A], A, [101,108]).
suffix_match('VBG', ening-en, [103,110,105,110,101|A], A, [110,101]).
suffix_match('VBG', oning-on, [103,110,105,110,111|A], A, [110,111]).
suffix_match('VBG', ering-er, [103,110,105,114,101|A], A, [114,101]).
suffix_match('VBG', sing-se, [103,110,105,115|A], A, [101,115]).
suffix_match('VBG', iating-iate, [103,110,105,116,97,105|A], A, [101,116,97,105]).
suffix_match('VBG', iting-it, [103,110,105,116,105|A], A, [116,105]).
suffix_match('VBG', uing-ue, [103,110,105,117|A], A, [101,117]).
suffix_match('VBG', ving-ve, [103,110,105,118|A], A, [101,118]).
suffix_match('VBG', wing-w, [103,110,105,119|A], A, [119]).
suffix_match('VBG', xing-x, [103,110,105,120|A], A, [120]).
suffix_match('VBG', ying-y, [103,110,105,121|A], A, [121]) :-
        prefix_gt(A, 1).
suffix_match('VBG', ying-ie, [103,110,105,121|A], A, [101,105]).
suffix_match('VBG', zing-ze, [103,110,105,122|A], A, [101,122]).
suffix_match('VBG', uVCing-uVCe, [103,110,105,C,V,117|A], A, [101,C,V,117]):-
        consonant(C),
	vowel(V).

suffix_match('VBG', 'CVCing'-'CVCe', [103,110,105,C1,V,C2|A], A, [101,C1,V,C2]):-
	consonant(C1),
	vowel(V),
	consonant(C2).

suffix_match('VBG', ing-0, [103,110,105|A], A, []).

% NNS
suffix_match('NNS', men-man, [110,101,109|A], A, [110,97,109]).
suffix_match('NNS', ches-ch, [115,101,104,99|A], A, [104,99]).
suffix_match('NNS', shes-sh, [115,101,104,115|A], A, [104,115]).
suffix_match('NNS', ies-y, [115,101,105|A], A, [121]) :-
        prefix_gt(A, 1).
suffix_match('NNS', sses-ss, [115,101,115,115|A], A, [115,115]).
% added:
suffix_match('NNS', zzes-zz, [115,101,122,122|A], A, [122,122]).
suffix_match('NNS', xes-x, [115,101,120|A], A, [120]).
% added: ghettoes -> o, but shoes -> shoe
suffix_match('NNS', oes-o, [115,101,111|A], A, [111]) :-
	prefix_gt(A,2).
suffix_match('NNS', '\'s'-0, [115,39|A], A, []).
suffix_match('NNS', s-0, [115|A], A, []).

