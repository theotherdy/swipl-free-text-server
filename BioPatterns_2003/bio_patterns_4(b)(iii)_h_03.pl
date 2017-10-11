% rules for question 4(b)(iii) higher tier paper 2003

%:-multifile answer/4.
:- multifile full_mark/2.

:- multifile alternative/2.
:- multifile equivalence_class/2.
:- multifile similar/2.

:- multifile '::'/2.
:- multifile '==>'/2.
% for gcompile.pl:
:- op(1000,xfx,syn).
:- op(1000,xfx,sem).


/*----------------------------------------------------------------
 question : 

% full mark is 1
-----------------------------------------------------------------*/
% equivalence class 1
% [hard to watch out for poachers]

%1.	hard(er)/difficult to monitor [whether the bucardo are being hunted]/hunting
%6.	mountains cannot be patrolled easily to prevent poachers
%7.	difficult to police
%8.	couldn't be watched very well to look for poachers
%9.	difficult to monitor whether people are killing them
%10.	difficult to survey all the mountains to ensure illegal poaching is not taking place
%11.	it would be hard for people to check whether anyone is doing anything illegal
%13.	making it harder for man to protect them from hunters
question(4,b,iii): rule(1,1,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),?(c(np:[stem=Z]):member(Z,[place,habitat,environment])),?(w(_)),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,police,patrol,watch,look,check,protect])].

question(4,b,iii): rule(1,'1_1',1):: complete ==> [c(vg:[pol=neg,stem=M]):member(M,[monitor,survey,police,patrol,watch,look,check,protect])].

%2.	hard to stop/watch out for poachers
question(4,b,iii): rule(1,2,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']), ?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),c(vg:[pol=pos,stem=W]):member(W,[stop,watch,look]),?(w(for)),c(np:[stem=P]):member(P,[poacher,hunter])].

% hard to stop people from killing
question(4,b,iii): rule(1,'2_1',1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']), ?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger])),c(vg:[pol=pos,stem=W]):member(W,[stop,watch,look]),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),?(w(X):member(X,[for,of,from])),c(vg:[pol=pos,stem=Z]):member(Z,[poach,hunt,kill,shoot,harm,hurt])].

%16.	difficult/hard/harder to stop people from going up the mountains and killing them
question(4,b,iii): rule(1,'2_2',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']), ?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger])),c(vg:[pol=pos,stem=W]):member(W,[stop,watch,look]),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),?(w(X):member(X,[for,of,from])),c(vg:[pol=pos,stem=V]):member(V,[go,climb]),?(c(np:[stem=mountain])),?(_/','),_/'CC',c(vg:[pol=pos,stem=Z]):member(Z,[poach,hunt,kill,shoot,harm,hurt])].

%3.	hunters/poachers could bypass
question(4,b,iii): rule(1,3,1):: complete ==>[c(np:[stem=P]):member(P,[poacher,hunter]),c(vg:[pol=pos,stem=B]):member(B,[bypass])].

%4.	mountains make it easy for hunters to hide
%4.	mountains make it easy for the bucardos and hunters to hide
question(4,b,iii): rule(1,4,1):: complete ==>[c(np:[stem=P]):member(P,[poacher,hunter]),c(vg:[pol=pos,stem=H]):member(H,hide)].
					      
%5.	not a lot/many of people could look out for them and made it easy for hunters to hunt them down

% not a lot of people could look/watch out for them

question(4,b,iii): rule(1,5,1):: complete ==>[w(not),c(np:[stem=lot]),?(w(of)),c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone]),c(vg:[pol=pos,stem=K]):member(K,[look,watch,monitor]),?(w(for)),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].

% not many people could look/watch out for them
question(4,b,iii): rule(1,6,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind]),member(not,L),member(many,L)),c(vg:[pol=pos,stem=K]):member(K,[look,watch,monitor,keep]),?(c(np:[stem=eye])),?(w(for)),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].
% less/no people could look/watch out for them

question(4,b,iii): rule(1,7,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,ranger,scientist,we,mankind]),member(G,[no,less]),member(G,L)),c(vg:[pol=pos,stem=K]):member(K,[look,watch,monitor,keep]),?(c(np:[stem=eye])),?(w(for)),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].

% nobody

question(4,b,iii): rule(1,'7_1',1):: complete ==>[c(np:[stem=P]):member(P,[nobody]),c(vg:[pol=pos,stem=K]):member(K,[look,watch,monitor,keep]),?(c(np:[stem=eye])),?(w(for)),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].

