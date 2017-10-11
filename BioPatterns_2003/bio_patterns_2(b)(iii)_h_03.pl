% rules for question 2(b)(iii) foundation paper 2003

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
 question : where else in the circulatory system are valves found?
(two sets of valves are shown in the diagram)
% full mark is 1
-----------------------------------------------------------------*/
% equivalence class 1
% [inside veins]    % ACCEPT 'at start of main arteries'


%1.	(in/inside) (the/your ) veins/Veins
question(2,b,iii): rule(1,1,1)::complete ==> [w(V):member(V,[veins,'Veins'])].

%2.	 Vena Cava, venae cavae
question(2,b,iii): rule(1,2,1)::complete ==>[w(V):member(V,[vena,venae,'Vena','Venae']),w(C):member(C,[cava,cavae,'Cava','Cavae'])].

% start of main arteries
question(2,b,iii): rule(1,2,1)::complete ==>[w(start),w(of),c(np:[stem=artery,mods=L]):member(main,L)].
					     
full_mark(question(2,b,iii),1).
