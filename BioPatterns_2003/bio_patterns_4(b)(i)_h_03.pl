% rules for question 4(b)(i) higher tier paper 2003

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

% full mark is 1
-----------------------------------------------------------------*/
% equivalence class 1

%[poaching/killing/hunting]

%1.	(H)hunting/hunters/hunted/hunts
%5.	poaching/poachers
%4.	killing/killed/kill
%2.	shooting (for food)/shoot (them)/shot
%6.	traps for (other) animals  -- traps 

question(4,b,i): rule(1,1,1):: complete ==> [w(W):member(W,[hunting,hunters,hunted,hunts, poaching,poachers,killing,killed,kill,kills,shooting,shot,shoot,traps])].

% alternatively to rule(1,1,1) we can have the following rules (they pick up capitals also):
question(4,b,i): rule(1,2,1):: complete ==> [c(vg:[pol=pos,stem=W]):member(W,[hunt,poach,kill,shoot,trap])].

question(4,b,i): rule(1,'2_1',1):: complete ==> [w(W):member(W,[hunt,poach,kill,shoot,trap,hunts,poaches,kills,shoots,traps,hunting,poaching,killing,shooting,trapping,'Hunt','Poach','Kill','Shoot','Trap','Hunting','Poaching','Killing','Shooting','Trapping'])].

question(4,b,i): rule(1,3,1):: complete ==> [c(np:[stem=W]):member(W,[hunter,poacher,killer,shooter,trap,hunt])].	    

%3.	(humans/men/man may have been/could have) eaten/eating/eat/used the bucardo for food   

