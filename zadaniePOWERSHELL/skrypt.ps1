$pwd.path > ~\route 	#w g��wnym katalogu u�ytkownika tworz� plik pomocniczy kt�ry zawiera �cie�k� gdzie ma by� zrobiony backup
echo "" > backupfile	#tworz� plik backupfile w miejscu gdzie wywo�ywany jest skrypt
echo "Podaj godzine robienia backup'u" #daj� stosown� informacj� o formacie godziny do wprowadzenia
echo "godzine nalezy podawac w formacie np. 09 - dziewiata rano, 15 - godzina pietnasta"
$godzina = read-host #pobieram godzin� od u�ytkownika
$godzina = $godzina + ":00"
$sciezka = "powershell " + $pwd.path + "\skryptDoCrona.ps1" #tworz� string posiadaj�cy scie�k� do skryptu robi�cego backup
schtasks /create /sc daily /tn "Your daily backup" /st $godzina /tr $sciezka  #wrzucam nowe zadanie do odpowiednika crona


#######################################################
#                                                     #
#  Na pocz�tku programu stworzy si� nowy plik         #
#  backupfile kt�ry b�dzie pusty. W najgorszym        #
#  wypadku nadpisze istniej�cy ju� plik.              #
#  Oba skrypty kt�re wyprodukowa�em wymagaj�          #
#  stworzenia dodatkowego pliku kt�ry okre�la         #
#  �cie�k� do miejsca gdzie tworzy si� backup         #
#                                                     #
#  Jednej rzeczy nie uda�o mi si� przeskoczy�,        #
#  mianowicie sensownego podawania godziny,           #
#  wi�c jest informacja jak nale�y j� wczytywa�.      #
#  Jak ju� pobierzemy godzin�, to do czego�           #
#  pokroju Crona dla windows jest wrzucany drugi      #
#  skrypt kt�ry kopiuje wszystkie pliki jak trzeba.   #
#  I to tyle tutaj, ci�g dalszy w nast�pnym pliku ;)  #
#                                                     #
#######################################################