% rules for question 2(c)(ii) higher tier paper 2003

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
 question : Suggest two reasons why Harvey's ideas spread faster
 than Galen's

% full mark is 2
-----------------------------------------------------------------*/
% equivalence class 1
%[more widespread travel/communication in Harvey's time]

%1.	communications/media and travel were/would have been (much/more/much more) improved/developed/greater/modern/widespread
question(2,c,ii): rule(1,1,1)::complete ==>[c(np:[stem=C]):member(C,[communication,media]),
					    (_/',';_/'CC'),
					    c(np:[stem=T]):member(T,[travel,transport,transportation]),
					    ?(c(vg:[pol=pos,stem=be])),
					    ?(w(F):member(F,[much,more])),
					    ?(w(more)),
					    w(W):member(W,[improved,developed,greater,modern,widespread])].

%2.	communications/media were/had/would have been (much/more/much more) improved/developed/greater/flourished/modern/widespread (more)
question(2,c,ii): rule(1,2,1)::complete ==>[c(np:[stem=C]):member(C,[communication,media,travel,transport]),?(c(vg:[pol=pos,stem=be])),?(w(F):member(F,[much,more])),?(w(more)),w(W):member(W,[improved,developed,greater,modern,widespread,better,flourished,advanced])].


question(2,c,ii): rule(1,'2_1',1)::complete ==>
    [c(np:[stem=C]):member(C,[communication,media,travel,transport]),
     ?(c(vg:[pol=pos,stem=be])),
     c(vg:[pol=pos,stem=W]):member(W,[improve,develop,flourish,advance])
    ].

%3.	(much/more) improved/developed/greater/modern (forms/means of ) communication(s)
question(2,c,ii): rule(1,3,1)::complete ==>[w(W):member(W,[improved,developed,greater,modern,widespread]),c(np:[stem=F]):member(F,[form,means,way,method]),?(w(of)),c(np:[stem=communication])].

%4.	better/more/More (developed/advanced) (forms/means of) communications/communication
question(2,c,ii): rule(1,4,1)::complete ==>[w(B):member(B,[better,more,'More','Better']),
					    ?(c(np:[stem=F]):member(F,[form,means,way,method])),
					    ?(_/_),
					    c(np:[stem=communication])].


% but `better comms' etc will be parsed as an NP:

question(2,c,ii): rule(1,'4_1',1)::complete ==>[
					    c(np:[stem=S,mods=M]):(member(S,[communication,travel]),
								   member(X,[better,faster,more,
									     'Better','Faster','More']),
								   member(X,M))
					       ].
					    
%5.	communication/Communication (technology) (between scientists, through books &/and conventions and letters,) had improved/was/were (much) more advanced/widespread/developed/advanced/greater/modern/better/easier
%6.	Communication(s) (technology/links) (between scientists) was/were faster and better developed
%7.	Communication(s) (such as post/X) (technology/links) (between scientists) was faster /(which?) improved/easier/quicker/advanced/much
%8.	Communication(s) (such as post/X) (technology/links) (between scientists) was/were better/more developed/(more modern)

% these two originally began with a disjunction. But this is not allowed,
% in the interests of efficiency (see `find_left_anchor' in pattern_chart.pl)

question(2,c,ii): rule(1,5,1)::complete ==>
      [c(np:[stem=communication]),
        ?(w(such)),?(w(as)),
       ?(c(np:[stem=_X])),
       ?(w(between)),
       ?(c(np:[stem=scientist])),
       ?((_/',';_/'CC')),
       ?(_/'IN'),
       ?(c(np:[stem=S]):member(S,[book,convention,letter])),
       ?((_/',';_/'CC')),
       ?(c(np:[stem=K]):member(K,[book,convention,letter])),
       ?((_/',';_/'CC')),
       ?(c(np:[stem=H]):member(H,[book,convention,letter])),
       ?(_/'WDT'),c(vg:[stem=O,pol=pos]):member(O,[improve,modernize,develop,advance,widespread,great,modern,good,easy,fast,quick])].




question(2,c,ii): rule(1,'5_1',1)::complete ==>
      [	c(np([stem=T,mods=L])):(member(T,[technology,link]),
				member(G,[communication,'Communication',communications,'Communications']),
				member(G,L)),
       ?(w(such)),?(w(as)),
       ?(c(np:[stem=_X])),
       ?(w(between)),
       ?(c(np:[stem=scientist])),
       ?((_/',';_/'CC')),
       ?(_/'IN'),
       ?(c(np:[stem=S]):member(S,[book,convention,letter])),
       ?((_/',';_/'CC')),
       ?(c(np:[stem=K]):member(K,[book,convention,letter])),
       ?((_/',';_/'CC')),
       ?(c(np:[stem=H]):member(H,[book,convention,letter])),
       ?(_/'WDT'),c(vg:[stem=O,pol=pos]):member(O,[improve,modernize,develop,advance,widespread,great,modern,good,easy,fast,quick])].



question(2,c,ii): rule(1,6,1)::complete ==> [(c(np:[stem=communication]);c(np([stem=T,mods=L])):(member(T,[technology,link]),member(G,[communication,'Communication',communications,'Communications']),member(G,L))),?(w(such)),?(w(as)),?(c(np:[stem=_X])),?(w(between)),?(c(np:[stem=scientist])),?((_/',';_/'CC')),?(_/'IN'),?(c(np:[stem=S]):member(S,[book,convention,letter])), ?((_/',';_/'CC')),?(c(np:[stem=K]):member(K,[book,convention,letter])),?((_/',';_/'CC')),?(c(np:[stem=H]):member(H,[book,convention,letter])),c(vg:[stem=O,pol=pos]):member(O,[be]),?(w(much)),?(w(more)),w(J):member(J,[improved,modernized,developed,advanced,widespread,great,greater,modern,good,better,easy,easier,faster,quicker])].

					   
%9.	faster/quicker/greater/easier/modern/widespread/advanced/modernized/improved/good/... (ways/forms/means of) communication/communicating
question(2,c,ii): rule(1,7,1)::complete ==>[w(J):member(J,[improved,modernized,developed,advanced,widespread,great,greater,modern,good,better,easy,easier,faster,quicker]),w(I):member(I,[ways,means,forms,methods]),?(w(of)),w(C):member(C,[communication,communicating])].

% 10.	greater circulation of ideas
question(2,c,ii): rule(1,8,1)::complete ==>[w(J):member(J,[improved,modernized,developed,advanced,widespread,great,greater,modern,good,better,easy,easier,faster,quicker]),w(C):member(C,[circulation,circulating]),?(w(of)),w(I):member(I,[ideas,information,word,work,finding,news,theories])].

%11.	development/ease/speed/greatness/advancement/improvement/modernization of (means/forms/ways of) communication(s)/communicating/circulation of ideas
question(2,c,ii): rule(1,9,1)::complete ==>[c(np:[stem=D]):member(D,[development,ease,speed,greatness,advancement,improvement,modernization]),?(w(of)),?(c(np:[stem=M]):member(M,[means,way,form,method])),?(w(of)),w(C):member(C,[communication,communicating,circulation])].

%12.	there were/was way(s)/means/forms of communication(s)
%16.	more way(s)/means/forms of/to communicate/communication/media/spreading news/ideas/information
question(2,c,ii): rule(1,10,1)::complete ==>[c(np:[stem=W]):member(W,[means,form,way,method]),w(O):member(O,[of,to]),w(C):member(C,[communication,communicating,circulation,communicate,media])].

question(2,c,ii): rule(1,11,1)::complete ==>[c(np:[stem=W]):member(W,[means,form,way,method]),w(O):member(O,[of,to]),w(C):member(C,[spreading,spread,travelling,travel]),c(np:[stem=E]):member(E,[news,idea,finding,work,information,theory,word])].

% 14.	tell people about it via newspapers, magazines
question(2,c,ii): rule(1,12,1)::complete ==>[c(vg:[pol=pos,stem=T]):member(T,[tell,inform]),c(np:[stem=W]):member(W,[world,people,scientist]),?(w(about)),?(_/'PRP'),w(U):member(U,[via,through,using]),c(np:[stem=F]):member(F,[newspaper,magazine,media])].

%15.	more media focus
question(2,c,ii): rule(1,13,1)::complete ==>[w(more),w(M):member(M,[news,media])]. 

%17.	Information/ideas/news spread/travelled faster/quicker
%27.	news/newsprints/ideas/information (to) travel/travelled/spread/were made (across) faster/quicker/better/easier
question(2,c,ii): rule(1,14,1)::complete ==>[c(np:[stem=I]):member(I,[information,idea,news,work,finding,newsprint,theory,word]),c(vg:[pol=pos,stem=S]):member(S,[spread,travel,make]),?(w(across)),w(F):member(F,[faster,quicker])]. 


%26.	Newspapers/Magazines/Newsprints were (more) widely available
question(2,c,ii): rule(1,15,1)::complete ==>[c(np:[stem=N]):member(N,[newspaper,magazine,newsprint]),c(vg:[stem=be]),?(w(much)),?(w(more)),?(w(W):member(W,[widely])),w(U):member(U,[available])].

question(2,c,ii): rule(1,16,1)::complete ==>[c(np:[stem=N]):member(N,[newspaper,magazine,newsprint]),c(vg:[stem=W]):member(W,[available])].

%28.	faster/quicker/better/easier methods/ways/forms/means of/to transport/transporting/spread/spreading news/ideas/information
question(2,c,ii): rule(1,17,1)::complete ==> [c(np:[stem=M]):member(M,[method,way,form,means]),w(O):member(O,[of,to]),w(T):member(T,[transport,transporting,spread,spreading]),?(w(of)),w(A):member(A,[news,ideas,work,findings,information,theories,words,word])].

%29.	news/News/information/ideas could have spread by people being told in the (local) newspapers/magazines/newsprints
question(2,c,ii): rule(1,18,1)::complete ==> [c(np:[stem=N]):member(N,[news,information,idea,work,finding,theory,word]),c(vg:[stem=S]):member(S,[spread,travel]),?(w(by)),c(np:[stem=P]):member(P,[people,men,women]),c(vg:[pol=pos,stem=T]):member(T,[tell]),_/'IN',c(np:[stem=X]):member(X,[newspaper,magazine,newsprint])].

%30.	newspapers and books (which) would reach (many) (more) people
question(2,c,ii): rule(1,19,1)::complete ==>[c(np:[stem=N]):member(N,[newspaper,book,magazine,newsprint]),(_/',';_/'CC'),c(np:[stem=Y]):member(Y,[newspaper,book,magazine,newsprint]),?(_/'WDT'),c(vg:[pol=pos,stem=R]):member(R,[reach]),c(np:[stem=people])].																								       
%31.	send his papers and ideas to other parts of the world (much) faster/easier/quicker/better

question(2,c,ii): rule(1,20,1)::complete ==> [c(vg:[pol=pos,stem=F]):member(F,[send]),c(np:[stem=O]):member(O,[paper,idea,finding,work,theory,word]),(_/',';_/'CC'),c(np:[stem=L]):member(L,[paper,idea,finding,work,theory,word]),?(_/'IN'),?(c(np:[stem=P]):member(P,[part])),?(w(of)),c(np:[stem=world]),?(w(much)),w(Q):member(Q,[quicker,faster,better,easier])].

%32.	more means/ways/forms with which to get in touch/communicate with people
question(2,c,ii): rule(1,21,1)::complete ==> [c(np:[stem=W]):member(W,[means,way,form]),?(_/'IN'),?(_/'WDT'),c(vg:[pol=pos,stem=L]):member(L,[get,communicate]),?(_/'IN'),?(w(touch))].

%13.	communications methods were not (as) good/were less improved in Galen's times
%24.	communications may have been less advanced, in Galen's time

question(2,c,ii): rule(1,22,1)::complete ==>
          [c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),
				   member(G,[communication,communications]),
				   member(G,L)),

	   c(vg:[pol=neg,stem=J]):member(J,[good,quick,fast,improved,flourished,
					    widespread,modernized,developed,advanced,
					    great,greater,modern,better,easy,easier,faster,quicker]),
	   ?(_/','),_/'IN',
	   c(np:[stem=Z]):member(Z,['Galen',galen])].



