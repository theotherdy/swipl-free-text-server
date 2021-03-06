% rules for question 4(c)(i) higher tier paper 2003

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
 question : 

% full mark is 2
-----------------------------------------------------------------*/
% equivalence class 1
% [identical/copy/same]

question(4,c,i): rule(1,0,1) :: 'NN' ==> [w('D'),w('N'),w('A')].

%(I)identical/copy/same/replica/replicate/replication /copied/copies/copying/match/Match/
question(4,c,i): rule(1,1,1):: complete ==> [w(I):member(I,[identical,copy,same,replica,replicate,replication,copied,copies,copying,match,'Match','Identical','Copy','Same','Replica','Replicate','Replication','Copied','Copies','Copying'])].

%exact genetic/genes/genetic genes as another ==> same
question(4,c,i): rule(1,2,1):: complete ==> [w(exact),w(I):member(I,[genes,genetic]),?(w(genes)),w(as),w(another)].							    
%equivalence class 2: [genetic/DNA]
%1.	genetic (material/info/information/code/makeup) /DNA/Dna/chromosomes/genetically/genes/gene
question(4,c,i): rule(2,1,1):: complete ==> [w(W):member(W,[genetic,'DNA','Dna',chromosomes,genetically,genes,gene,'Genetic','Chromosomes','Genetically','Genes','Gene'])].

%2.	exact genetic/genes/genetic genes as another
question(4,c,i): rule(2,2,1):: complete ==> [w(exact),w(I):member(I,[genes,genetic]),?(w(genes)),w(as),w(another)].	

full_mark(question(4,c,i),2).