% easy for hunters to hunt them down
question(4,b,iii): rule(1,8,1):: complete ==>[w(W):member(W,[easy]),w(for),c(np:[stem=P]):member(P,[hunter,poacher])].

%12.	not many people could count its numbers or stop others from hunting

% not many people stop others from hunting
question(4,b,iii): rule(1,11,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind]),member(not,L),member(many,L)),c(vg:[pol=pos,stem=K]):member(K,[stop]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human])), _/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

question(4,b,iii): rule(1,12,1):: complete ==>[w(not),c(np:[stem=lot]),?(w(of)),c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind]),c(vg:[pol=pos,stem=K]):member(K,[stop]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human])), _/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

% no ...


question(4,b,iii): rule(1,'12_1',1):: complete ==>[c(np:[stem=O,det=no]):member(O,[people,man,human,ranger,one,scientist,we,mankind]),c(vg:[pol=pos,stem=K]):member(K,[stop]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human])), _/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].


% nobody
question(4,b,iii): rule(1,'12_2',1):: complete ==>[c(np:[stem=O]):member(O,[nobody]),c(vg:[pol=pos,stem=K]):member(K,[stop]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,mankind,we,one])), _/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

% disjunction / coordination  
% the second conjunct is important in this equivalence class
question(4,b,iii): rule(1,13,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,ranger,anybody,somebody,someone]),member(not,L),member(many,L)),c(vg:[pol=pos,stem=K]):member(K,[count,monitor,record,check,see,survey,watch,look]),c(np:[stem=N]):member(N,[number,population]), ?(_/','),_/'CC', (c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,mankind,one,we])), _/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

question(4,b,iii): rule(1,14,1):: complete ==>[w(not),c(np:[stem=lot]),?(w(of)),c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind]),c(vg:[pol=pos,stem=K]):member(K,[count,monitor,record,check,see,survey,watch,look]),c(np:[stem=N]):member(N,[number,population]), ?(_/','),_/'CC', (c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,anybody,mankind,one,we])), ?(c(vg:[stem=try])),_/'IN', c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

%17.	difficult to monitor their numbers and stop anybody trying to hunt them

question(4,b,iii): rule(1,'14_1',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]), ?(_/','),_/'CC', c(vg:[pol=pos,stem=K]):member(K,[stop,prevent]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,anybody,somebody,someone])), ?(c(vg:[pol=pos,stem=T]):member(T,[try])),?(_/'IN'), c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

% no ..
question(4,b,iii): rule(1,'14_2',1):: complete ==>[c(np:[stem=O,det=no]):member(O,[people,man,human,ranger,one,scientist,we,mankind]),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]),  ?(_/','),_/'CC', c(vg:[pol=pos,stem=K]):member(K,[stop,prevent]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,anybody,somebody,someone,mankind,we])), ?(c(vg:[pol=pos,stem=T]):member(T,[try])),?(_/'IN'), c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

% nobody ..

question(4,b,iii): rule(1,'14_3',1):: complete ==>[c(np:[stem=O]):member(O,[nobody]),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]),  ?(_/','),_/'CC', c(vg:[pol=pos,stem=K]):member(K,[stop,prevent]),(c(np:[stem=other]);c(np:[stem=F]):member(F,[people,man,human,anybody,somebody,someone,scientist,we,mankind])), ?(c(vg:[pol=pos,stem=T]):member(T,[try])),?(_/'IN'), c(vg:[pol=pos,stem=X]):member(X,[poach,kill,hunt,shoot])].

%18.	difficult to accurately record its population and enforce anti-hunting laws

question(4,b,iii): rule(1,'14_4',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,scientist,we,mankind])),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]),  ?(_/','),_/'CC', ?(c(vg:[pol=pos,stem=T]):member(T,[try])),c(vg:[pol=pos,stem=K]):member(K,[enforce]), c(np:[stem=L,mods=A]):(member(L,[law,rule]),member(G,[anti,'anti-hunting']),member(G,A))].

% no ..
question(4,b,iii): rule(1,'14_5',1):: complete ==>[c(np:[stem=O,det=no]):member(O,[people,man,human,ranger,one,scientist,we,mankind]),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]),  ?(_/','),_/'CC', ?(c(vg:[pol=pos,stem=T]):member(T,[try])),c(vg:[pol=pos,stem=K]):member(K,[enforce]), c(np:[stem=L,mods=A]):(member(L,[law,rule]),member(G,[anti,'anti-hunting']),member(G,A))].

% nobody ...