question(2,c,ii): rule(1,'22_1',1)::complete ==>
          [c(np:[stem=communication]),
	   c(vg:[pol=neg,stem=J]):member(J,[good,quick,fast,improved,flourished,
					    widespread,modernized,developed,advanced,
					    great,greater,modern,better,easy,easier,faster,quicker]),
	   ?(_/','),_/'IN',
	   c(np:[stem=Z]):member(Z,['Galen',galen])].

question(2,c,ii): rule(1,23,1)::complete ==>
           [c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),
				    member(G,[communication,communications]),
				    member(G,L)),
	   
	    c(vg:[pol=neg,stem=J]):member(J,[be]),
	    ?(w(X):member(X,[as,much])),
	    w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,
			   developed,advanced,great,greater,modern,better,easy,easier,faster,quicker]),
	    ?(_/','),_/'IN',
	    c(np:[stem=Z]):member(Z,['Galen',galen])].



question(2,c,ii): rule(1,'23_1',1)::complete ==>
           [ c(np:[stem=communication]),
	    c(vg:[pol=neg,stem=J]):member(J,[be]),
	    ?(w(X):member(X,[as,much])),
	    w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,
			   developed,advanced,great,greater,modern,better,easy,easier,faster,quicker]),
	    ?(_/','),_/'IN',
	    c(np:[stem=Z]):member(Z,['Galen',galen])].


