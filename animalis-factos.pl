% Fatos

% Definição do reino
reino(animais).

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
ordem_da_classe(perissodactilos, mamiferos).
ordem_da_classe(cetaceos, mamiferos).

ordem_da_classe(pinguins, aves).

ordem_da_classe(crocodilianos, repteis).
ordem_da_classe(escamados, repteis).

ordem_da_classe(perciformes, peixes_osseos).

ordem_da_classe(lepidopteros, insetos).

% Definição de famílias
familia_da_ordem(felinos, carnivoros).
familia_da_ordem(canideos, carnivoros).

familia_da_ordem(elefantes, artiodactilos).
familia_da_ordem(girafas, artiodactilos).
familia_da_ordem(equideos, artiodactilos).

familia_da_ordem(rinocerontes, perissodactilos).
familia_da_ordem(delfinideos, cetaceos).
familia_da_ordem(baleias, cetaceos).

familia_da_ordem(spheniscideos, pinguins).

familia_da_ordem(crocodilos, crocodilianos).
familia_da_ordem(serpentes, escamados).

familia_da_ordem(peixes_palhacos, perciformes).

familia_da_ordem(borboletas, lepidopteros).
familia_da_ordem(esponjas, demosponjas).

% Exemplos de espécies
especie_da_familia(leao, felinos).
especie_da_familia(tigre, felinos).
especie_da_familia(gato, felinos).

especie_da_familia(cao, canideos).

especie_da_familia(elefante, elefantes).
especie_da_familia(girafa, girafas).
especie_da_familia(cavalo, equideos).

especie_da_familia(rinoceronte, rinocerontes).
especie_da_familia(golfinho, delfinideos).
especie_da_familia(baleia, baleias).

especie_da_familia(pinguim, pinguins).

especie_da_familia(crocodilo, crocodilianos).
especie_da_familia(jacare, crocodilianos).

especie_da_familia(cobra, serpentes).

especie_da_familia(nemo, peixes_palhacos).

especie_da_familia(borboleta, borboletas).

especie_da_familia(esponja, esponjas).

% Consultar taxonomia completa do animal animal
consultar_taxonomia(X, Familia, Ordem, Classe, Filo, Reino) :- 
  especie_da_familia(X, Familia),
  familia_da_ordem(Familia, Ordem),
  ordem_da_classe(Ordem, Classe),
  classe_do_filo(Classe, Filo),
  filo_do_reino(Filo, Reino).

% Cada nivel

animal_do_reino(X, Y) :- 
  filo_do_reino(A, Y),
  classe_do_filo(B, A),
  ordem_da_classe(C, B),
  familia_da_ordem(D, C),
  especie_da_familia(X, D).