question(4,b,iii): rule(1,'14_6',1):: complete ==>[c(np:[stem=O]):member(O,[nobody]),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,population]),  ?(_/','),_/'CC', ?(c(vg:[pol=pos,stem=T]):member(T,[try])),c(vg:[pol=pos,stem=K]):member(K,[enforce]), c(np:[stem=L,mods=A]):(member(L,[law,rule]),member(G,[anti,'anti-hunting']),member(G,A))].

%14.	there cannot easily have rangers to check if they are surviving or if they are being hunted
question(4,b,iii): rule(1,15,1):: complete ==>[c(vg:[pol=neg,stem=G]):member(G,[have,get]),c(np:[stem=P]):member(P,[people,man,human,ranger,scientist,we,mankind]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S]):member(S,[survive,live])].

% negation does not work so I put them in words
question(4,b,iii): rule(1,'15_1',1):: complete ==>[w(there),w(C):member(C,[cannot,'can\'t','couldn\'t']),?(w(_)),w(G):member(G,[have,get,be]),c(np:[stem=P]):member(P,[people,man,human,ranger,scientist,we,mankind]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S]):member(S,[survive,live])].

% no ...

question(4,b,iii): rule(1,'15_2',1):: complete ==>[c(np:[stem=O,det=no]):member(O,[people,man,human,ranger,one]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S]):member(S,[survive,live])].

% nobody
question(4,b,iii): rule(1,'15_3',1):: complete ==>[c(np:[stem=nobody]),	c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S]):member(S,[survive,live])].
				      
%15.	there cannot easily have rangers to check if they are being hunted
question(4,b,iii): rule(1,16,1):: complete ==>[c(vg:[pol=neg,stem=G]):member(G,[have,get]),c(np:[stem=P]):member(P,[people,man,human,ranger,scientist,we,mankind]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S,passive=yes]):member(S,[poach,hunt,kill,shoot])].

% no ...
question(4,b,iii): rule(1,'16_1',1):: complete ==>[c(vg:[pol=neg,stem=G]):member(G,[have,get]),c(np:[stem=P]):member(P,[people,man,human,ranger,scientist,we,mankind]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S,passive=yes]):member(S,[poach,hunt,kill,shoot])].

% nobody
question(4,b,iii): rule(1,'16_2',1):: complete ==>[c(np:[stem=nobody]),c(vg:[pol=pos,stem=L]):member(L,[monitor,survey,watch,look,see,check,record,count]),w(I):member(I,[if,that]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), c(vg:[pol=pos,stem=S,passive=yes]):member(S,[poach,hunt,kill,shoot])].

% 19.	nobody would really be able to keep an eye on it a hunters
question(4,b,iii): rule(1,17,1):: complete ==>[c(np:[stem=nobody]),c(vg:[pol=pos,stem=able]),c(vg:[pol=pos,stem=K]):member(K,[check,keep]),?(c(np:[stem=eye])),?(_/'IN'),?(_/'PRP'),c(np:[stem=H]):member(H,[hunter,poacher])].

% no one ...

question(4,b,iii): rule(1,18,1):: complete ==>[c(np:[stem=O,det=no]):member(O,[people,man,human,ranger,one,scientist,we,mankind]),c(vg:[pol=pos,stem=able]),c(vg:[pol=pos,stem=K]):member(K,[check,keep]),?(c(np:[stem=eye])),?(_/'IN'),?(_/'PRP'),c(np:[stem=H]):member(H,[hunter,poacher])].					      
%20.	hostile terrain

question(4,b,iii): rule(1,19,1):: complete ==>[c(np:[stem=T,mods=H]):(member(T,[terrain]),member(hostile,H))].
									    
%equivalence class 2
% [hard to monitor animals]

%not many people could count its numbers
question(4,b,iii): rule(2,1,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,scientist,we,mankind]),member(not,L),member(many,L)),c(vg:[pol=pos,stem=K]):member(K,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,popultation])].

%
question(4,b,iii): rule(2,2,1):: complete ==>[w(not),c(np:[stem=lot]),?(w(of)),c(np:[stem=P]):member(P,[people,man,human,scientist,we,mankind]),c(vg:[pol=pos,stem=K]):member(K,[monitor,survey,watch,look,see,check,record,count]),c(np:[stem=N]):member(N,[number,popultation])].

% hard to monitor animals
%2.	hard/difficult (place) to monitor
question(4,b,iii): rule(2,3,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(c(np:[stem=X]):member(X,[place,terrain,land,habitat,environment,area])),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[monitor,survey,watch,look,check,keep]), ?(c(np:[stem=eye])),?(_/'IN'),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].

%1.	hard to keep tabs on them
question(4,b,iii): rule(2,3,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[keep,place]),c(np:[stem=T]):member(T,[tab]),?(_/'IN'),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].


