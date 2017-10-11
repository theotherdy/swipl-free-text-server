/*---------------------------------------------------------------------
TAGGER.PL



originally based on the DeRose article, Computational Linguistics, 1989,
but amended to HMM like version (DeRose has P(Tag|Word) instead
of P(Word|Tag))

(C) Stephen G Pulman July 1991 

Last changed May 1995

Minor changes made Apr 2002
----------------------------------------------------------------------*/



/*---------------------------------------------------------------------
Predicate: TAG(+Input,-Output,-Score).
     Args: Input = list of words
          Output = list of word/tag pairs
           Score = probability that that word tag pairing is correct
 Succeeds: at most once
 Comments: adds sentence start marker and tag ('^') to beginning of word list,
           calls the predicate that implements the Viterbi search
           with initial probability of (log) 1, then
           reverses the output, because the best path is
           built up backwards
---------------------------------------------------------------------*/

 
 
tag(Input,Output,Score) :-
  best_path(Input,[[0.0E00,'^'/'^']],[Score|Rest]),
  reverse(Rest,['^'/'^'|Output]).


 
/*---------------------------------------------------------------------
Predicate: BEST_PATH(+Wordlist,+PathsSoFar,-EventualWinner)
     Args: 
 Wordlist       = list of words
 PathsSoFar     = list of [Score, word/tag*] sublists (`paths')
 EventualWinner = the highest scoring of those sublists when at end
 of sentence

 Succeeds: at most once
 Comments: see below
---------------------------------------------------------------------*/


best_path([],Prev,Best) :-
 best_of(Prev,a_big_negative_number,Best).

/*---------------------------------------------------------------------
 When we reach the end of wordlist, take the
 best of the previous iteration
----------------------------------------------------------------------*/

best_path([Next|Rest],Prev,Best) :-
 tags_for(Next,Tags),
 assert(used(Next,Tags)),
 extend(Next,Prev,Tags,Extns),
 !,
 best_path(Rest,Extns,Best).

/*---------------------------------------------------------------------
 otherwise,
 to find the best path,
  find the tags for the next word,
  extend each of the current paths with each of the tags
  saving only the best path for each tag
  and recurse
----------------------------------------------------------------------*/


/*---------------------------------------------------------------------
Predicate: EXTEND(+CurrentWord,+PathsSoFar,+ListOfTag/Prob,-NewPaths)
     Args: as stated: third arg from lexical entry for word
           representing P(Tag|Word)
 Succeeds: at most once
 Comments: extend each path by combining the NextTag with
           each of the Paths, save the
           best one, and try the rest of the tags
---------------------------------------------------------------------*/

extend(_Word,_Paths,[],[]).

extend(Word,Paths,[NextTag/NextProb|Rest],[BestThis|BestRest]):-
 extend_paths(Word,Paths,NextTag,NewPaths),
 best_of(NewPaths,a_big_negative_number,[Score|Tags]),
 BestScore is Score+NextProb,
 BestThis = [BestScore|Tags],
 !,
 extend(Word,Paths,Rest,BestRest).

/*---------------------------------------------------------------------
Predicate: EXTEND_PATHS(+CurrentWord,+PathsSoFar,+TagForCurrentWord,-NewPaths)
     Args: as stated
 Succeeds: at most once
 Comments: look at the Tag for the current Word
           and the preceding two,
           get P(Word|Tag), and the trigram prob,
           get new score, and recurse.
           If no trigram, back off to bigram. The bigram
           score should be scaled to make it commensurate with
           trigram scores, but in practice there is usually
           such a big gap between the best path and the others
           that I doubt it makes much difference.
---------------------------------------------------------------------*/


extend_paths(_Word,[],_Tag,[]).

extend_paths(Word, 
             [[Score,W1/LastTag1,W2/LastTag2|OtherTags]|RestPaths],
             Tag,
             [[NewScore,Word/Tag,W1/LastTag1,W2/LastTag2|OtherTags]|Others]):-
  trigram(LastTag2,LastTag1,Tag,Log),
  !,
  NewScore is Score + Log,
  extend_paths(Word,RestPaths,Tag,Others).


