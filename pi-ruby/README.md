# Liczba Pi
Skrypt pi_map wczytuje linie z pliku i sprawdza czy dana sekwencja poczatkowa liczby Pi znajduje sie w linii, jesli tak wyswietla ja.
Pi_reduce zlicza ilosc linii, w ktorych wystapila dana sekwencja.

Wymagania:

* Działający hadoop
* Ruby 

Test:
Przed wykonaniem testu nalezy wygenerowac sobie dane testowe za pomoca skryptu pi_data_gen.rb.

* Wywołanie skryptu testOgolny.sh w celu weryfikacji działania skryptów
* Ustawienie w pliku testHadoop.sh zmiennej HADOOP_HOME i wywołanie go.