%3.	(very) hard (for people) to keep track of its/the animal whereabouts
%4.	(very) hard (for people) to (keep) track (of it)
%16.	(very) hard/difficult (for people) to find/to reach/to count/to access/to locate/to watch/keep an eye on  (the bucardos/goats/animals/them)
% difficult to keep track of
%17.	hard to find/reach/access and (therefore) count/monitor each bucardo/their numbers
%19.	hard to keep numbers/count
question(4,b,iii): rule(2,4,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[keep,place,find,reach,count,access,locate,watch]),?(c(np:[stem=T]):member(T,[track])),?(w(of)),?(_/'IN'),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);(_/'PRP';c(np:[stem=Z]):member(Z,[whereabout,place])))].


question(4,b,iii): rule(2,'4_1',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[keep,place,find,reach,count,access,locate,watch])].
%?(c(np:[stem=T]):member(T,[track])),?(w(of))].


%5.	(people) cannot monitor them (very) well
%6.	cannot keep close watch on /keep an eye on
%9.	you can't watch their progress
%13.	cannot watch over the bucardo all the time
question(4,b,iii): rule(2,5,1):: complete ==> [c(vg:[pol=neg,stem=M]):member(M,[monitor,keep,watch]),?(w(close)),?(w(watch)),?(c(np:[stem=eye]))].

% negation does not work  -- we changed to the way it is now!
question(4,b,iii): rule(2,'5_1',1):: complete ==> [c(vg:[pol=pos,stem=M,modal=C]):(member(M,[monitor,watch]),member(C,[cannot,'can\'t','couldn\'t']))].

question(4,b,iii): rule(2,'5_2',1):: complete ==> [c(vg:[pol=pos,stem=M,modal=C]):(member(M,[keep]), member(C,[cannot,'can\'t'])),?(w(close)),(w(watch);c(np:[stem=eye]))].

% weird results with negation so I decided to write them in words

question(4,b,iii): rule(2,'5_3',1):: complete ==> [w(C):member(C,[cannot,'can\'t','couldn\'t']),?(w(_)),w(M):member(M,[monitor,watch,monitored,watched])].

question(4,b,iii): rule(2,'5_4',1):: complete ==> [w(C):member(C,[cannot,'can\'t','couldn\'t']),w(keep),?(w(close)),(w(watch);c(np:[stem=eye]))].

%7.	cannot/not (easily) (be) monitored
question(4,b,iii): rule(2,6,1):: complete ==> [w(C):member(C,[cannot,'couldn\'t',not]),?(w(easily)),?(w(be)), w(M):member(M,[monitored,watched])].

%8.	wouldn't be able to monitor
question(4,b,iii): rule(2,7,1):: complete ==> [c(vg:[pol=neg,stem=A]):member(A,[able,capable]),c(vg:[pol=pos,stem=M]):member(M,[monitor])].


%10.	they cannot (bucardo) be closely or daily monitored
question(4,b,iii): rule(2,8,1):: complete ==>[w(cannot),?(_/'('),c(np:[stem=M]):similar(M,goat),?(_/')'), w(be),w(C):member(C,[closely,daily]),?(_/'CC'),?(w(_)),w(monitored)].


%11.	difficult place to visit to track the progress of the species
question(4,b,iii): rule(2,9,1):: complete ==> [c(np:[stem=P,mods=L]):(member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),member(H,L),member(P,[place])),c(vg:[pol=pos,stem=V]):member(V,[visit])].

%12.	difficult/hard to (keep) get/go up (the mountains) to keep track/to monitor
question(4,b,iii): rule(2,10,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(c(vg:[pol=pos,stem=keep])),c(vg:[pol=pos,stem=G]):member(G,[get,go]),c(np:[stem=mountain])].

question(4,b,iii): rule(2,'10_1',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(c(vg:[pol=pos,stem=keep])),c(vg:[pol=pos,stem=G]):member(G,[get,go]),c(vg:[pol=pos,stem=M]):member(M,[monitor])].

question(4,b,iii): rule(2,'10_2',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(c(vg:[pol=pos,stem=keep])),c(vg:[pol=pos,stem=G]):member(G,[get,go]),c(vg:[pol=pos,stem=M]):member(M,[keep]),w(track)].

%14.	there cannot easily have rangers to check if they are surviving 
question(4,b,iii): rule(2,11,1):: complete ==> [w(cannot),w(E):member(E,[easily]),w(have),(c(np:[stem=ranger]);c(np:[stem=M]):similar(M,man)),?(c(vg:[pol=check])),_/'IN',(c(np:[stem=G]):similar(G,goat);_/'PRP'),c(vg:[stem=S]):member(S,[survive])].

