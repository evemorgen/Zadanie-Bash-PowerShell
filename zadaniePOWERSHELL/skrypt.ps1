$pwd.path > ~\route 	#w g³ównym katalogu u¿ytkownika tworzê plik pomocniczy który zawiera œcie¿kê gdzie ma byæ zrobiony backup
echo "" > backupfile	#tworzê plik backupfile w miejscu gdzie wywo³ywany jest skrypt
echo "Podaj godzine robienia backup'u" #dajê stosown¹ informacjê o formacie godziny do wprowadzenia
echo "godzine nalezy podawac w formacie np. 09 - dziewiata rano, 15 - godzina pietnasta"
$godzina = read-host #pobieram godzinê od u¿ytkownika
$godzina = $godzina + ":00"
$sciezka = "powershell " + $pwd.path + "\skryptDoCrona.ps1" #tworzê string posiadaj¹cy scie¿kê do skryptu robi¹cego backup
schtasks /create /sc daily /tn "Your daily backup" /st $godzina /tr $sciezka  #wrzucam nowe zadanie do odpowiednika crona


#######################################################
#                                                     #
#  Na pocz¹tku programu stworzy siê nowy plik         #
#  backupfile który bêdzie pusty. W najgorszym        #
#  wypadku nadpisze istniej¹cy ju¿ plik.              #
#  Oba skrypty które wyprodukowa³em wymagaj¹          #
#  stworzenia dodatkowego pliku który okreœla         #
#  œcie¿kê do miejsca gdzie tworzy siê backup         #
#                                                     #
#  Jednej rzeczy nie uda³o mi siê przeskoczyæ,        #
#  mianowicie sensownego podawania godziny,           #
#  wiêc jest informacja jak nale¿y j¹ wczytywaæ.      #
#  Jak ju¿ pobierzemy godzinê, to do czegoœ           #
#  pokroju Crona dla windows jest wrzucany drugi      #
#  skrypt który kopiuje wszystkie pliki jak trzeba.   #
#  I to tyle tutaj, ci¹g dalszy w nastêpnym pliku ;)  #
#                                                     #
#######################################################