question(2,c,ii): rule(1,24,1)::complete ==>
             [c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),
				      member(G,[communication,communications]),member(G,L)),
	      c(vg:[pol=pol,stem=J]):member(J,[be]),
	      w(B):member(B,[less,'Less']),
	      w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,
			     developed,advanced,great,modern,easy]),
	      ?(_/','),_/'IN',
	      c(np:[stem=Z]):member(Z,['Galen',galen])].



question(2,c,ii): rule(1,'24_1',1)::complete ==>
             [c(np:[stem=communication]),
	      c(vg:[pol=pol,stem=J]):member(J,[be]),
	      w(B):member(B,[less,'Less']),
	      w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,
			     developed,advanced,great,modern,easy]),
	      ?(_/','),_/'IN',
	      c(np:[stem=Z]):member(Z,['Galen',galen])].

%18.	in Galen's time, communications methods were not (as) good
%21.	In Galen's time, communications may have been less advanced
question(2,c,ii): rule(1,25,1)::complete ==>[c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','),(c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),member(G,[communication,communications]),member(G,L));c(np:[stem=communication])),c(vg:[pol=pol,stem=J]):member(J,[be]), w(B):member(B,[less,'Less']),w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,developed,advanced,great,modern,easy])].

question(2,c,ii): rule(1,26,1)::complete ==> [c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','),(c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),member(G,[communication,communications]),member(G,L));c(np:[stem=communication])),c(vg:[pol=neg,stem=J]):member(J,[be]),?(w(X):member(X,[as,much])),w(U):member(U,[good,quick,fast,improved,flourished,widespread,modernized,developed,advanced,great,greater,modern,better,easy,easier,faster,quicker])].