%15.	cannot stop others from hunting/poaching/killing/shooting
question(4,b,iii): rule(2,12,1):: complete ==> [c(vg:[pol=pos,stem=O]):member(O,[stop,prevent]),(w(others);c(np:[stem=M]):similar(M,man)),?(w(from)),w(J):similar(J,hunt)].


%18.	number of bucardos are hard to find
question(4,b,iii): rule(2,13,1):: complete ==> [c(np:[stem=N]):member(N,[number,population]),?(w(of)),c(np:[stem=B]):similar(B,goat),c(vg:[pol=pos,stem=H]):member(H,[hard,harder,difficult]),c(vg:[pol=pos,stem=F]):member(F,[find])].

%21.	calculations of how many there are are hard to make
question(4,b,iii): rule(2,14,1):: complete ==>[c(np:[stem=C]):member(C,[calculation]),?(w(of)),w(how),w(M):member(M,[many,much]),w(there),c(vg:[pol=pos,stem=be]),c(vg:[pol=pos,stem=H]):member(H,[hard,harder,difficult])].

%20.	hard (for people) to record their number(s)/how many there were/are
%22.	difficult to accurately record its numbers/population
question(4,b,iii): rule(2,15,1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[keep,place,find,reach,count,access,locate,watch]),c(np:[stem=T]):member(T,[number,population])].


question(4,b,iii): rule(2,'15_1',1):: complete ==> [w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult']),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone])),c(vg:[pol=pos,stem=M]):member(M,[keep,place,find,reach,count,access,locate,watch,record]),w(how),w(Z):member(Z,[much,many]),w(there),c(vg:[pol=pos,stem=be])].




%23.	not many people could count its numbers or stop others from hunting
question(4,b,iii): rule(2,16,1):: complete ==>[w(not),c(vg:[pol=pos,stem=O]):similar(O,man),c(vg:[pol=pos,stem=V]):member(V,[keep,place,find,reach,count,access,locate,watch])].

question(4,b,iii): rule(2,17,1):: complete ==>[w(not),c(vg:[pol=pos,stem=O]):similar(O,man),c(vg:[pol=pos,stem=V]):member(V,[keep,place,find,reach,count,access,locate,watch]),?(w(track)),?(w(of)),c(np:[stem=N]):member(N,[number,population])].

%24.	people couldn't find out what help the bucardos needed or why they were dying, or find bucardos so they could know how many there were
% couldn't find bucardos so they could know how many there were
question(4,b,iii): rule(2,18,1):: complete ==>[c(vg:[pol=neg,stem=F]):member(F,[find,locate]),c(np:[stem=G]):similar(G,goat),_/'IN',?(_/'PRP'),c(vg:[pol=pos,stem=K]):member(K,[know,tell]),w(how),w(I):member(I,[many,much]),w(there),c(vg:[pol=pos,stem=be])].

question(4,b,iii): rule(2,'18_1',1):: complete ==>[c(vg:[pol=neg,stem=F]):member(F,[find,locate,keep,place,reach,count,access,locate,watch]),c(np:[stem=G]):similar(G,goat),_/'IN',?(_/'PRP'),c(vg:[pol=pos,stem=K]):member(K,[know,tell]),c(np:[stem=N]):member(N,[number,population])].

question(4,b,iii): rule(2,'18_2',1):: complete ==>[c(vg:[pol=neg,stem=F]):member(F,[find,locate,keep,place,reach,count,access,locate,watch])].

%25.	they cannot be surveyed discretely/easily/often
question(4,b,iii): rule(2,19,1):: complete ==>[w(cannot),w(be),w(surveyed),w(I):member(I,[discretely,easily,often])].

% equivalence class 3
% [difficult access]
question(4,b,iii): rule(3,1,1):: complete ==>[w(not),c(np:[stem=lot]),?(w(of)),c(np:[stem=P]):member(P,[people,man,human,scientist,we,mankind]),c(vg:[pol=pos,stem=K]):member(K,[live,go,climb]),?(w(high)),?(w(up)),_/'IN', c(np:[stem=mountain])].

question(4,b,iii): rule(3,2,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,man,human,scientist,we,mankind]),member(not,L),member(many,L)),c(vg:[pol=pos,stem=K]):member(K,[live,go,climb]),?(w(high)),?(w(up)),_/'IN', c(np:[stem=mountain])].

