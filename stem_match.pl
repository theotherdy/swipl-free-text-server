% adapted from stem_match_orig.pl

% stem_match(+Inflected,-Stem,?Tag).

stem_match(be, be, A) :-
        lists:member(A, ['VB','VBP']).
stem_match(am, be, 'VBP').
stem_match('\'m', be, 'VBP').
stem_match(are, be, 'VBP').
stem_match('\'re', be, 'VBP').
stem_match(were, be, 'VBD').
stem_match(was, be, 'VBD').
stem_match(being, be, 'VBG').
stem_match(been, be, 'VBN').
stem_match(is, be, 'VBZ').
stem_match('\'s', be, 'VBZ').
stem_match(do, do, A) :-
        lists:member(A, ['VB','VBP']).
stem_match(did, do, 'VBD').
stem_match(doing, do, 'VBG').
stem_match(does, do, 'VBZ').
stem_match(have, have, A) :-
        lists:member(A, ['VB','VBP']).
stem_match('\'ve', have, A) :-
        lists:member(A, ['VB','VBP']).
stem_match('\'ave', have, A) :-
        lists:member(A, ['VB','VBP']).
stem_match(having, have, 'VBG').
stem_match(has, have, 'VBZ').
stem_match('\'s', have, 'VBZ').
stem_match(wo, will, 'MD').
stem_match(sha, shall, 'MD').
stem_match('\'ll', will, 'MD').
stem_match('\'d', would, 'MD').
stem_match(ca, can, 'MD').
stem_match(whose, who, 'WP$').
stem_match(whom, who, 'WP').
stem_match(i, 'I', 'PRP').
stem_match(we, we, 'PRP').
stem_match(me, 'I', 'PRP').
stem_match(us, we, 'PRP').
stem_match('\'s', we, 'PRP').
stem_match(you, you, 'PRP').
stem_match(y, you, 'PRP').
stem_match(ya, you, 'PRP').
stem_match(it, it, 'PRP').
stem_match(he, he, 'PRP').
stem_match('\'e', he, 'PRP').
stem_match(she, she, 'PRP').
stem_match(they, they, 'PRP').
stem_match(him, he, 'PRP').
stem_match('\'im', he, 'PRP').
stem_match(her, she, 'PRP').
stem_match('\'er', she, 'PRP').
stem_match(them, they, 'PRP').
stem_match('\'em', they, 'PRP').
stem_match(my, 'I', 'PRP$').
stem_match(mine, 'I', 'PRP').
stem_match(your, you, 'PRP').
stem_match(yer, you, 'PRP').
stem_match(his, he, 'PRP').
stem_match('\'is', he, 'PRP').
stem_match(her, she, 'PRP').
stem_match(its, it, 'PRP').
stem_match(our, we, 'PRP').
stem_match(their, they, 'PRP').
stem_match(yours, you, 'PRP').
stem_match(his, he, 'PRP').
stem_match(hers, she, 'PRP').
stem_match(ours, we, 'PRP').
stem_match(theirs, they, 'PRP').
stem_match('n\'t', not, 'RB').
stem_match(belies, belie, 'VBZ').
stem_match('kicks-off', 'kick-off', 'VBZ').
stem_match(teacheth, teach, 'VBZ').
stem_match(dieth, die, 'VBZ').
stem_match(maketh, make, 'VBZ').
stem_match(smelleth, smell, 'VBZ').
stem_match(tilleth, till, 'VBZ').
stem_match(cometh, come, 'VBZ').
stem_match(containeth, contain, 'VBZ').
stem_match(runneth, run, 'VBZ').
stem_match(witnesseth, witness, 'VBZ').
stem_match(sitteth, sit, 'VBZ').
stem_match(giveth, give, 'VBZ').
stem_match(reneweth, renew, 'VBZ').
stem_match(saith, say, 'VBZ').
stem_match(goes, go, 'VBZ').
stem_match(foregoes, forego, 'VBZ').
stem_match(undergoes, undergo, 'VBZ').
stem_match(echoes, echo, 'VBZ').
stem_match(focuses, focus, 'VBZ').
stem_match(focusses, focus, 'VBZ').
stem_match(buzzes, buzz, 'VBZ').
stem_match('re-made', 're-make', 'VBD').
stem_match(camest, come, 'VBD').
stem_match(dove, dive, 'VBD').
stem_match(forgave, forgive, 'VBD').
stem_match(traveled, travel, 'VBD').
stem_match(slain, slay, 'VBN').
stem_match('re-made', ' re-make', 'VBN').
stem_match(come, come, 'VBN').
stem_match(become, become, 'VBN').
stem_match(overcome, overcome, 'VBN').
stem_match(undone, undo, 'VBN').
stem_match(overdone, overdo, 'VBN').
stem_match(gone, go, 'VBN').
stem_match(foregone, forego, 'VBN').
stem_match(undergone, undergo, 'VBN').
stem_match(borne, bear, 'VBN').
stem_match(laden, load, 'VBN').
stem_match(bidden, bid, 'VBN').
stem_match(forbidden, forbid, 'VBN').
stem_match(hidden, hide, 'VBN').
stem_match(ridden, ride, 'VBN').
stem_match(trodden, tread, 'VBN').
stem_match(seen, see, 'VBN').
stem_match(foreseen, foresee, 'VBN').
stem_match(shaken, shake, 'VBN').
stem_match(forsaken, forsake, 'VBN').
stem_match(taken, take, 'VBN').
stem_match(betaken, betake, 'VBN').
stem_match(undertaken, undertake, 'VBN').
stem_match(overtaken, overtake, 'VBN').
stem_match(mistaken, mistake, 'VBN').
stem_match(spoken, speak, 'VBN').
stem_match(broken, break, 'VBN').
stem_match(woken, wake, 'VBN').
stem_match(awoken, awake, 'VBN').
stem_match(fallen, fall, 'VBN').
stem_match(befallen, befall, 'VBN').
stem_match(swollen, swell, 'VBN').
stem_match(stolen, steal, 'VBN').
stem_match(risen, rise, 'VBN').
stem_match(arisen, arise, 'VBN').
stem_match(chosen, choose, 'VBN').
stem_match(eaten, eat, 'VBN').
stem_match(beaten, beat, 'VBN').
stem_match(smitten, smite, 'VBN').
stem_match(written, write, 'VBN').
stem_match('under-written', 'under-write', 'VBN').
stem_match(rewritten, rewrite, 'VBN').
stem_match(forgotten, forget, 'VBN').
stem_match(given, give, 'VBN').
stem_match(forgiven, forgive, 'VBN').
stem_match(driven, drive, 'VBN').
stem_match(striven, strive, 'VBN').
stem_match(proven, prove, 'VBN').
stem_match(woven, weave, 'VBN').
stem_match(frozen, freeze, 'VBN').
stem_match(lain, lie, 'VBN').
stem_match(born, bear, 'VBN').
stem_match(shorn, shear, 'VBN').
stem_match(torn, tear, 'VBN').
stem_match(worn, wear, 'VBN').
stem_match(sworn, swear, 'VBN').
stem_match(begun, begin, 'VBN').
stem_match(run, run, 'VBN').
stem_match(overrun, overrun, 'VBN').
stem_match(swear, swear, 'VBN').
stem_match(bereft, bereave, 'VBN').
stem_match('*camest', come, 'VBN').
stem_match(flown, fly, 'VBN').
stem_match(destroyed, destroy, 'VBN').
stem_match(displayed, display, 'VBN').
stem_match(enjoyed, enjoy, 'VBN').
stem_match(born, born, 'VBN').
stem_match(delayed, delay, 'VBN').
stem_match(employed, employ, 'VBN').
stem_match(gotten, get, 'VBN').
stem_match(played, play, 'VBN').
stem_match(cosseting, cosset, 'VBG').
stem_match('a-calling', 'a-call', 'VBG').
stem_match(recalling, recall, 'VBG').
stem_match(installing, install, 'VBG').
stem_match(reselling, resell, 'VBG').
stem_match(retelling, retell, 'VBG').
stem_match(strolling, stroll, 'VBG').
stem_match(gassing, gas, 'VBG').
stem_match(canvassing, canvas, 'VBG').
stem_match(adding, add, 'VBG').
stem_match(boycotting, boycott, 'VBG').
stem_match(butting, butt, 'VBG').
stem_match(changing, change, 'VBG').
stem_match(exchanging, exchange, 'VBG').
stem_match(ranging, range, 'VBG').
stem_match(arranging, arrange, 'VBG').
stem_match(challenging, challenge, 'VBG').
stem_match(cringing, cringe, 'VBG').
stem_match(fringing, fringe, 'VBG').
stem_match(plunging, plunge, 'VBG').
stem_match(lounging, lounge, 'VBG').
stem_match(smoothing, smooth, 'VBG').
stem_match(frothing, froth, 'VBG').
stem_match(mouthing, mouth, 'VBG').
stem_match(paralleling, parallel, 'VBG').
stem_match(intervening, intervene, 'VBG').
stem_match(contravening, contravene, 'VBG').
stem_match(phoning, phone, 'VBG').
stem_match(telephoning, telephone, 'VBG').
stem_match(interfering, interfere, 'VBG').
stem_match(adhering, adhere, 'VBG').
stem_match(biting, bite, 'VBG').
stem_match(citing, cite, 'VBG').
stem_match(reciting, recite, 'VBG').
stem_match(inciting, incite, 'VBG').
stem_match(smiting, smite, 'VBG').
stem_match(igniting, ignite, 'VBG').
stem_match(uniting, unite, 'VBG').
stem_match(writing, write, 'VBG').
stem_match(inviting, invite, 'VBG').
stem_match(owing, owe, 'VBG').
stem_match('a-dying', 'a-die', 'VBG').
stem_match(underlying, underlie, 'VBG').
stem_match(overlying, overlie, 'VBG').
stem_match(gossiping, gossip, 'VBG').
stem_match(developing, develop, 'VBG').
stem_match(enveloping, envelop, 'VBG').
stem_match(galloping, gallop, 'VBG').
stem_match(anchoring, anchor, 'VBG').
stem_match(sponsoring, sponsor, 'VBG').
stem_match(tutoring, tutor, 'VBG').
stem_match(murmuring, murmur, 'VBG').
stem_match(combating, combat, 'VBG').
stem_match(interpreting, interpret, 'VBG').
stem_match(riveting, rivet, 'VBG').
stem_match('ski-ing', ski, 'VBG').
stem_match(aching, ache, 'VBG').
stem_match(panicking, panic, 'VBG').
stem_match(picnicking, picnic, 'VBG').
stem_match(manoeuvring, manoeuvre, 'VBG').
stem_match(typing, type, 'VBG').
stem_match(permeating, permeate, 'VBG').
stem_match(creating, create, 'VBG').
stem_match(basting, baste, 'VBG').
stem_match(wasting, waste, 'VBG').
stem_match('re-routing', 're-route', 'VBG').
stem_match('whipping-in', 'whip-in', 'VBG').
stem_match('dropping-in', 'drop-in', 'VBG').
stem_match('sitting-in', 'sit-in', 'VBG').
stem_match('drawing-in', 'draw-in', 'VBG').
stem_match('running-in', 'run-in', 'VBG').
stem_match('making-out', 'make-out', 'VBG').
stem_match(whizzing, whizz, 'VBG').
stem_match(focusing, focus, 'VBG').
stem_match(focussing, focus, 'VBG').
stem_match(fuelling, fuel, 'VBG').
stem_match(breathing, breathe, 'VBG').
stem_match(targeting, target, 'VBG').
stem_match(canceling, cancel, 'VBG').
stem_match(centring, centre, 'VBG').
stem_match(chorusing, chorus, 'VBG').
stem_match(monitoring, monitor, 'VBG').
stem_match(tasting, taste, 'VBG').
stem_match(infringing, infringe, 'VBG').
stem_match(siting, site, 'VBG').
stem_match(labeling, label, 'VBG').
stem_match(traveling, travel, 'VBG').
stem_match(axes, axe, 'NNS').
stem_match(bases, base, 'NNS').
stem_match(trousers, trousers, 'NNS').
stem_match(tweezers, tweezers, 'NNS').
stem_match(pyjamas, pyjamas, 'NNS').
stem_match(pajamas, pajamas, 'NNS').
stem_match(jeans, jeans, 'NNS').
stem_match(suspenders, suspenders, 'NNS').
stem_match(binoculars, binoculars, 'NNS').
stem_match(scissors, scissors, 'NNS').
stem_match(cyclamen, cyclamen, 'NNS').
stem_match(headaches, headache, 'NNS').
stem_match(moustaches, moustache, 'NNS').
stem_match(cliches, cliche, 'NNS').
stem_match(riches, riches, 'NNS').
stem_match(species, species, 'NNS').
stem_match(moggies, moggie, 'NNS').
stem_match(mealies, mealie, 'NNS').
stem_match(capercaillies, capercaillie, 'NNS').
stem_match(coolies, coolie, 'NNS').
stem_match(commies, commie, 'NNS').
stem_match(magpies, magpie, 'NNS').
stem_match(diableries, diablerie, 'NNS').
stem_match(series, series, 'NNS').
stem_match('time-series', 'time-series', 'NNS').
stem_match(reveries, reverie, 'NNS').
stem_match(curies, curie, 'NNS').
stem_match(nighties, nightie, 'NNS').
stem_match(sorties, sortie, 'NNS').
stem_match(tatties, tattie, 'NNS').
stem_match(movies, movie, 'NNS').
stem_match(gasses, gas, 'NNS').
stem_match(amoebae, amoeba, 'NNS').
stem_match(aquaria, aquarium, 'NNS').
stem_match(automata, automaton, 'NNS').
stem_match(candelabra, candelabrum, 'NNS').
stem_match(memoranda, memorandum, 'NNS').
stem_match(compendia, compendium, 'NNS').
stem_match(ganglia, ganglion, 'NNS').
stem_match(millenia, millenium, 'NNS').
stem_match(bacteria, bacterium, 'NNS').
stem_match(criteria, criterion, 'NNS').
stem_match(emporia, emporium, 'NNS').
stem_match(crematoria, crematorium, 'NNS').
stem_match(scriptoria, scriptorium, 'NNS').
stem_match(curricula, curriculum, 'NNS').
stem_match(maxima, maximum, 'NNS').
stem_match(minima, minimum, 'NNS').
stem_match(moratoria, moratorium, 'NNS').
stem_match(podia, podium, 'NNS').
stem_match(podia, podium, 'NNS').
stem_match(referenda, referendum, 'NNS').
stem_match(spectra, spectrum, 'NNS').
stem_match(symposia, symposium, 'NNS').
stem_match(ultimata, ultimatum, 'NNS').
stem_match(phenomena, phenomenon, 'NNS').
stem_match(genera, genus, 'NNS').
stem_match(sera, serum, 'NNS').
stem_match(schemata, schema, 'NNS').
stem_match(haematomata, haematoma, 'NNS').
stem_match(strata, stratum, 'NNS').
stem_match(dicta, dictum, 'NNS').
stem_match(algae, alga, 'NNS').
stem_match(minutiae, minutia, 'NNS').
stem_match(nebulae, nebula, 'NNS').
stem_match(vertebrae, vertebra, 'NNS').
stem_match(formulae, formula, 'NNS').
stem_match(cannulae, cannula, 'NNS').
stem_match(indigenae, indigene, 'NNS').
stem_match(retinae, retina, 'NNS').
stem_match('mothers-to-be', 'mother-to-be', 'NNS').
stem_match('grandmothers-to-be', 'grandmother-to-be', 'NNS').
stem_match(lice, louse, 'NNS').
stem_match('wood-lice', 'wood-louse', 'NNS').
stem_match(police, police, 'NNS').
stem_match(belongings, belongings, 'NNS').
stem_match('state-police', 'state-police', 'NNS').
stem_match(mice, mouse, 'NNS').
stem_match(geese, goose, 'NNS').
stem_match('bar-geese', 'bar-goose', 'NNS').
stem_match('fallings-off', 'falling-off', 'NNS').
stem_match(teeth, tooth, 'NNS').
stem_match(cocci, coccus, 'NNS').
stem_match(foci, focus, 'NNS').
stem_match(focuses, focus, 'NNS').
stem_match(cacti, cactus, 'NNS').
stem_match(termini, terminus, 'NNS').
stem_match(nuclei, nucleus, 'NNS').
stem_match(fungi, fungus, 'NNS').
stem_match(radii, radius, 'NNS').
stem_match(metanauplii, metanauplus, 'NNS').
stem_match(moduli, modulus, 'NNS').
stem_match(stimuli, stimulus, 'NNS').
stem_match(papyri, papyrus, 'NNS').
stem_match(narcissi, narcissus, 'NNS').
stem_match(dilettanti, dilettante, 'NNS').
stem_match(libretti, libretto, 'NNS').
stem_match(tempi, tempo, 'NNS').
stem_match(virtuosi, virtuoso, 'NNS').
stem_match(children, child, 'NNS').
stem_match('brain-children', 'brain-child', 'NNS').
stem_match('step-children', 'step-child', 'NNS').
stem_match(brethren, brother, 'NNS').
stem_match(oxen, ox, 'NNS').
stem_match('lyings-in', 'lying-in', 'NNS').
stem_match('guests-in-prison', 'guest-in-prison', 'NNS').
stem_match('aides-de-camp ', 'aide-de-camp', 'NNS').
stem_match(pp, p, 'NNS').
stem_match('washers-up', 'washer-up', 'NNS').
stem_match('men-of-war', 'man-of-war', 'NNS').
stem_match('prisoners-of-war', 'prisoner-of-war', 'NNS').
stem_match(appendices, appendix, 'NNS').
stem_match(apices, apex, 'NNS').
stem_match(indices, index, 'NNS').
stem_match(codices, codex, 'NNS').
stem_match(vertices, vertex, 'NNS').
stem_match(vortices, vortex, 'NNS').
stem_match(caryatides, caryatid, 'NNS').
stem_match(matrices, matrix, 'NNS').
stem_match(submatrices, submatrix, 'NNS').
stem_match(frescoes, fresco, 'NNS').
stem_match(desperadoes, desperado, 'NNS').
stem_match(mangoes, mango, 'NNS').
stem_match(flamingoes, flamingo, 'NNS').
stem_match(cargoes, cargo, 'NNS').
stem_match(echoes, echo, 'NNS').
stem_match(haloes, halo, 'NNS').
stem_match(dominoes, domino, 'NNS').
stem_match(heroes, hero, 'NNS').
stem_match(tomatoes, tomato, 'NNS').
stem_match(potatoes, potato, 'NNS').
stem_match(mementoes, memento, 'NNS').
stem_match(conquistadores, conquistador, 'NNS').
stem_match(gases, gas, 'NNS').
stem_match(canvases, canvas, 'NNS').
stem_match(diagnoses, diagnosis, 'NNS').
stem_match(ellipses, ellipse, 'NNS').
stem_match(hypotheses, hypothesis, 'NNS').
stem_match(oases, oasis, 'NNS').
stem_match(synopses, synopsis, 'NNS').
stem_match(syntheses, synthesis, 'NNS').
stem_match(theses, thesis, 'NNS').
stem_match(antitheses, antithesis, 'NNS').
stem_match(parentheses, parenthesis, 'NNS').
stem_match(hypotheses, hypothesis, 'NNS').
stem_match(kineses, kinesis, 'NNS').
stem_match(crises, crisis, 'NNS').
stem_match(irises, iris, 'NNS').
stem_match(metropolises, metropolis, 'NNS').
stem_match(pelvises, pelvis, 'NNS').
stem_match(summonses, summons, 'NNS').
stem_match(haemarthroses, haemarthrosis, 'NNS').
stem_match(neuroses, neurosis, 'NNS').
stem_match(buses, bus, 'NNS').
stem_match(syllabuses, syllabus, 'NNS').
stem_match(syllabi, syllabus, 'NNS').
stem_match(circuses, circus, 'NNS').
stem_match(geniuses, genius, 'NNS').
stem_match(pluses, plus, 'NNS').
stem_match(minuses, minus, 'NNS').
stem_match(bonuses, bonus, 'NNS').
stem_match(viruses, virus, 'NNS').
stem_match(censuses, census, 'NNS').
stem_match(mewses, mews, 'NNS').
stem_match(mews, mews, 'NNS').
stem_match(oats, oats, 'NNS').
stem_match(offspring, offspring, 'NNS').
stem_match(analyses, analysis, 'NNS').
stem_match(paralyses, paralysis, 'NNS').
stem_match(sheaves, sheaf, 'NNS').
stem_match(leaves, leaf, 'NNS').
stem_match('tea-leaves', 'tea-leaf', 'NNS').
stem_match(loaves, loaf, 'NNS').
stem_match(staves, staff, 'NNS').
stem_match(thieves, thief, 'NNS').
stem_match(lives, life, 'NNS').
stem_match('half-lives', 'half-life', 'NNS').
stem_match(knives, knife, 'NNS').
stem_match(wives, wife, 'NNS').
stem_match(housewives, housewife, 'NNS').
stem_match(fishwives, fishwife, 'NNS').
stem_match(calves, calf, 'NNS').
stem_match(halves, half, 'NNS').
stem_match(elves, elf, 'NNS').
stem_match(shelves, shelf, 'NNS').
stem_match(pelves, pelvis, 'NNS').
stem_match(selves, self, 'NNS').
stem_match(wolves, wolf, 'NNS').
stem_match(aussies, 'Aussie', 'NNS').
stem_match(werewolves, werewolf, 'NNS').
stem_match(dwarves, dwarf, 'NNS').
stem_match(scarves, scarf, 'NNS').
stem_match(headscarves, headscarf, 'NNS').
stem_match('head-scarves', 'head-scarf', 'NNS').
stem_match(wharves, wharf, 'NNS').
stem_match(hooves, hoof, 'NNS').
stem_match(blitzes, blitz, 'NNS').
stem_match(feet, foot, 'NNS').
stem_match(pinkfeet, pinkfoot, 'NNS').
stem_match(flatfeet, flatfoot, 'NNS').
stem_match('pennies-in-the-slot', 'penny-in-the-slot', 'NNS').
stem_match(vv, v, 'NNS').
stem_match('daughters-in-law', 'daughter-in-law', 'NNS').
stem_match(tableaux, tableau, 'NNS').
stem_match(bureaux, bureau, 'NNS').
stem_match('deputies-elect', 'deputy-elect', 'NNS').
stem_match(crossroads, crossroads, 'NNS').
stem_match(clergy, clergy, 'NNS').
stem_match(fry, fry, 'NNS').
stem_match(regalia, regalia, 'NNS').
stem_match(paraphernalia, paraphernalia, 'NNS').
stem_match(archivalia, archivalia, 'NNS').
stem_match(memorabilia, memorabilia, 'NNS').
stem_match(viscera, viscera, 'NNS').
stem_match(impedimenta, impedimenta, 'NNS').
stem_match(people, people, 'NNS').
stem_match(workpeople, workpeople, 'NNS').
stem_match('work-people', 'work-people', 'NNS').
stem_match(townspeople, townspeople, 'NNS').
stem_match(cattle, cattle, 'NNS').
stem_match(kith, kith, 'NNS').
stem_match(folk, folk, 'NNS').
stem_match('country-folk', 'country-folk', 'NNS').
stem_match(menfolk, menfolk, 'NNS').
stem_match(menservants, manservant, 'NNS').
stem_match(womenfolk, womenfolk, 'NNS').
stem_match(kinfolk, kinfolk, 'NNS').
stem_match(townfolk, townfolk, 'NNS').
stem_match(townsfolk, townsfolk, 'NNS').
stem_match(personnel, personnel, 'NNS').
stem_match(kin, kin, 'NNS').
stem_match('non-kin', 'non-kin', 'NNS').
stem_match(amends, amends, 'NNS').
stem_match(arrears, arrears, 'NNS').
stem_match(auspices, auspices, 'NNS').
stem_match(innards, innards, 'NNS').
stem_match(cantharides, cantharides, 'NNS').
stem_match(measles, measles, 'NNS').
stem_match(shingles, shingles, 'NNS').
stem_match(mumps, mumps, 'NNS').
stem_match(rickets, rickets, 'NNS').
stem_match('fleurs-de-lis', 'fleur-de-lis', 'NNS').
stem_match(thanks, thanks, 'NNS').
stem_match(tenterhooks, tenterhooks, 'NNS').
stem_match(gimbals, gimbals, 'NNS').
stem_match(brussels, brussels, 'NNS').
stem_match(entrails, entrails, 'NNS').
stem_match(clothes, clothes, 'NNS').
stem_match(bellows, bellows, 'NNS').
stem_match(means, means, 'NNS').
stem_match(cherubim, cherub, 'NNS').
stem_match(kibbutzim, kibbutz, 'NNS').
stem_match(seraphim, seraph, 'NNS').
stem_match(larvae, larva, 'NNS').
stem_match(dregs, dregs, 'NNS').
stem_match(goods, goods, 'NNS').
stem_match(grassroots, grassroots, 'NNS').
stem_match(dues, dues, 'NNS').
stem_match(earnings, earnings, 'NNS').
stem_match(banns, banns, 'NNS').
stem_match(congratulations, congratulations, 'NNS').
stem_match(whereabouts, whereabouts, 'NNS').
stem_match(credentials, credentials, 'NNS').
stem_match(commons, commons, 'NNS').
stem_match(pantaloons, pantaloons, 'NNS').
stem_match(environs, environs, 'NNS').
stem_match(turps, turps, 'NNS').
stem_match(withers, withers, 'NNS').
stem_match(knickers, knickers, 'NNS').
stem_match(mockers, mockers, 'NNS').
stem_match(blinkers, blinkers, 'NNS').
stem_match(pants, pants, 'NNS').
stem_match(underpants, underpants, 'NNS').
stem_match(blandishments, blandishments, 'NNS').
stem_match(fleshpots, fleshpots, 'NNS').
stem_match(shorts, shorts, 'NNS').
stem_match(humanities, humanities, 'NNS').
stem_match(lodgings, lodgings, 'NNS').
stem_match(mains, mains, 'NNS').
stem_match(odds, odds, 'NNS').
stem_match(outskirts, outskirts, 'NNS').
stem_match(particulars, particulars, 'NNS').
stem_match(premises, premise, 'NNS').
stem_match(regards, regards, 'NNS').
stem_match(remains, remains, 'NNS').
stem_match(savings, saving, 'NNS').
stem_match(stairs, stairs, 'NNS').
stem_match(surroundings, surroundings, 'NNS').
stem_match(tropics, tropics, 'NNS').
stem_match(valuables, valuables, 'NNS').
stem_match(gallows, gallows, 'NNS').
stem_match(headquarters, headquarters, 'NNS').
stem_match(innings, innings, 'NNS').
stem_match(chamois, chamois, 'NNS').
stem_match(chassis, chassis, 'NNS').
stem_match(corps, corps, 'NNS').
stem_match(guts, guts, 'NNS').
stem_match(pains, pain, 'NNS').
stem_match(dice, dice, 'NNS').
stem_match('public-relations', 'public-relations', 'NNS').
stem_match(patois, patois, 'NNS').
stem_match(rendezvous, rendezvous, 'NNS').
stem_match(works, work, 'NNS').
stem_match(systems, system, 'NNS').
stem_match(spirits, spirit, 'NNS').
stem_match(manners, manner, 'NNS').
stem_match(customs, custom, 'NNS').
stem_match(contents, content, 'NNS').
stem_match(overalls, overall, 'NNS').
stem_match(arms, arm, 'NNS').
stem_match(spectacles, spectacle, 'NNS').
stem_match(scales, scale, 'NNS').
stem_match(clippers, clipper, 'NNS').
stem_match(glasses, glass, 'NNS').
stem_match(pincers, pincers, 'NNS').
stem_match(funds, fund, 'NNS').
stem_match(mucosae, mucosa, 'NNS').
stem_match(pylori, pylorus, 'NNS').
stem_match(choruses, chorus, 'NNS').
stem_match(goes, go, 'NNS').
stem_match(fora, forum, 'NNS').
stem_match(sera, serum, 'NNS').
stem_match(stadia, stadium, 'NNS').
stem_match(chimerae, 'Chimera', 'NNS').
stem_match(cherubim, 'Cherub', 'NNS').
stem_match(seraphim, 'Seraph', 'NNS').
stem_match(commons, 'Commons', 'NNS').
stem_match(lords, 'Lords', 'NNS').
stem_match(mrs, mrs, 'NNS').
stem_match(messrs, messrs, 'NNS').
stem_match(ms, ms, 'NNS').
stem_match(miss, miss, 'NNS').
stem_match(princess, princess, 'NNS').
stem_match(pp, p, 'NNS').
stem_match(focuses, focus, 'NNS').
stem_match(spectacle, spectacle, 'NN').
stem_match(stair, stairs, 'NN').
stem_match(trouser, trousers, 'NN').
stem_match(pyjama, pyjamas, 'NN').
stem_match(pajama, pajamas, 'NN').
stem_match(jean, jeans, 'NN').
stem_match(suspender, suspenders, 'NN').
stem_match(binocular, binoculars, 'NN').
stem_match(scissor, scissors, 'NN').
stem_match(tweezer, tweezers, 'NN').
stem_match(pincer, pincers, 'NN').
stem_match(grassroot, grassroots, 'NN').
stem_match(datum, data, 'NN').
stem_match(data, data, 'NN').
stem_match(media, medium, 'NN').
stem_match('public-relations', 'public-relations', 'NN').
% JJR
stem_match(better, good, 'JJR').
stem_match(worse, bad, 'JJR').
stem_match(farther, far, 'JJR').
stem_match(further, far, 'JJR').
stem_match(crueller, cruel, 'JJR').
stem_match(elder, elder, 'JJR').
stem_match(stranger, strange, 'JJR').
stem_match(firmer, firm, 'JJR').
stem_match(harder, hard, 'JJR').
stem_match(cleverer, clever, 'JJR').
stem_match(shorter, short, 'JJR').
stem_match(smarter, smart, 'JJR').
stem_match(truer, true, 'JJR').
stem_match(warmer, warm, 'JJR').
stem_match(infringer, infringe, 'JJR').
stem_match(darker, dark, 'JJR').
% JJS
stem_match(best, good, 'JJS').
stem_match(worst, bad, 'JJS').
stem_match(farthest, far, 'JJS').
stem_match(furthest, far, 'JJS').
stem_match(cruellest, cruel, 'JJS').
stem_match(eldest, eldest, 'JJS').
stem_match(strangest, strange, 'JJS').
stem_match(firmest, firm, 'JJS').
stem_match(hardest, hard, 'JJS').
stem_match(cleverest, clever, 'JJS').
stem_match(shortest, short, 'JJS').
stem_match(smartest, smart, 'JJS').
stem_match(truest, true, 'JJS').
stem_match(warmest, warm, 'JJS').
stem_match(darkest, dark, 'JJS').
stem_match(added, add, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(eked, eke, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(egged, egg, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(programmed, programme, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(erred, err, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(burred, burr, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(purred, purr, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(silhouetted, silhouette, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(gazetted, gazette, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(boycotted, boycott, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(whizzed, whizz, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(banged, bang, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ganged, gang, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(twanged, twang, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(longed, long, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(belonged, belong, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(prolonged, prolong, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(thronged, throng, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bunged, bung, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bequeathed, bequeath, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(smoothed, smooth, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(frothed, froth, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(betrothed, betroth, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(mouthed, mouth, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(beguiled, beguile, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(led, lead, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(misled, mislead, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bled, bleed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fled, flee, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(contravened, contravene, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(convened, convene, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(intervened, intervene, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(condoned, condone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(honed, hone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(phoned, phone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(telephoned, telephone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(postponed, postpone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(droned, drone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(toned, tone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(intoned, intone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stoned, stone, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(interfered, interfere, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(adhered, adhere, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(persevered, persevere, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(biased, bias, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(focused, focus, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(cited, cite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(recited, recite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(excited, excite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ignited, ignite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(united, unite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(reunited, reunite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sited, site, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(invited, invite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wed, wed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(awed, awe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(overawed, overawe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(owed, owe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(axed, axe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dyed, dye, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(eyed, eye, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(blossomed, blossom, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(accustomed, accustom, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(developed, develop, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(redeveloped, redevelop, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(enveloped, envelop, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(galloped, gallop, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(tailored, tailor, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(mirrored, mirror, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(censored, censor, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sponsored, sponsor, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(monitored, monitor, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(motored, motor, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(murmured, murmur, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(combated, combat, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(budgeted, budget, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fidgeted, fidget, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ricocheted, ricochet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bracketed, bracket, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rocketed, rocket, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(blanketed, blanket, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(marketed, market, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(carpeted, carpet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(interpreted, interpret, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(misinterpreted, misinterpret, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(closeted, closet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(riveted, rivet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fed, feed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(underfed, underfeed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ached, ache, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shed, shed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(scythed, scythe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sped, speed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(typed, type, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(genotyped, genotype, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bred, breed, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(centred, centre, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(outmanoeuvred, outmanoeuvre, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(permeated, permeate, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(delineated, delineate, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(created, create, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(nauseated, nauseate, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(basted, baste, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(pasted, paste, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(tasted, taste, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wasted, waste, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bid, bid, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(forbid, forbid, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(undid, undo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(overdid, overdo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hid, hide, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(slid, slide, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rid, rid, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(held, hold, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(withheld, withhold, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sold, sell, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('re-sold', 're-sell', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(told, tell, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('re-told', 're-tell', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bound, bind, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(unbound, unbind, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rebound, rebound, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(found, find, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ground, grind, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wound, wind, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('fast-wound', 'fast-wind', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shod, shoe, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stood, stand, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(withstood, withstand, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(understood, understand, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(misunderstood, misunderstand, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(trod, tread, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(heard, hear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(overheard, overhear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bade, bid, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(forbade, forbid, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(made, make, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(remade, remake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rode, ride, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(strode, stride, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spoke, speak, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(broke, break, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(woke, wake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(awoke, awake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stole, steal, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(came, come, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(became, become, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(overcame, overcome, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shone, shine, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bore, bear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(tore, tear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wore, wear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(swore, swear, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(chose, choose, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rose, rise, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('half-rose', 'half-rise', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(arose, arise, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ate, eat, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(smote, smite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wrote, write, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(gave, give, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(drove, drive, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(strove, strive, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(froze, freeze, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('trailed-off', 'trail-off', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rang, ring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sprang, spring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sang, sing, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hung, hang, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(clung, cling, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(flung, fling, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(slung, sling, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rung, ring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sprung, spring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(strung, string, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wrung, wring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sung, sing, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stung, sting, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(swung, swing, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dug, dig, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stuck, stick, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(struck, strike, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(drank, drink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(drunk, drink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shrank, shrink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sank, sink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(stank, stink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shrunk, shrink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sunk, sink, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shook, shake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(took, take, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(undertook, undertake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(overtook, overtake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(mistook, mistake, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fell, fall, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(swam, swim, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(swum, swim, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(began, begin, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ran, run, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('signed-on', 'sign-on', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(won, win, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spun, spin, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('looped-up', 'loop-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('stepped-up', 'step-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('used-up', 'use-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('lighted-up', 'light-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('set-up', 'set-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('built-up', 'build-up', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(beat, beat, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spat, spit, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sat, sit, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bet, bet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(let, let, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('sub-let', 'sub-let', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(met, meet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(set, set, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(beset, beset, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(offset, offset, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(upset, upset, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wet, wet, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(left, leave, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(caught, catch, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(taught, teach, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bought, buy, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fought, fight, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(thought, think, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(brought, bring, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wrought, work, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sought, seek, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(besought, beseech, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bit, bite, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hit, hit, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(lit, light, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(split, split, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(slit, slit, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(quit, quit, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dealt, deal, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(felt, feel, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(smelt, smell, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(knelt, kneel, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spelt, spell, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dwelt, dwell, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spoilt, spoil, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spilt, spill, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(built, build, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(rebuilt, rebuild, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dreamt, dream, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(leant, lean, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(meant, mean, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(bent, bend, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(unbent, unbend, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(lent, lend, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(spent, spend, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(sent, send, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(went, go, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(learnt, learn, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(burnt, burn, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(got, get, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(forgot, forget, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shot, shoot, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(leapt, leap, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(kept, keep, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(slept, sleep, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(crept, creep, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wept, weep, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(swept, sweep, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hurt, hurt, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(cast, cast, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('re-cast', 're-cast', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(broadcast, broadcast, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(forecast, forecast, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hoist, hoist, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(cost, cost, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(lost, lose, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(burst, burst, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(thrust, thrust, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(cut, cut, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(shut, shut, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('carried-out', 'carry-out', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('fitted-out', 'fit-out', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(put, put, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(saw, see, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(foresaw, foresee, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(blew, blow, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(flew, fly, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(knew, know, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(drew, draw, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(withdrew, withdraw, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(grew, grow, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(threw, throw, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(lay, lie, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(underlay, underlie, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(fuelled, fuel, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(hanged, hang, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(targeted, target, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(chorused, chorus, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(canceled, cancel, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wove, weave, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(labeled, label, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(done, do, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(had, have, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('\'d', have, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(cosseted, cosset, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(subpoenaed, subpoena, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(echoed, echo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match('re-echoed', 're-echo', A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(haloed, halo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(wooed, woo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(vetoed, veto, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(kayoed, kayo, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(recalled, recall, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(dialled, dial, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(installed, install, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(refilled, refill, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(remilled, remill, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(biassed, bias, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(canvassed, canvas, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(focussed, focus, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ebbed, ebb, A) :-
        lists:member(A, ['VBN','VBD']).
stem_match(ruined,ruin,A):-
        lists:member(A, ['VBN','VBD']).