extend_paths(Word, 
             [[Score,W1/LastTag|OtherTags]|RestPaths],
             Tag,
             [[NewScore,Word/Tag,W1/LastTag|OtherTags]|Others]):-
  bigram(LastTag,Tag,Log),
  NewScore is Score + Log,
  !,
  extend_paths(Word,RestPaths,Tag,Others).


/*---------------------------------------------------------------------
Predicate: BEST_OF(+Candidates,+BestSoFar,-EventualWinner)
     Args: Candidates = list of paths, as defined above
            BestSoFar = single path
       EventualWinner = single path
 Succeeds: once
 Comments: 
           otherwise, must be at beginning so
            start things off with a dummy smaller than anything else
---------------------------------------------------------------------*/


best_of([],X,X).

/*---------------------------------------------------------------------
 if at end, return current best as best overall
----------------------------------------------------------------------*/


best_of([[NextScore|WdTagSeq]|Rest],a_big_negative_number,Best) :-
  !,
  best_of(Rest,[NextScore|WdTagSeq],Best).

/*---------------------------------------------------------------------
  otherwise, must be at beginning so
            start things off with a dummy smaller than anything else
----------------------------------------------------------------------*/

best_of([[NextScore|WdTagSeq]|Rest],[ScoreOfBestSoFar|_],Best) :-
  best(NextScore,ScoreOfBestSoFar,NextScore),
  !,
  best_of(Rest,[NextScore|WdTagSeq],Best).

/*---------------------------------------------------------------------
 next path is better than previous best so make it
 current best and recurse
----------------------------------------------------------------------*/

best_of([[NextScore|_]|Rest],[ScoreOfBestSoFar|WdTagSeq],Best) :-
  best(NextScore,ScoreOfBestSoFar,ScoreOfBestSoFar),
  !,
  best_of(Rest,[ScoreOfBestSoFar|WdTagSeq],Best).

/*---------------------------------------------------------------------
 next path not better so recurse with no change
----------------------------------------------------------------------*/

/*---------------------------------------------------------------------
Predicate: BEST(+A,+B,-Winner)
     Args: numbers
 Succeeds: once
 Comments: below
---------------------------------------------------------------------*/


best(A,B,A):- 
 A>B,!.

/*---------------------------------------------------------------------
 A is best if it's higher than B. 
----------------------------------------------------------------------*/

best(_,B,B).

/*---------------------------------------------------------------------
 otherwise B, which must be greater than or equal to A
----------------------------------------------------------------------*/
/*---------------------------------------------------------------------

Predicate: tags_for(+Word,-Tags)
     Args: Word an atom or number, Tags a list of tag/prob pairs
 Succeeds: once
 Comments: looks up a lexical entry:
            if not there, puts in a dummy.
            could do better for unknown words
----------------------------------------------------------------------*/

	%    Current tagger uses more complex version in `lexical.pl'

/*---------------------------------------------------------------------
tags_for(Word,Tags) :-
 lx(Word,Tags),
 !.


%tags_for(_Word,[/('??', -1.611809565095832E01)]).


tags_for(_Word,['NNP'/(-7.6),'NN'/ (-7.6),'NNS'/(-7.6),'VB'/(-7.6),'VB'/(-7.6),
	       'VBG'/(-7.6),'VBZ'/(-7.6),'VBD'/(-7.6),
	       'JJ'/(-7.6),'RB'/(-7.6)]).
----------------------------------------------------------------------*/

/*---------------------------------------------------------------------
Predicate: BIGRAM(+Tag1,+Tag2,-Probability)
     Args: Tags are atoms, Prob is a log.
 Succeeds: once
 Comments: look up bigram probability: default to
           a small number if unattested in corpus.
---------------------------------------------------------------------*/

bigram(A,B,C) :-
   bi(A,B,C),
   !.

bigram(_A,_B,-1.611809565095832E01).

trigram(A,B,C,D) :-
   tri(A,B,C,D).

/*---------------------------------------------------------------------
trigram(A,B,C,D) :-
   tri(A,B,C,D),   
   !.

trigram(_A,_B,_C,-1.611809565095832E01).

def analogous to bigram not needed if backing off to bigrams
----------------------------------------------------------------------*/