% hard/difficult (to) access
%3.	difficult/hard/harder (for humans/man/people/scientists/mankind/us) to get/getting (up) (to/high) / to travel (to/up/high) /to access/to reach/to go/ to live/survive (in the mountains)
% difficult for human aid to reach/approach/arrive/access
%	difficult (for humans/man) to climb the mountain(s)
%16.	difficult (terrain/place/area/habitat/land/environment) ( for humans/man) to travel (across/up)/to visit/to navigate /to climb
%19.	the mountainous (sp?) land would have meant man could not protect the bucardo by cars and the landscape would be difficult to cross quickly on foot
question(4,b,iii): rule(3,3,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),?(c(np:[stem=Y]):member(Y,[place,terrain,area,habitat])),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),c(np:[stem=A]):member(A,[access,travel,reach,life,survival,arrival,climbing,visit,navigation,crossing])].

question(4,b,iii): rule(3,4,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),?(c(np:[stem=Y]):member(Y,[place,terrain,area,habitat])),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),c(vg:[pol=pos,stem=A]):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].
/*
question(4,b,iii): rule(3,'4_d',1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),?(c(np:[stem=Y]):member(Y,[place,terrain,area,habitat])),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(_/'CC'),?(_/','),c(vg:[pol=pos,stem=A]):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].
*/
question(4,b,iii): rule(3,'4_1',1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),?(c(np:[stem=Y]):member(Y,[place,terrain,area,habitat])),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),w(A):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross,accessing,getting,travelling,reaching,going,living,surviving,approaching,arriving,climbing,visiting,navigating,crossing])].

question(4,b,iii): rule(3,'4_2',1):: complete ==>[c(np:[stem=Y,mods=L]):(member(Y,[place,terrain,area,habitat]), member(G,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),member(G,L)),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),c(vg:[pol=pos,stem=A]):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

question(4,b,iii): rule(3,'4_3',1):: complete ==>[c(np:[stem=Y,mods=L]):(member(Y,[place,terrain,area,habitat]), member(G,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),member(G,L)),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),w(A):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross,accessing,getting,travelling,reaching,going,living,surviving,approaching,arriving,climbing,visiting,navigating,crossing])].

question(4,b,iii): rule(3,'4_4',1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),?(c(np:[stem=Y]):member(Y,[place,terrain,area,habitat])),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),w(A):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

question(4,b,iii): rule(3,'4_5',1):: complete ==>[c(np:[stem=Y,mods=L]):(member(Y,[place,terrain,area,habitat]), member(G,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous,'Dangerous']),member(G,L)),?(w(for)),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),?(c(vg:[pol=pos])),?(_/'CC'),?(_/','),w(A):member(A,[access,get,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% difficulty/danger/ in ...

%1.	it would take ages to get to them/access them
question(4,b,iii): rule(3,5,1):: complete ==> [c(vg:[pol=pos,stem=T]):member(T,[take]),c(np:[stem=A]):member(A,[age,time]),?(_/'IN'),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

%2.	it is dangerous (for humans/man/people/scientists/us) to get to them/access them
question(4,b,iii): rule(3,6,1):: complete ==> [c(vg:[pol=pos,stem=T]):member(T,[dangerous]),?(_/'IN'), ?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

%4.	unable to reach/access
question(4,b,iii): rule(3,7,1):: complete ==> [w(U):member(U,[unable,impossible]),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

%    not able / not possible
question(4,b,iii): rule(3,8,1):: complete ==> [w(not),w(U):member(U,[able,possible]),?(c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid])),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

%5.	people could not get to
question(4,b,iii): rule(3,9,1):: complete ==>[c(np:[stem=S]):member(S,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=neg,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].


% no one ..can access

question(4,b,iii): rule(3,10,1):: complete ==>[c(np:[stem=O,det=no]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% nobody ...

question(4,b,iii): rule(3,11,1):: complete ==>[c(np:[stem=O]):member(O,[nobody]),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

%6.	inaccessible
question(4,b,iii): rule(3,12,1):: complete ==>[w(W):member(W,[inaccessible])].

%15.	not (very) accessible
question(4,b,iii): rule(3,13,1):: complete ==> [w(not),?(w(V):member(V,[very,too,much,rather,easily])),w(accessible)].

question(4,b,iii): rule(3,'13_1',1):: complete ==> [w(not),?(w(_V)),w(accessible)].
%8.	difficult to keep track of, or reach
question(4,b,iii): rule(3,14,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible']),c(vg:[pol=pos,stem=T]):member(T,[take,keep]),c(np:[stem=K]):member(K,[eye,track]),?(w(of)),?(_/','),_/'CC',c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% difficulty/danger ... in 

%9.	they could get up places no human could
question(4,b,iii): rule(3,15,1):: complete ==>[(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb]),?(_/'IN'),c(np:[stem=P]):member(P,[place]),c(np:[stem=O,det=no]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=pos,stem=_])].

% they could get up places humans couldn't
/*
question(4,b,iii): rule(3,16,1):: complete ==>[(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb]),?(_/'IN'),c(np:[stem=P]):member(P,[place]),c(np:[stem=O]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=pos,stem=_])].
*/
question(4,b,iii): rule(3,16,1):: complete ==>[c(np:[stem=A]):member(A,[animal,goat,bucardo]),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb]),?(_/'IN'),c(np:[stem=P]):member(P,[place]),c(np:[stem=O]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=neg,stem=_])].

% no vg or np is formed

question(4,b,iii): rule(3,'16_1',1):: complete ==>[w(A):member(A,[animal,goat,bucardo]),?(w(_)),w(G):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,gets,accesses,travels,goes,lives,survives,approaches,arrives,climbs]),?(_/'IN'),?(w(_)),w(P):member(P,[place,places,habitat,environment,habitats,environments]),?(w(_)),w(O):member(O,[human,man,people,scientist,us,ranger,mankind,anybody,somebody,aid,one,humans,men,scientists,rangers,aids]),w(U):member(U,['couldn\'t','didn\'t','can\'t','doesn\'t'])].


question(4,b,iii): rule(3,'16_2',1):: complete ==>[_/'PRP',c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb]),?(_/'IN'),c(np:[stem=P]):member(P,[place]),c(np:[stem=O]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,aid,one]),c(vg:[pol=neg,stem=_])].

