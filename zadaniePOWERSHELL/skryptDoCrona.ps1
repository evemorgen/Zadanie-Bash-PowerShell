$x = cat ~\route	#wyci�gam scie�k� z pliku w kt�rej mam zrobi� backup
cd $x			#przechodz� do tej �cie�ki
$a = get-date		#pobieram aktualn� dat� do zmiennej
$txt = "backup-" + $a.day + "." + $a.month + "." + $a.year #formatuje sobie string trzymaj�c� nazw� przysz�ego foleru
mkdir $txt						   #tworz� odpowiedni folder

$dest = ".\" + $txt					   #pomocnicza zmienna do okre�lania �cie�ki do kopiowania
$z = $x + "\backupfile"					   #�cie�ka do pliku backupfile

foreach ($a in cat $z)					   #w ka�dym przej�ciu p�tli do zmiennej a b�dzie trafia� kolejna linijka z pliku backupfile
	{
	 $x = echo $a | %{$_.split('#')[0]}		   #wycinam do zmiennej x to co jest przed separatorem (odpowiednik cut -d"#" -f1 w bashu)
	 $y = echo $a | %{$_.split('#')[1]}		   #wycinam do zmiennej y to co jest  po   separatorze (odpowiednik cut -d"#" -f2 w bashu)
	 $route = $y + "\" + $x				   #sklejam x i y tak aby wysz�a mi pe�na �cie�ka do pliku
	 copy-item $route -destination $dest		   #kopiuje kolejny element, a� do ko�ca pliku
	}


##############################################################
#                                                            #
#   Nie wiem czy jest tu du�o do opisywania,                 #
#   ale jednak napisz� komentarz, a co mi tam.               #
#   Z pliku kt�ry stworzy�em w poprzednim skrypcie           #
#   pobieram �cie�k� do kt�rej trzeba przej��                #
#   i zrobi� backup. Domy�lnie jest to katalog               #
#   domowy. do zmiennej a pobieram dat� systemow�,           #
#   W tej zmiennej ta data jest dana w na tyle               #
#   fajnym formacie, �e mog� j� wyci�gn�� poprzez            #
#   a.day i zwr�ci mi dzie� itd. Zmienna txt to              #
#   nazwa folderu np. backup-24.1.2015. Tworz�               #
#   odpowiedni folder. Nast�pne dwie zmienne s�              #
#   pomocnicze. Ciekawym tworem jest p�tla foreach,          # 
#   odpowiednik for() w linuksie. do zmiennej a              #       
#   wypisuje kolejne linijki tekstu a� do ko�ca pliku.       #
#   Rozdzielam sobie pola i zapisuje do odpowiednich         #
#   zmiennych a nast�pnie ��cz� w jedn�, pe�n�               #
#   �cie�k� do pliku. Na ko�cu kopiuje jak trzeba            #
#   UWAGA. U mnie to wszystko dzia�a, ale jako, �e           #
#   nigdy w �yciu nie klepa�em wcze�niej w powershellu       #
#   to mog�em nie przewidzie� czego� dziwnego.               #
#   POWODZENIA! :)                                           #
#                                                            #
##############################################################