question(4,b,i): rule(1,4,1):: complete ==> [c(np:[stem=M]):member(M,[man,human,people]),c(vg:[pol=pos,stem=E]):member(E,[eat]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP')].

question(4,b,i): rule(1,5,1):: complete ==> [c(np:[stem=M]):member(M,[man,human,people]),c(vg:[pol=pos,stem=E]):member(E,[use]),(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'), ?(w(_)),w(F):member(F,[food,eating])].

% equivalence class 2
%[loss of habitat/deforestation/for building/agriculture]

% loss of habitat
%	climbers and tourists may have disturbed their habitat
question(4,b,i): rule(2,1,1):: complete ==> [c(np:[stem=L]):member(L,[loss,disturbance,destruction,removal]),?(w(of)),c(np:[stem=H]):member(H,[habitat,land,environment,mountain,home,place])].

question(4,b,i): rule(2,'1_1',1):: complete ==> [c(vg:[pol=pos,stem=L]):member(L,[lose,disturb,destroy,remove]),?(w(of)),c(np:[stem=H]):member(H,[habitat,land,environment,mountain,home,place])].

question(4,b,i): rule(2,'1_2',1):: complete ==> [w(L):member(L,[lose,disturb,destroy,remove,loses,disturbs,destroys,removes,losing,disturbing,destroying,removing]),?(w(of)),c(np:[stem=H]):member(H,[habitat,land,environment,mountain,home,place])].

% (for)	building / construction
%	building villages/mines
%	Setting up building on/in their habitat
question(4,b,i): rule(2,2,1):: complete ==> [w(B):member(B,[building,construction,'Building','Construction',buildings,'Buildings'])].

%1.	using their habitat (the mountains) as space building/ factories etc
question(4,b,i): rule(2,3,1):: complete ==> [c(np:[stem=H]):member(H,[habitat,land,environment,mountain,home]),?(_/'IN'),c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].

%2.	Building on land/the mountain
question(4,b,i): rule(2,4,1):: complete ==>[c(vg:[pol=pos,stem=H]):member(H,[build,construct]),?(_/'IN'),c(np:[stem=Z]):member(Z,[habitat,land,environment,mountain,home,place])].

question(4,b,i): rule(2,'4_1',1):: complete ==>[w(H):member(H,[build,construct,builds,constructs,building,constructing,built,construct,'Build','Construct','Building','Constructing']),?(_/'IN'),c(np:[stem=Z]):member(Z,[habitat,land,environment,mountain,home,place])].

%6.	make (a) tourist resort(s)
%7.	developing towns and cities
%8.	putting up hotels or ski resorts on the mountain

question(4,b,i): rule(2,5,1):: complete ==> [c(vg:[pol=pos,stem=M]):member(M,[make,build,develop,put,construct]), c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].


question(4,b,i): rule(2,'5_1',1):: complete ==> [w(M):member(M,[make,build,develop,put,construct,making,building,developing,putting,constructing,made,built,developed,put,constructed,'Make','Build','Develop','Put','Construct']), c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].

question(4,b,i): rule(2,'5_2',1):: complete ==> [w(M):member(M,[make,build,develop,put,construct,making,building,developing,putting,constructing,made,built,developed,put,constructed,'Make','Build','Develop','Put','Construct']), ?(w(_)),w(B):member(B,[building,buildings,factory,factories,village,villages,mine,mines,resort,resorts,town,towns,city,cities,hotel,hotels])].

%9.	converting the goats homes in mountainous regions /in the mountains into ski/skiing resort(s)
/*
question(4,b,i): rule(2,6,1):: complete ==>[c(np:[stem=H]): member(H,[habitat,land,environment,mountain,home,place]),?(_/'IN'),(?(c(np:[stem=mountain]));?(c(np:[mods=L]):member(mountainous,L))),w(I):member(I,[in,into,to]),c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].
*/

question(4,b,i): rule(2,6,1):: complete ==>[c(np:[stem=H]): member(H,[habitat,land,environment,mountain,home,place]),?(_/'IN'),?(c(np:[stem=mountain])),w(I):member(I,[in,into,to]),c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].

question(4,b,i): rule(2,'6_1',1):: complete ==>[c(np:[stem=H]): member(H,[habitat,land,environment,mountain,home,place]),?(_/'IN'),?(c(np:[mods=L]):member(mountainous,L)),w(I):member(I,[in,into,to]),c(np:[stem=B]):member(B,[building,factory,village,mine,resort,town,city,hotel])].


%10.	destroying/destroys/removed/cutting down/destruction of (their/its/the animal(s)/the bucardo(s)/the goats) (natural) habitat/environment
/*
question(4,b,i): rule(2,7,1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[destroy,remove,cut,chop,log]),?(w(of)),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),?(w(_)),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].
*/

question(4,b,i): rule(2,7,1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[destroy,remove,cut,chop,log]),?(w(of)),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),?(w(_)),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].

question(4,b,i): rule(2,'7_1',1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[destroy,remove,cut,chop,log]),?(w(of)),?(_/'PRP'),?(_/'POS'),?(w(_)),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].

/*
question(4,b,i): rule(2,'7_2',1):: complete ==>[w(D):member(D,[destroy,remove,cut,chop,log,destroyed,removed,chopped,logged,destroying,removing,cutting,chopping,logging,'Destroy','Remove','Cut','Chop','Destroying','Removing','Cutting','Chopping']),?(w(of)),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].

*/

question(4,b,i): rule(2,'7_2',1):: complete ==>[w(D):member(D,[destroy,remove,cut,chop,log,destroyed,removed,chopped,logged,destroying,removing,cutting,chopping,logging,'Destroy','Remove','Cut','Chop','Destroying','Removing','Cutting','Chopping']),?(w(of)),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].

question(4,b,i): rule(2,'7_3',1):: complete ==>[w(D):member(D,[destroy,remove,cut,chop,log,destroyed,removed,chopped,logged,destroying,removing,cutting,chopping,logging,'Destroy','Remove','Cut','Chop','Destroying','Removing','Cutting','Chopping']),?(w(of)),?(_/'PRP'),?(_/'POS'),c(np:[stem=Q]):member(Q,[habitat,environment,home,land,mountain,place])].

%11.	giving/leaving (it) no place
/*
question(4,b,i): rule(2,8,1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[give,leave]),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].
*/

question(4,b,i): rule(2,8,1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[give,leave]),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].

question(4,b,i): rule(2,'8_1',1):: complete ==>[c(vg:[pol=pos,stem=D]):member(D,[give,leave]),?(_/'PRP'),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].