question(2,c,ii): rule(1,27,1)::complete ==> [c(np:[stem='Galen']),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','),(c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),member(G,[communication,communications]),member(G,L));c(np:[stem=communication])),c(vg:[pol=neg,stem=J]):member(J,[good,quick,fast,improved,flourished,widespread,modernized,developed,advanced,great,greater,modern,better,easy,easier,faster,quicker])].

%19.	In Galen's time, communications may have been much slower and less advanced
%20.	In Galen's time, communications may have been much slower
question(2,c,ii): rule(1,28,1)::complete ==> [c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','), (c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),member(G,[communication,communications]),member(G,L));c(np:[stem=communication])), c(vg:[stem=S]):member(S,[slow])].

%22.	communications may have been much slower and less advanced, in Galen's time
question(2,c,ii): rule(1,29,1)::complete ==>
       [c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),
				member(G,[communication,communications]),member(G,L)),
	c(vg:[pol=pos,stem=be]),c(vg:[pol=pos,stem=S]):member(S,[slow]),(_/',';_/'CC'),w(L):member(L,['Less',less]), w(Z):member(Z,[good,quick,fast,improved,flourished,widespread,modernized,developed,advanced,great,modern,easy]),?(_/','),c(np:[stem=X]):member(X,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times])].


question(2,c,ii): rule(1,'29_1',1)::complete ==>
       [c(np:[stem=communication]),
	c(vg:[pol=pos,stem=be]),c(vg:[pol=pos,stem=S]):member(S,[slow]),(_/',';_/'CC'),w(L):member(L,['Less',less]), w(Z):member(Z,[good,quick,fast,improved,flourished,widespread,modernized,developed,advanced,great,modern,easy]),?(_/','),c(np:[stem=X]):member(X,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times])].

