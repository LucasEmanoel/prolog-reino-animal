% factos

% Definicao do reino

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

ordem_da_classe(carnivoros, mamiferos).
ordem_da_classe(artiodactilos, mamiferos).
ordem_da_classe(cetaceos, mamiferos).

ordem_da_classe(pinguins, aves).

ordem_da_classe(crocodilianos, repteis).
ordem_da_classe(escamados, repteis).

ordem_da_classe(perciformes, peixes_osseos).

ordem_da_classe(lepidopteros, insetos).
%ordem_da_classe(esponjas, demosponjas). aparentemente nao tem





