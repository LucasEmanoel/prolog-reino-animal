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

% Fatos de peso

animal_kilos(gato, 4).
animal_kilos(leao, 200).
animal_kilos(tigre, 210).
animal_kilos(cao, 20).
animal_kilos(elefante, 6000).
animal_kilos(girafa, 1800).
animal_kilos(cavalo, 1000).
animal_kilos(rinoceronte, 1600).
animal_kilos(golfinho, 150).
animal_kilos(baleia, 150000).
animal_kilos(pinguim, 35).
animal_kilos(crocodilo, 800).
animal_kilos(jacare, 360).
animal_kilos(nemo, 0.2).
animal_kilos(borboleta, 0.1).
animal_kilos(esponja, 0.2).

% Fatos de forca de mordida em kg

animal_forca_mordida(gato, 50).
animal_forca_mordida(leao, 2000).
animal_forca_mordida(tigre, 1800).
animal_forca_mordida(cao, 100).
animal_forca_mordida(elefante, 0).
animal_forca_mordida(girafa, 0).
animal_forca_mordida(cavalo, 100).
animal_forca_mordida(rinoceronte, 0).
animal_forca_mordida(golfinho, 0).
animal_forca_mordida(baleia, 2000).
animal_forca_mordida(pinguim, 0).
animal_forca_mordida(crocodilo, 3000).
animal_forca_mordida(jacare, 1500).
animal_forca_mordida(nemo, 0).
animal_forca_mordida(borboleta, 0).
animal_forca_mordida(esponja, 0).

% fatos do habitat do animal

animal_habitat(gato, urbano).
animal_habitat(leao, savana).
animal_habitat(tigre, terrestre).
animal_habitat(cao, urbano).
animal_habitat(cao, rural).
animal_habitat(elefante, savana).
animal_habitat(girafa, savana).
animal_habitat(cavalo, rural).
animal_habitat(rinoceronte, savana).
animal_habitat(golfinho, aquatico).
animal_habitat(baleia, aquatico).
animal_habitat(pinguim, aquatico).
animal_habitat(pinguim, terrestre).
animal_habitat(crocodilo, aquatico).
animal_habitat(crocodilo, terrestre).
animal_habitat(jacare, aquatico).
animal_habitat(jacare, terrestre).
animal_habitat(nemo, aquatico).
animal_habitat(borboleta, terrestre).
animal_habitat(esponja, aquatico).

% regra generica sobre se o animal é predador, pela ordem (LIMITADO AO CONTEXTO DA QUESTAO)
animal_predador(X) :- (animal_da_ordem(X, carnivora) ; animal_da_ordem(X, crocodylia) ; animal_da_ordem(X, squamata)).

% Verificar se vivem no mesmo lugar
vivem_no_mesmo_habitat(X, Y) :- animal_habitat(X, Z), animal_habitat(Y, Z).

% Verificar possivel predador, precisa ser mais pesado ou ter uma mordida potente
predador_de_animal(X, Y) :- 
  animal_predador(X),
  vivem_no_mesmo_habitat(X, Y), 
  animal_kilos(X, PesoX),
  animal_kilos(Y, PesoY),
  animal_forca_mordida(X, ForcaX),
  (PesoX > PesoY ; PesoY < ForcaX ).

animal_presa_de(X, Y) :- predador_de_animal(Y, X). 

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
  animal_da_classe(X, A),
  classe_do_filo(A, Y).
  

% Consultar animais de cada hierarquia

listar_animais_da_familia(Familia, Animais) :-
  findall(Animal, animal_da_familia(Animal, Familia), Animais).

listar_animais_da_ordem(Ordem, Animais) :-
    findall(Animal, animal_da_ordem(Animal, Ordem), Animais).

listar_animais_da_classe(Classe, Animais) :-
    findall(Animal, animal_da_classe(Animal, Classe), Animais).

listar_animais_da_filo(Filo, Animais) :-
    findall(Animal, animal_do_filo(Animal, Filo), Animais).



% Testes de hierarquia
:- begin_tests(taxinomia_hierarquia).

  test(girafa_filo_chordata) :-
    animal_do_filo(girafa, chordata),
    \+ (animal_do_filo(girafa, porifera), animal_do_filo(girafa, arthropoda)).

  test(leao_classe_mammalia) :-
    animal_da_classe(leao, mammalia).

  test(elefante_ordem_artiodactyla) :-
    animal_da_ordem(elefante, artiodactyla).
  
  test(cao_familia_canidae) :-  % Corrigido para canidae
    animal_da_familia(cao, canidae).

:- end_tests(taxinomia_hierarquia).
:- run_tests(taxinomia_hierarquia).

% Testes animal completo
:- begin_tests(taxonomia_completa_animal).
  test(leao) :-
    consultar_taxonomia(leao, felidae, carnivora, mammalia, chordata, animalia).

  test(cavalo) :-
    consultar_taxonomia(cavalo, equidae, artiodactyla, mammalia, chordata, animalia).

  test(rinoceronte) :-
    consultar_taxonomia(rinoceronte, rhinocerotidae, perissodactyla, mammalia, chordata, animalia).

  test(crocodilo) :-
    consultar_taxonomia(crocodilo, crocodylidae, crocodylia, reptilia, chordata, animalia).

  test(jacare) :-
    consultar_taxonomia(jacare, crocodylidae, crocodylia, reptilia, chordata, animalia).

  test(cavalo_familia_errada) :-
    \+ consultar_taxonomia(cavalo, crocodylidae, perciformes, actinopterygii, chordata, animalia).  

  test(nao_existe) :-
    \+ consultar_taxonomia(leopardo, pomacentridae, perciformes, actinopterygii, chordata, animalia).

:- end_tests(taxonomia_completa_animal).
:- run_tests(taxonomia_completa_animal).

% Testes de listas 
:- begin_tests(listas).

  test(canideos) :-
    listar_animais_da_familia(canidae, [cao]).

  test(felinos) :-
    listar_animais_da_familia(felidae, [gato, leao, tigre]).

:- end_tests(listas).
:- run_tests(listas).


% Testes de predadores
:- begin_tests(predadores).

  test(leao_mata_girafa) :-
    predador_de_animal(leao, girafa).

  test(leao_mata_baleia) :-
    \+ predador_de_animal(leao, baleia).

  test(gato_presa_de_cao) :-
    animal_presa_de(gato, cao).


:- end_tests(predadores).
:- run_tests(predadores).