%23.	communications may have been much slower, in Galen's time
question(2,c,ii): rule(1,30,1)::complete ==> [c(np:[stem=M,mods=L]):(member(M,[method,way,means,form]),member(G,[communication,communications]),member(G,L)),c(vg:[pol=pos,stem=be]),c(vg:[pol=pos,stem=S]):member(S,[slow]),?(_/','),c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times])].



%23.	communications may have been much slower, in Galen's time
question(2,c,ii): rule(1,'30_1',1)::complete ==> [c(np:[stem=communication]),c(vg:[pol=pos,stem=be]),c(vg:[pol=pos,stem=S]):member(S,[slow]),?(_/','),c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times])].

%25.	Galen lived in a time where/when news didn't spread quickly/fast because of limitations in technology
question(2,c,ii): rule(1,31,1)::complete ==> [c(np:[stem=Z]):member(Z,['Galen',galen]),c(vg:[pol=pos,stem=L]):member(L,[live]),?(_/'IN'),c(np:[stem=T]):member(T,[time,times]),_/'WRB',c(np:[stem=N]):member(N,[news,idea,finding,work,information,theory,word]),c(vg:[pol=neg,stem=S]):member(S,[spread,travel]),w(Q):member(Q,[quickly,fast])].

% Galen lived in a time where technology is limited (limitations of technology)
question(2,c,ii): rule(1,32,1)::complete ==> [c(np:[stem=Z]):member(Z,['Galen',galen]),c(vg:[pol=pos,stem=L]):member(L,[live]),?(_/'IN'),c(np:[stem=T]):member(T,[time,times]),_/'WRB',c(np:[stem=X]):member(X,[technology,communication,circulation]),?(w(of)),?(w(U):member(U,[ideas,work,findings,information,news,word,words,theories,theory])),c(vg:[pol=pos,stem=A]):member(A,[restrict,limit])].

% In Galen's time, ....
question(2,c,ii): rule(1,33,1)::complete ==> [c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','), c(np:[stem=N]):member(N,[news,idea,work,finding,information,word,theory]),c(vg:[pol=neg,stem=S]):member(S,[spread,travel]),w(Q):member(Q,[quickly,fast])].

question(2,c,ii): rule(1,34,1)::complete ==> [c(np:[stem=X]):member(X,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/','), c(np:[stem=Z]):member(Z,[technology,communication,circulation]),?(w(of)),?(w(U):member(U,[ideas,work,findings,information,news,theories,theory,word,words])),c(vg:[pol=pos,stem=A]):member(A,[restrict,limit])].

% limitations of technology


%33.	people travelled/were able to travel
question(2,c,ii): rule(1,35,1)::complete ==> [c(np:[stem=people]),?(c(vg:[pol=pos,stem=A]):member(A,[able,capable])),c(vg:[pol=pos,stem=travel])].

%34.	travel easier/quicker/faster
question(2,c,ii): rule(1,36,1)::complete ==>[w(travel),w(E):member(E,[easier,quicker,faster])].

