#!/bin/bash

pwd > ~/route                               #zapisuje scieżkę dostępnu do pliku route w katalogu domowym

touch backupfile                            #tworzę plik backup, jeśli istnieje nic się nie dzieje

echo "podaj godzinę robienia backup'u: ";   #ładnie proszę o godzinę

read godzina;				    #pobieram godzinę do zmiennej godzina

crontab -l >> tmp                           #zapisuje obecne zadania z crona do pliku tymczasowego

echo "*" $godzina "* * * `pwd`/skryptDlaCrona.sh" >> tmp; #dodaje do pliku tymczasowego swój skrypt  dla 
crona
crontab tmp;                                #zapisuje zdania do crona

rm tmp;                                     #usuwam plik tymczasowy