/*
question(4,b,i): rule(2,'8_2',1):: complete ==>[w(D):member(D,[give,leave,given,left,giving,leaving,'Give','Leave','Given','Left','Giving','Leaving']),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].
*/

question(4,b,i): rule(2,'8_2',1):: complete ==>[w(D):member(D,[give,leave,given,left,giving,leaving,'Give','Leave','Given','Left','Giving','Leaving']),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].

question(4,b,i): rule(2,'8_3',1):: complete ==>[w(D):member(D,[give,leave,given,left,giving,leaving,'Give','Leave','Given','Left','Giving','Leaving']),?(_/'PRP'),?(_/'POS'),c(np:[det=no,stem=Q]):member(Q,[place,habitat,environment,home,land,mountain])].

%12.	levelling of mountain sides to grow crops
question(4,b,i): rule(2,9,1):: complete ==>[c(vg:[pol=pos,stem=Z]):member(Z,[level]),w(O):member(O,[of,for]),(c(np:[stem=mountain]);c(np:[mods=L]):(member(G,[mountain,mountainous]),member(G,L))),?(w(for)),c(vg:[pol=pos,stem=S]):member(S,[grow,plant]),c(np:[stem=C]):member(C,[crop,plant,food])].

question(4,b,i): rule(2,'9_1',1):: complete ==>[w(Z):member(Z,[level,levelled,levelling,levels,'Level','Levelled','Levelling','Levels']),w(O):member(O,[of,for]),(c(np:[stem=mountain]);c(np:[mods=L]):(member(G,[mountain,mountainous]),member(G,L))),?(w(for)),c(vg:[pol=pos,stem=S]):member(S,[grow,plant]),c(np:[stem=C]):member(C,[crop,plant,food])].

question(4,b,i): rule(2,10,1):: complete ==>[c(np:[stem=A]):member(A,[agriculture,'Agriculture'])].
%13.	 (D) deforestation


question(4,b,i): rule(2,11,1):: complete ==> [c(np:[stem=A]):member(A,[deforestation,'Deforestation'])].

%14.	cutting down/logging off/chopped down (of) (a/the/more)  tree(s)/forestry/(mountain) forests/

question(4,b,i): rule(2,12,1):: complete ==>[c(vg:[pol=pos,stem=I]):member(I,[cut,log,chop]),?(w(of)),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain])].

question(4,b,i): rule(2,'12_1',1):: complete ==>[w(I):member(I,[cut,log,chop,cutting,logging,chopping,logged,chopped,'Cut','Log','Chop','Cutting','Logging','Chopping','Logged','Chopped']),?(w(_)),?(w(of)),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain])].

%15.	trees/mountain forests/forestry may have been chopped down/cut down/logged off
question(4,b,i): rule(2,13,1):: complete ==>[c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=I]):member(I,[cut,log,chop])].

% Equivalence class 3 : [pollution]

%1.	burning fossil fuels causing acid rain
question(4,b,i): rule(3,1,1):: complete ==>[c(vg:[pol=pos,stem=B]):member(B,[burn]),c(np:[stem=F]):member(F,[fuel])].%,c(vg:[pol=pos,stem=C]):member(C,[cause,create,induce]),c(np:[stem=rain,mods=R]):(member(G,[acid,polluted]),member(G,L))].

question(4,b,i): rule(3,'1_1',1):: complete ==>[w(B):member(B,[burn,burning,burnt,'Burn','Burning','Burnt']),c(np:[stem=F]):member(F,[fuel])].

question(4,b,i): rule(3,2,1):: complete ==>[ c(vg:[pol=pos,stem=C]):member(C,[cause,create,induce]),c(np:[stem=rain,mods=L]):(member(G,[acid,polluted]),member(G,L))].

question(4,b,i): rule(3,'2_1',1):: complete ==>[ w(C):member(C,[cause,create,induce,causing,creating,inducing,caused,created,induced]),c(np:[stem=rain,mods=L]):(member(G,[acid,polluted]),member(G,L))].