% in case no vg or np is formed !!!
question(4,b,iii): rule(3,'16_3',1):: complete ==>[_/'PRP',?(w(_)),w(G):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,gets,accesses,travels,goes,lives,survives,approaches,arrives,climbs]),?(_/'IN'),?(w(_)),w(P):member(P,[place,places,habitat,environment,habitats,environments]),?(w(_)),w(O):member(O,[human,man,people,scientist,us,ranger,mankind,anybody,somebody,aid,one,humans,men,scientists,rangers,aids]),w(U):member(U,['couldn\'t','didn\'t','can\'t','doesn\'t'])].

%10.	difficult (for humans) to try and live up there and establish effective measures for its protection
question(4,b,iii): rule(3,17,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous]),?(w(for)),c(np:[stem=O]):member(O,[human,man,people,scientist,we,ranger,mankind,anybody,somebody,one]),?(c(vg:[pol=pos,stem=T]):member(T,[try])),?(_/','),?(_/'CC'),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% difficulty in ....

%12.	difficulty in transport to the mountain(s)
%13.	difficult to transport the (caring) material(s) up
question(4,b,iii): rule(3,18,1):: complete ==>[c(np:[stem=D]):member(D,[difficulty,danger]),?(_/'IN'),(c(np:[stem=J]):member(J,[transport,transportation]);c(vg:[pol=pos,stem=T]):member(T,[transport]))].

question(4,b,iii): rule(3,19,1):: complete ==>[w(H):member(H,[hard,harder,'Hard','Harder',difficult,'Difficult',impossible,'Impossible',dangerous]),(c(np:[stem=J]):member(J,[transport,transportation]);c(vg:[pol=pos,stem=T]):member(T,[transport]))].