%35.	transport/transportation (carrying his ideas) has/had improved/[got around/were faster]/were faster/get better/more advanced/more
%36. travel/transport/transportation were/would have/had been (much/more/much more) improved/developed/greater/modern/widespread

question(2,c,ii): rule(1,37,1)::complete ==>[w(T):member(T,[transport,transportation,carrying]),?(c(np:[stem=X]):member(X,[idea,theory,word,work,finding])),c(vg:[pol=pos,stem=I]):member(I,[improve,faster,better,good,fast,more,advanced,developed,widespread,quick,quicker,modernized,great,easy,easier,modern,greater,advance])].

question(2,c,ii): rule(1,38,1)::complete ==>[w(T):member(T,[transport,transportation,carrying,travel]),?(c(np:[stem=X]):member(X,[idea,theory,word,work,finding])),c(vg:[pol=pos,stem=I]):member(I,[be,get]),?(w(A):member(A,[around,across])),?(w(much)),?(w(more)),w(U):member(U,[improved,faster,better,good,fast,more,advanced,developed,widespread,quick,quicker,modernized,great,easy,easier,modern,greater])].

					     
%37.	improved/developed/faster/advanced/quicker/better/more/widespread/more widespread (means of) transport/transporation/travel
%38.	better/more/More (developed/advanced) (forms/means of) travel/transport/transportation
question(2,c,ii): rule(1,39,1)::complete ==>[w(I): member(I,[improve,faster,better,good,fast,more,advanced,developed,widespread,quick,quicker,modernized,great,easy,easier,modern,greater,advance]),?(c(np:[stem=X]):member(X,[means,way,form])),?(w(of)),w(T):member(T,[transport,transportation,carrying,travel,travelling])].

%39.	opportunity for Harvey to travel
question(2,c,ii): rule(1,40,1)::complete ==>[c(np:[stem=H]):member(H,['Harvey',harvey]),c(vg:[pol=pos,stem=T]):member(T,[travel])].

% equivalence class 2

%[information published]
question(2,c,ii): rule(2,1,1)::complete ==> [c(np:[stem=I]):member(I,[information,idea,theory,word,work,finding]),c(vg:[pol=pos,stem=publish])].

%1.	published/wrote (down/up)/produced/used (in/in the form of) books/a book/(a) (widely-distributed/science) (J)journal(s)/article(s) 
%3.	wrote/spread it/them (down/up) (more easily) in/through (a) book(s)/pamphlet(s)
question(2,c,ii): rule(2,2,1)::complete ==> [c(vg:[pol=pos,stem=L]):member(L,[publish,write,produce,use,spread]),?(_/'PRP'),?(_/'IN'),?(w(more)),?(w(easily)),?(_/'IN'),?(c(np:[stem=form])),?(w(of)),?(w(W):member(W,[widely,'widely-distributed'])),?(w(D):member(D,[distributed])),?(w(S):member(S,[science,'Science'])),c(np:[stem=B]):member(B,[book,journal,article,pamphlet])].

%2.	published/wrote/publishing/publish/print (down/up) (about/of) (all) (his) ideas/theories/theory/work/them/findings/information
question(2,c,ii): rule(2,3,1)::complete ==> [c(vg:[pol=pos,stem=L]):member(L,[publish,write,produce,use,print]),?(w(A):member(A,[about,of])),?(w(all)),c(np:[stem=O]):member(O,[idea,theory,work,them,finding,information])].



%4.	ideas/work/theories/they/it to be/could be/were/got  published/printed/written (down)
%6.	journals &/and ideas could be submitted/printed/used/printed/written
question(2,c,ii): rule(2,4,1)::complete ==> [c(np:[stem=O]):member(O,[idea,theory,work,they,finding,information,it,journal]),?((_/',';_/'CC')),c(np:[stem=M]):member(M,[idea,theory,work,they,finding,information,it,journal]),c(vg:[pol=pos,stem=L]):member(L,[publish,write,produce,use,print,submit])].

%5.	More/by publication(s) (of his theories)
question(2,c,ii): rule(2,5,1)::complete ==> [w(M):member(M,[more,by,'More','By']),w(P):member(P,[publication,publications])].

