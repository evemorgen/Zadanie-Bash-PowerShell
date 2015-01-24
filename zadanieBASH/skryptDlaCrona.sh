#!/bin/bash

cd `cat ~/route`          # przechodzę do katalogu w którym ma być zrobiony backup

part1=`echo "backup"`;    #zmienna trzymająca słowo "backup" jako string

part2=`date "+-%m.%d.%y"` #zmienna trzymająca aktualną datę jako string

mkdir "$part1$part2"      #sklejenie dwóch stringów i stworzenie folderu


x=`cat backupfile`;       #pobranie danych z pliku backupfile do zmiennej x


cd "$part1$part2";       #przechodzę do katalogu backup


for a in $x;             #tworzę pętlę która będzie wykonywana dla każdej

do                       #   linijki pliku backupfile
  
  pole1=`echo "$a" | cut -d"#" -f1`; #wyciągam nazwę pliku do backupu
  
  pole2=`echo "$a" | cut -d"#" -f2`; #wyciągam scieżkę do pliku
  
  cp "$pole2$pole1" "./$pole1";      #sklejam nazwę ze ścieżką i kopiuje
done 
                                     #   do obecnego katalogu

cd ..



