% Definição do reino
reino(animalia).

filo_do_reino(chordata, animalia).
filo_do_reino(arthropoda, animalia).
filo_do_reino(porifera, animalia).

% Definição de classes
classe_do_filo(mammalia, chordata).
classe_do_filo(aves, chordata).
classe_do_filo(reptilia, chordata).
classe_do_filo(actinopterygii, chordata).

classe_do_filo(insecta, arthropoda).

classe_do_filo(demospongiae, porifera).

% Definição de ordens
ordem_da_classe(carnivora, mammalia).
ordem_da_classe(artiodactyla, mammalia).
ordem_da_classe(perissodactyla, mammalia).
ordem_da_classe(cetacea, mammalia).

ordem_da_classe(sphenisciformes, aves).

ordem_da_classe(crocodylia, reptilia).
ordem_da_classe(squamata, reptilia).

ordem_da_classe(perciformes, actinopterygii).

ordem_da_classe(lepidoptera, insecta).

% Definição de subOrdem
subordem_da_ordem(serpentes,squamata).

% Definição de famílias
familia_da_ordem(felidae, carnivora).
familia_da_ordem(canidae, carnivora).

familia_da_ordem(elephantidae, artiodactyla).
familia_da_ordem(giraffidae, artiodactyla).
familia_da_ordem(equidae, artiodactyla).

familia_da_ordem(rhinocerotidae, perissodactyla).
familia_da_ordem(delphinidae, cetacea).
familia_da_ordem(balaenopteridae, cetacea).

familia_da_ordem(spheniscidae, sphenisciformes).

familia_da_ordem(crocodylidae, crocodylia).

familia_da_ordem(pomacentridae, perciformes).

familia_da_ordem(lepidoptera, lepidoptera).

familia_da_classe(spongidae, demospongiae).

% Exemplos de espécies
especie_da_familia(gato, felidae).
especie_da_familia(leao, felidae).
especie_da_familia(tigre, felidae).

especie_da_familia(cao, canidae).

especie_da_familia(elefante, elephantidae).

especie_da_familia(girafa, giraffidae).

especie_da_familia(cavalo, equidae).

especie_da_familia(rinoceronte, rhinocerotidae).

especie_da_familia(golfinho, delphinidae).

especie_da_familia(baleia, balaenopteridae).

especie_da_familia(pinguim, spheniscidae).

especie_da_familia(crocodilo, crocodylidae).
especie_da_familia(jacare, crocodylidae).

especie_da_familia(nemo, pomacentridae).

especie_da_familia(borboleta, lepidoptera).

especie_da_familia(esponja, spongidae).

especie_da_subordem(cobra, serpentes).

% Consultar por taxonomia
consultar_taxonomia(Animal, Familia, Ordem, Classe, Filo, Reino) :-
  especie_da_familia(Animal, Familia),
  familia_da_ordem(Familia, Ordem),
  ordem_da_classe(Ordem, Classe),
  classe_do_filo(Classe, Filo),
  filo_do_reino(Filo, Reino).

consultar_taxonomia_ordem(Animal, Familia, Ordem) :-
  especie_da_familia(Animal, Familia),
  familia_da_ordem(Familia, Ordem).

consultar_taxonomia_classe(Animal, Familia, Ordem, Classe) :-
  especie_da_familia(Animal, Familia),
  familia_da_ordem(Familia, Ordem),
  ordem_da_classe(Ordem, Classe).

consultar_taxonomia_filo(Animal, Familia, Ordem, Classe, Filo) :-
  especie_da_familia(Animal, Familia),
  familia_da_ordem(Familia, Ordem),
  ordem_da_classe(Ordem, Classe),
  classe_do_filo(Classe, Filo).

% Consultando animal por cada nivel
animal_da_familia(X,Y) :-
  especie_da_familia(X, Y).

animal_da_subordem(X,Y) :-
  especie_da_subordem(X,Y).

animal_da_ordem(X, Y) :-
  familia_da_ordem(A, Y),
  animal_da_familia(X,A);
  subordem_da_ordem(Z,Y),
  animal_da_subordem(X,Z).

animal_da_classe(X, Y) :-
  ordem_da_classe(A, Y),
  animal_da_ordem(X, A);
  familia_da_classe(W, Y),
  animal_da_familia(X, W).

animal_do_filo(X, Y) :-
  classe_do_filo(A, Y),
  animal_da_classe(X, A).