%7.	could have been/were published
%8.	Had publishing so newspapers could report his ideas
question(2,c,ii): rule(2,6,1)::complete ==> [c(vg:[stem=I,pol=pos]):member(I,[publish,print])].

%11.	printing press was/had been invented (so his theories could be made known in that way)
%12.	(his theories could be made known by ) the printing press

question(2,c,ii): rule(2,7,1)::complete ==> [w(printing),w(P):member(P,[press,media,machines])].

%9.	Galen's time(s)/Galen lived/was around in the Roman times and they could not publish journals or books like they could in Harvey's time
question(2,c,ii): rule(2,8,1)::complete ==>[c(np:[stem=G]):member(G,['Galen',galen]),c(vg:[pol=pos,stem=L]):member(L,[live,be]),?(w(around)),_/'IN',c(np:[stem=T]):member(T,[time,times]),?((_/',';_/'CC')), ?(_/'PRP'),c(vg:[pol=neg,stem=P]):member(P,[print,publish])].

question(2,c,ii): rule(2,9,1)::complete ==>[c(vg:[pol=neg,stem=P]):member(P,[print,publish]),?(_/','),?(_/'IN'),c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times])].

question(2,c,ii): rule(2,10,1)::complete ==>[c(np:[stem=Z]):member(Z,['Galen',galen]),_/'POS',c(np:[stem=V]):member(V,[time,times]),?(_/'PRP'),c(vg:[pol=neg,stem=P]):member(P,[print,publish])].
					    
%10.	Galen was around before there were medical journals published
question(2,c,ii): rule(2,8,1)::complete ==>[c(np:[stem=G]):member(G,['Galen',galen]),c(vg:[pol=pos,stem=L]):member(L,[live,be]),?(w(around)),w(B):member(B,[before,prior]), w(there),w(were),?(w(M):member(M,[medical,science])),w(J):member(J,[journal,journals,magazines,pamphlets,publications,publication])].

% equivalence class 3

%[more books/papers  produced]

question(2,c,ii): rule(3,1,1)::complete ==> [w(more),w(B):member(B,[books,papers,journals])].

%1.	communication between scientists, through books & conventions and letters, had improved/was more advanced
question(2,c,ii): rule(3,2,1)::complete ==> [c(np:[stem=B]):member(B,[book,convention,letter,paper,journal]),?((_/',';_/'CC')),c(np:[stem=U]):member(U,[book,convention,letter,paper,journal]),?((_/',';_/'CC')),?(c(np:[stem=X]):member(X,[book,convention,letter,paper,journal])),?(_/','),c(vg:[pol=pos,stem=W]):member(W,[improved,developed,greater,modern,widespread,better,flourished,advanced])].

question(2,c,ii): rule(3,3,1)::complete ==> [c(np:[stem=B]):member(B,[book,convention,letter,paper,journal]),?((_/',';_/'CC')),c(np:[stem=U]):member(U,[book,convention,letter,paper,journal]),?((_/',';_/'CC')),?(c(np:[stem=X]):member(X,[book,convention,letter,paper,journal])),?(_/','),c(vg:[pol=pos,stem=be]),?(w(much)),?(w(more)),w(W):member(W,[improved,developed,greater,modern,widespread,better,flourished,advanced])].

%2.	 more (scientific/established) journals/papers/books
question(2,c,ii): rule(3,4,1)::complete ==> [w(M):member(M,[more,development,developed,advanced,widespread]),?(w(of)),?(w(I):member(I,[scientific,established,medical])), w(Q):member(Q,[book,convention,letter,paper,journal])].

%3.	development/more of (his) books
question(2,c,ii): rule(3,5,1)::complete ==> [w(M):member(M,[more,'More',development,'Development',developed,advanced,widespread]),?(w(of)),c(np:[stem=Q]):member(Q,[book,convention,letter,paper,journal])].


%5.	word was spread quicker in books
question(2,c,ii): rule(3,6,1)::complete ==>[c(np:[stem=W]):member(W,[word,information,news,idea,theory]),c(vg:[pol=pos,stem=S]):member(S,[spread,travel]),w(Q):member(Q,[quicker,faster,easier]),_/'IN',c(np:[stem=B]):member(B,[book,paper,journal])].

