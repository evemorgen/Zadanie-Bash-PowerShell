$x = cat ~\route	#wyci¹gam scie¿kê z pliku w której mam zrobiæ backup
cd $x			#przechodzê do tej œcie¿ki
$a = get-date		#pobieram aktualn¹ datê do zmiennej
$txt = "backup-" + $a.day + "." + $a.month + "." + $a.year #formatuje sobie string trzymaj¹c¹ nazwê przysz³ego foleru
mkdir $txt						   #tworzê odpowiedni folder

$dest = ".\" + $txt					   #pomocnicza zmienna do okreœlania œcie¿ki do kopiowania
$z = $x + "\backupfile"					   #œcie¿ka do pliku backupfile

foreach ($a in cat $z)					   #w ka¿dym przejœciu pêtli do zmiennej a bêdzie trafiaæ kolejna linijka z pliku backupfile
	{
	 $x = echo $a | %{$_.split('#')[0]}		   #wycinam do zmiennej x to co jest przed separatorem (odpowiednik cut -d"#" -f1 w bashu)
	 $y = echo $a | %{$_.split('#')[1]}		   #wycinam do zmiennej y to co jest  po   separatorze (odpowiednik cut -d"#" -f2 w bashu)
	 $route = $y + "\" + $x				   #sklejam x i y tak aby wysz³a mi pe³na œcie¿ka do pliku
	 copy-item $route -destination $dest		   #kopiuje kolejny element, a¿ do koñca pliku
	}


##############################################################
#                                                            #
#   Nie wiem czy jest tu du¿o do opisywania,                 #
#   ale jednak napiszê komentarz, a co mi tam.               #
#   Z pliku który stworzy³em w poprzednim skrypcie           #
#   pobieram œcie¿kê do której trzeba przejœæ                #
#   i zrobiæ backup. Domyœlnie jest to katalog               #
#   domowy. do zmiennej a pobieram datê systemow¹,           #
#   W tej zmiennej ta data jest dana w na tyle               #
#   fajnym formacie, ¿e mogê j¹ wyci¹gn¹æ poprzez            #
#   a.day i zwróci mi dzieñ itd. Zmienna txt to              #
#   nazwa folderu np. backup-24.1.2015. Tworzê               #
#   odpowiedni folder. Nastêpne dwie zmienne s¹              #
#   pomocnicze. Ciekawym tworem jest pêtla foreach,          # 
#   odpowiednik for() w linuksie. do zmiennej a              #       
#   wypisuje kolejne linijki tekstu a¿ do koñca pliku.       #
#   Rozdzielam sobie pola i zapisuje do odpowiednich         #
#   zmiennych a nastêpnie ³¹czê w jedn¹, pe³n¹               #
#   œcie¿kê do pliku. Na koñcu kopiuje jak trzeba            #
#   UWAGA. U mnie to wszystko dzia³a, ale jako, ¿e           #
#   nigdy w ¿yciu nie klepa³em wczeœniej w powershellu       #
#   to mog³em nie przewidzieæ czegoœ dziwnego.               #
#   POWODZENIA! :)                                           #
#                                                            #
##############################################################