%2.	pollution
question(4,b,i): rule(3,3,1):: complete ==> [c(np:[stem=A]):member(A,[pollution,'Pollution'])].

question(4,b,i): rule(3,4,1):: complete ==> [c(np:[stem=A,mods=L]):(member(A,[air,rain]),member(G,[acid,polluted]),member(G,L))].

%Equivalence class 4
%[removal of its food supply]
% food supply

/*
question(4,b,i): rule(4,1,1):: complete ==> %c(np:[stem=R]):member(R,[removal]),w(of),
	[(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].
*/


question(4,b,i): rule(4,1,1):: complete ==> [c(np:[stem=J]):member(J,[food,'Food'])].

question(4,b,i): rule(4,'1_1',1):: complete ==> [c(np:[mods=F]):member(food,F)].

%1.	not leaving them their natural food
/*
question(4,b,i): rule(4,2,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[leave,keep]),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].
*/

question(4,b,i): rule(4,2,1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[leave,keep]),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].

question(4,b,i): rule(4,'2_1',1):: complete ==> [c(vg:[pol=neg,stem=L]):member(L,[leave,keep]),?(_/'PRP'),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].

/*
question(4,b,i): rule(4,'2_2',1):: complete ==> [w(L):member(L,[leave,keep,kept,left,leaving,keeping,'Leave','Kept','Keep','Left','Leaving','Keeping']),(?(c(np:[stem=A]):member(A,[animal,bucardo,goat]));?(_/'PRP')),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].
*/

question(4,b,i): rule(4,'2_2',1):: complete ==> [w(L):member(L,[leave,keep,kept,left,leaving,keeping,'Leave','Kept','Keep','Left','Leaving','Keeping']),?(c(np:[stem=A]):member(A,[animal,bucardo,goat])),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].

question(4,b,i): rule(4,'2_3',1):: complete ==> [w(L):member(L,[leave,keep,kept,left,leaving,keeping,'Leave','Kept','Keep','Left','Leaving','Keeping']),?(_/'PRP'),?(_/'POS'),(c(np:[mods=F]):member(food,F); c(np:[stem=J]):member(J,[food]))].

%2.	reducing the amount of food available
%5.	lose source(s) of food
question(4,b,i): rule(4,3,1):: complete ==> [c(vg:[pol=neg,stem=R]):member(R,[reduce,minimize,lose]),c(np:[stem=A]):member(A,[amount,source,supply]),w(of),c(np:[stem=food])].


question(4,b,i): rule(4,'3_1',1):: complete ==> [w(R):member(R,[reduce,minimize,lose,reducing,minizing,losing,reduced,minimized,lost]),c(np:[stem=A]):member(A,[amount,source,supply]),w(of),c(np:[stem=food])].

question(4,b,i): rule(4,4,1):: complete ==> [c(vg:[pol=neg,stem=R]):member(R,[reduce,minimize,lose]),(c(np:[mods=F]):member(food,F);c(np:[stem=food]))].

question(4,b,i): rule(4,'4_1',1):: complete ==> [w(R):member(R,[reduce,minimize,lose,reducing,minizing,losing,reduced,minimized,lost]),(c(np:[mods=F]):member(food,F);c(np:[stem=food]))].

%3.	removed trees (previous eq class) holding leaves which the Bucardos fed on
question(4,b,i): rule(4,5,1):: complete ==> [c(vg:[pol=pos,stem=R]):member(R,[remove,destroy,cut,chop,log]),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),(c(np:[mods=F]):member(food,F);c(np:[stem=food]))].

question(4,b,i): rule(4,'5_1',1):: complete ==> [w(R):member(R,[remove,destroy,cut,chop,log,removed,destroyed,cut,chopped,logged,removing,destroying,cutting,chopping,logging]),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),(c(np:[mods=F]):member(food,F);c(np:[stem=food]))].

