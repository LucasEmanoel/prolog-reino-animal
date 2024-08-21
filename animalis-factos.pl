% Fatos

% Definição do reino
filo_do_reino(cordados, animais).
filo_do_reino(artropodes, animais).
filo_do_reino(poriferos, animais).

% Definição de classes
classe_do_filo(mamiferos, cordados).
classe_do_filo(aves, cordados).
classe_do_filo(repteis, cordados).
classe_do_filo(peixes_osseos, cordados).

classe_do_filo(insetos, artropodes).

classe_do_filo(demosponjas, poriferos).

% Definição de ordens
ordem_da_classe(carnivoros, mamiferos).
ordem_da_classe(artiodactilos, mamiferos).
ordem_da_classe(cetaceos, mamiferos).

ordem_da_classe(pinguins, aves).

ordem_da_classe(crocodilianos, repteis).
ordem_da_classe(escamados, repteis).

ordem_da_classe(perciformes, peixes_osseos).

ordem_da_classe(lepidopteros, insetos).

% Definição de famílias
familia_da_ordem(felideos, carnivoros).
familia_da_ordem(canideos, carnivoros).
familia_da_ordem(elefantideos, artiodactilos).
familia_da_ordem(giraffideos, artiodactilos).
familia_da_ordem(equideos, artiodactilos).

familia_da_ordem(rinocerotideos, perissodactilos).
familia_da_ordem(delphinideos, cetaceos).
familia_da_ordem(balaenopterideos, cetaceos).

familia_da_ordem(spheniscideos, pinguins).

familia_da_ordem(crocodilideos, crocodilianos).
familia_da_ordem(pomacentrideos, perciformes).

familia_da_ordem(lepido, lepidopteros).
familia_da_ordem(spongideos, demosponjas).

% Definição de gêneros e espécies
genero_da_familia(panthera, felideos).
genero_da_familia(canis, canideos).
genero_da_familia(elephas, elefantideos).
genero_da_familia(giraffa, giraffideos).
genero_da_familia(equus, equideos).

genero_da_familia(ceratotherium, rinocerotideos).
genero_da_familia(delphinus, delphinideos).
genero_da_familia(balaenoptera, balaenopterideos).

genero_da_familia(aptentodytes, spheniscideos).

genero_da_familia(crocodylus, crocodilideos).

genero_da_familia(amphiprion, pomacentrideos).

genero_da_familia(papilio, lepido).
genero_da_familia(spongia, spongideos).

% Exemplos de espécies
especie_do_genero(leao, panthera).
especie_do_genero(tigre, panthera).
especie_do_genero(gato, panthera).

especie_do_genero(cao, canis).

especie_do_genero(elefante, elephas).
especie_do_genero(girafa, giraffa).
especie_do_genero(cavalo, equus).

especie_do_genero(rinoceronte, ceratotherium).
especie_do_genero(golfinho, delphinus).
especie_do_genero(baleia, balaenoptera).

especie_do_genero(pinguim, aptentodytes).

especie_do_genero(crocodilo, crocodylus).
especie_do_genero(jacare, crocodylus).

especie_do_genero(peixe_palhaco, amphiprion).

especie_do_genero(borboleta, papilio).

especie_do_genero(esponja, spongia).

% Regras para consultas
animal(X) :- filo_do_reino(_, X).
filo(X) :- classe_do_filo(_, X).
classe(X) :- ordem_da_classe(_, X).
ordem(X) :- familia_da_ordem(_, X).
familia(X) :- genero_da_familia(_, X).
genero(X) :- especie_do_genero(_, X).