% 6,7,8 are included in equivalence class 2
%6.	There were printing press
%7.	printing press was/had been invented (so his theories could be made known in that way)
%8.	New printing machines


%9.	Harvey's/his books were spread across the world
question(2,c,ii): rule(3,7,1)::complete ==> [c(np:[stem=B]):member(B,[book,paper,article]),c(vg:[pol=pos,stem=S]):member(S,[spread,travel]),_/'IN',c(np:[stem=world])].

%4.	Galen existed/lived/was around   around 100 years earlier when books were not made/produced/printed/published
question(2,c,ii): rule(3,8,1)::complete ==>[c(np:[stem=Z]):member(Z,['Galen',galen]),c(vg:[pol=pos,stem=E]):member(E,[exist,live,be]),?(w(around)),?(w(around)),?(c(np:[stem=year])),w(J):member(J,[earlier,before]),(_/',';(_/'WRB';_/'CC')),c(np:[stem=book]),c(vg:[pol=neg,stem=P]):member(P,[make,produce,print,publish])].


%Galen existed/lived/was around   around 100 years earlier when books were difficult to make/produce/print/publish
question(2,c,ii): rule(3,8,1)::complete ==>[c(np:[stem=Z]):member(Z,['Galen',galen]),c(vg:[pol=pos,stem=E]):member(E,[exist,live,be]),?(w(around)),?(w(around)),?(c(np:[stem=year])),w(J):member(J,[earlier,before]),(_/',';(_/'WRB';_/'CC')),c(np:[stem=book]),c(vg:[pol=pos,stem=D]):member(D,[difficult,hard,impossible]),c(vg:[pol=pos,stem=P]):member(P,[make,produce,print,publish])].

%Galen existed/lived/was around   around 100 years earlier when books were difficult to make/produce/print/publish
question(2,c,ii): rule(3,8,1)::complete ==>[c(np:[stem=Z]):member(Z,['Galen',galen]),c(vg:[pol=pos,stem=E]):member(E,[exist,live,be]),?(w(around)),?(w(around)),?(c(np:[stem=year])),w(J):member(J,[earlier,before]),(_/',';(_/'WRB';_/'CC')),c(np:[stem=book]),c(vg:[pol=pos,stem=be]),?(w(much)),?(w(more)),w(D):member(D,[difficult,hard,impossible]),c(vg:[pol=pos,stem=P]):member(P,[make,produce,print,publish])].
% equivalence class 4

%[more people could read]

%1.	more educated/literate people
question(2,c,ii): rule(4,1,1)::complete ==>[w(more),w(U):member(U,[educated,literate])].

%2.	more people were educated/literate/could read
question(2,c,ii): rule(4,2,1)::complete ==>[c(np:[stem=P,mods=L]):(member(P,[people,men,women]),member(more,L)),c(vg:[pol=pos,stem=O]):member(O,[educate,literate,read])].

% equivalence class 5
%[more universities]

%1.	more/big/large/Established university/University/universities (lectures)
question(2,c,ii): rule(5,1,1)::complete ==> [c(np:[stem=U,mods=L]):(member(U,[university,lecture]),member(G,[more,big,large,established,'More','Big','Large','Established']),member(G,L))].

%2.	more/larger (established) community/ies of scientists
question(2,c,ii): rule(5,2,1)::complete ==> [c(np:[stem=U,mods=L]):(member(U,[community]),member(G,[more,big,large,established,'More','Big','Large','Established']),member(G,L)),w(of),c(np:[stem=S]):member(S,[scientist,science,doctor,biologist])].
%3.	more/larger (established) scientific/medical community/ies 
question(2,c,ii): rule(5,3,1)::complete ==> [c(np:[stem=U,mods=L]):(member(U,[community]),member(G,[more,big,large,established,'More','Big','Large','Established',scientific,medical]),member(G,L))].

full_mark(question(2,c,ii),2).