question(4,b,i): rule(4,6,1):: complete ==> [c(vg:[pol=pos,stem=R]):member(R,[remove,destroy,cut,chop,log]),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),c(np:[stem=L]):member(L,[leave]),_/'WDT',(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'),c(vg:[pol=pos,stem=X]):member(X,[feed])].

question(4,b,i): rule(4,'6_1',1):: complete ==> [w(R):member(R,[remove,destroy,cut,chop,log,removed,destroyed,cut,chopped,logged,removing,destroying,cutting,chopping,logging]),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),c(np:[stem=L]):member(L,[leave]),_/'WDT',(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'),c(vg:[pol=pos,stem=X]):member(X,[feed])].



question(4,b,i): rule(4,7,1):: complete ==> [c(np:[stem=R]):member(R,[removal,destruction]),?(w(of)),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),(c(np:[mods=F]):member(food,F);c(np:[stem=food]))].

question(4,b,i): rule(4,8,1):: complete ==> [c(np:[stem=R]):member(R,[removal,destruction]),c(np:[stem=T]):member(T,[tree,forest,forestry,mountain]),c(vg:[pol=pos,stem=H]):member(H,[hold,have,grow]),c(np:[stem=L]):member(L,[leave]),_/'WDT',(c(np:[stem=A]):member(A,[animal,goat,bucardo]);_/'PRP'),c(vg:[pol=pos,stem=X]):member(X,[feed])].

%Equivalence class 5: Others: any resonable suggestion

%1.	increased temperatures due to global warming meaning the bucardo was unable to adapt
question(4,b,i): rule(5,1,1):: complete ==>[w(increased),w(temperature),c(vg:[pol=pos,stem=M]):member(M,[mean,imply]),c(np:[stem=A]):member(A,[animal,goat,bucardo]),(c(vg:[pol=pos,stem=unable]);c(vg:[pol=neg,stem=adapt]))].

question(4,b,i): rule(5,2,1):: complete ==>[w(global),w(warming),c(vg:[pol=pos,stem=M]):member(M,[mean,imply]),c(np:[stem=A]):member(A,[animal,goat,bucardo]),(c(vg:[pol=pos,stem=unable]);c(vg:[pol=neg,stem=adapt]))].



%3.	caused/causing landslides/rocks to fall
question(4,b,i): rule(5,3,1):: complete ==>[c(np:[stem=L]):member(L,[landslide,'Landslide'])].
question(4,b,i): rule(5,4,1):: complete ==>[c(np:[stem=rock]), c(vg:[pol=pos,stem=F]):member(F,[fall])].

%4.	they may have been disturbed when men are climbing the mountains, leaving their young to survive by themselves, and dying
question(4,b,i): rule(5,5,1):: complete ==>[c(vg:[pol=pos,stem=L]):member(L,[leave]),c(np:[stem=C]):member(C,[child,youth]),c(vg:[pol=pos,stem=S]):member(S,[survive,live]),w(B):member(B,[by,on]),(c(np:[stem=H]):member(H,[themselves,itself]); c(np:[mods=Z]):member(own,Z))].

question(4,b,i): rule(5,'5_1',1):: complete ==>[w(L):member(L,[leave,left,leaving]),c(np:[stem=C]):member(C,[child,youth]),c(vg:[pol=pos,stem=S]):member(S,[survive,live]),w(B):member(B,[by,on]),(c(np:[stem=H]):member(H,[themselves,itself]); c(np:[mods=Z]):member(own,Z))].

question(4,b,i): rule(5,6,1):: complete ==>[c(vg:[pol=pos,stem=L]):member(L,[leave]),?(w(_)),w(young),c(vg:[pol=pos,stem=S]):member(S,[survive,live]),w(B):member(B,[by,on]),(c(np:[stem=H]):member(H,[themselves,itself]); c(np:[mods=Z]):member(own,Z))].

question(4,b,i): rule(5,6,1):: complete ==>[w(L):member(L,[leave,left,leaving]),?(w(_)),w(young),c(vg:[pol=pos,stem=S]):member(S,[survive,live]),w(B):member(B,[by,on]),(c(np:[stem=H]):member(H,[themselves,itself]); c(np:[mods=Z]):member(own,Z))].

full_mark(question(4,b,i),1).