%14.	not easy/easily/quickly to/you get there
question(4,b,iii): rule(3,20,1):: complete ==>[w(not),w(W):member(W,[easy,easily,quickly,quick,fast]),?(w(_/'IN')),?(_/'PRP'),c(vg:[pol=pos,stem=G]):member(G,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% not easy/easily/quickly accessible
question(4,b,iii): rule(3,21,1):: complete ==>[w(not),w(W):member(W,[easy,easily,quickly,quick,fast]),w(K):member(K,[accessible])].


%17.	access to the goats habitat. Would have been difficult/hard
/*
question(4,b,iii): rule(3,22,1):: complete ==>[(c(vg:[pol=pos,stem=Q]):member(Q,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross]); c(np:[stem=O]):member(O,[access,travel])),?(_/'IN'), ?(c(np:[stem=H,mods=L]):(member(H,[place,terrain,land,habitat,environment,area]), member(G,[animal,animals,goat,goats,bucardo,bucardos]),member(G,L))),?((_/',';_/'.')),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].
*/

question(4,b,iii): rule(3,22,1):: complete ==>[c(vg:[pol=pos,stem=Q]):member(Q,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross]),?(_/'IN'), ?(c(np:[stem=H,mods=L]):(member(H,[place,terrain,land,habitat,environment,area]), member(G,[animal,animals,goat,goats,bucardo,bucardos]),member(G,L))),?(_/','),?(_/'.'),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].

question(4,b,iii): rule(3,'22_1',1):: complete ==>[c(np:[stem=O]):member(O,[access,travel]),?(_/'IN'), ?(c(np:[stem=H,mods=L]):(member(H,[place,terrain,land,habitat,environment,area]), member(G,[animal,animals,goat,goats,bucardo,bucardos]),member(G,L))),?(_/','),?(_/'.'),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].

% access to the goats' habitat. Would have been difficult/hard
/*
question(4,b,iii): rule(3,23,1):: complete ==>[(c(vg:[pol=pos,stem=Q]):member(Q,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross]); c(np:[stem=O]):member(O,[access,travel])),?(_/'IN'), ?(c(np:[stem=H]):member(H,[place,terrain,land,habitat,environment,area])), ?(_/'POS'),?(c(np:[stem=G]):member(G,[animal,goat,bucardo])),?((_/',';_/'.')),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].
*/
question(4,b,iii): rule(3,23,1):: complete ==>[c(vg:[pol=pos,stem=Q]):member(Q,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross]),?(_/'IN'), ?(c(np:[stem=H]):member(H,[place,terrain,land,habitat,environment,area])), ?(_/'POS'),?(c(np:[stem=G]):member(G,[animal,goat,bucardo])),?(_/','),?(_/'.'),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].

question(4,b,iii): rule(3,'23_1',1):: complete ==>[c(np:[stem=O]):member(O,[access,travel]),?(_/'IN'), ?(c(np:[stem=H]):member(H,[place,terrain,land,habitat,environment,area])), ?(_/'POS'),?(c(np:[stem=G]):member(G,[animal,goat,bucardo])),?(_/','),?(_/'.'),c(vg:[pol=pos,stem=X]):member(X,[difficult,hard,dangerous])].

%18.	might not be manageable for man kind to reach
question(4,b,iii): rule(3,24,1):: complete ==>[c(vg:[pol=neg,stem=M]):member(M,[manageable]),?(w(for)),?(c(np:[stem=P]):member(P,[people,man,human,ranger,anybody,somebody,someone,kind,scientist,we,mankind])),c(vg:[pol=pos,stem=Q]):member(Q,[get,access,travel,reach,go,live,survive,approach,arrive,climb,visit,navigate,cross])].

% vast/huge area/habitat/environment
question(4,b,iii): rule(3,25,1):: complete ==>[w(V):member(V,[vast,huge,large,big]),w(N):member(N,[area,habitat,environment,place])].


%Equivalence class 4: dangers from natural disasters such as landslides

%	landslides/roadslides/mudslides/earthquake
question(4,b,iii): rule(4,1,1):: complete ==> [c(np:[stem=L]):member(L,[landslide,roadslide,mudslide,earthquake])].

%	dangerous/wild terrain/mountain/environment/habitat/land/place
question(4,b,iii): rule(4,2,1):: complete ==>[c(np:[stem=P,mods=L]):(member(P,[terrain,mountain,environment,habitat,land,place]), member(G,[dangerous,wild]),member(G,L))].

%mountains/terrain/habitat/environment is/are (extremely) dangerous/wild
question(4,b,iii): rule(4,3,1):: complete ==>[c(np:[stem=P]):member(P,[terrain,mountain,environment,habitat,land,place]), c(vg:[pol=pos,stem=D]):member(D,[dangerous,wild])].

%mountain/environment as they are dangerous/wild
question(4,b,iii): rule(4,4,1):: complete ==>[c(np:[stem=P]):member(P,[terrain,mountain,environment,habitat,land,place]), ?(w(A):member(A,[as,since])),_/'PRP',c(vg:[pol=pos,stem=D]):member(D,[dangerous,wild])].

% natural disasters/causes/hazzards
question(4,b,iii): rule(4,5,1):: complete ==>[c(np:[stem=P]):member(P,[disaster,cause,hazzard])].

% killed by nature
question(4,b,iii): rule(4,6,1):: complete ==>[c(vg:[stem=P,pol=pos]):member(P,[hurt,kill,harm]), w(by),c(np:[stem=N]):member(N,[nature])].

% not a hospitable environment
question(4,b,iii): rule(4,7,1):: complete ==>[w(not),c(np:[stem=J,mods=L]):(member(H,[hospitable]),member(H,L),member(J,[environment,habitat]))].
					      
full_mark(question(4,b,iii),1).













