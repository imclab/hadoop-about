Instalacja Hadoop'a
===================

single-instace
--------------
* ściągamy hadoop ze [strony](http://hadoop.apache.org/common/releases.html) fundacji apache (w momencie pisania tego tekstu stabilne wydanie to 0.21.0)
> wget http://ftp.tpnet.pl/vol/d1/apache//hadoop/core/hadoop-0.21.0/hadoop-0.21.0.tar.gz
* rozpakowujemy
> tar xvzpf hadoop-0.21.0.tar.gz
* ALTERNATYWNIE możemy użyc paczki przygotowanej specjalnie na sigme (usunięte zbędne pliki, dzięki czemu rozmiar zmniejszył sie z 200MB do 50MB)
> wget http://szymon.inf.ug.edu.pl/hadoop-sigma.tar.xz
* rozpakowujemy
> tar xvJpf hadoop-sigma.tar.xz
* niezależnie od wersji którą wybraliśmy, przechodzimy do folderu z hadoopem (cd hadoop-sigma lub cd hadoop-0.21.0), należy zadbać o ustawienie zmiennej JAVA HOME w pliku conf/hadoop-env.sh, w wypadku sigmy poprawny wpis powinien wyglądać tak:
> export JAVA_HOME=/usr/lib/jvm/java
* w folderze conf/ pliki core-site.xml, hdfs-site.xml, mapred-site.xml, edytujemy zgodnie z wzorcowymi plikami umieszczonymi w folderze single-instance/, należy pamiętać o ustawieniu unikalnych portów
* generujemy klucze ssh
> ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
* przed uruchomieniem Hadoop'a należy sfortmatować system plików DFS za pomocą polecenia:
> ./bin/hadoop namenode -format
* hadoopa z poziomu folderu domowego mozemy uruchomić poleceniem:
> ./bin/start-all.sh
* a zatrzymać:
> ./bin/stop-all.sh
* wszystkie pliki modyfikowane na potrzeby instalacji są umieszczone w folderze 'single-instance'

cluster
-------
Instalacja Hadoop w środowisku klastrowym nie różni się znacząco od instalacji pojedyńczej instacji, należy pamiętać aby nazwa komputera w /etc/hosts oraz wynik polecenia 'hostname' zwracały to samo najlepiej zeby była to FQDN, wszystkie adresy/nazwy serwerów powinny też byc podawane jako FQDN, pozwoli to uniknąć nadmiernej frustracji, ważne jest też zwiekszenie limitu równocześnie (powyżej standardowego 1024) otwartych plikow przez użytkownika.

* hadoopa sciągamy i instalujemy w taki sam sposób jak w przypadku instalacji typu 'single-instance', w takim sam sposób należy zainicjalizować zmienna JAVA_HOMEi
* ustawienia klastra są zapisane w pliku conf/hadoop-site.xml 
* parametr 'fs.default.name' i 'mapred.job.tracker', powinny jako wartość miec wpisane FQDN maszyny na której bedą umieszczone namenode oraz jobtracker (w naszym wypadku jest to jedna maszyna)
* zmienna 'hadoop.tmp.dir' powinna wskazywac na istniejacy folder z pełnymi prawami dla użytkownika który uruchamia procesy hadoopa, ważne jest dopisanie ${user.name} na końcu ścieżki - dzięki temu zadania wystawione przez różnych użytkowników nie bedą się mieszały
* parametr 'dfs.replication' definiuje na ilu węzłach ma być replikowany klastrowy system plików
* parametry 'mapred.reduce.tasks', 'mapred.map.tasks', 'mapred.tasktracker.tasks.maximum', 'mapred.tasktracker.map.tasks.maximum', 'mapred.tasktracker.reduce.tasks.maximum' odpowiadaja za ilość wątków reduce i map na poszczególnych węzłach oraz maksymalne ilość wątków na klastrze
* plik conf/masters zawiera liste serwerów (każdy w nowej linii), które zarządzaja replikacja i podziałem pracy w klastrze
* plik conf/slaves zawiera liste wszystkich węzłów na ktorych mogą byc uruchamiane zadania (pośród slaves mogą być umieszczone maszyny z pliku masters)
* jeżeli wszystkie powyższe parametry zostały ustawione (wszystkie zmieniane pliki można zobaczyć w folderze 'cluster') poprawnie generujemy klucze ssh
> ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa && cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
* inicjalizujemy klastrowy system plików
> ./hadoop-0.21.0/bin/hadoop namenode -format
* kopiujemy skonfigurowanego hadoopa oraz klucze ssh na pozostałe węzły klastra
> rsync -avz {hadoop-0.21.0,.ssh} user@adres_serwera
* hadoopa w wydaniu rozproszonym uruchamiamy z maszyny typu master za pomocą polecenia
> ./hadoop-0.21.0/bin/start-dfs.sh && ./hadoop-0.21.0/bin/start-mapred.sh
* bieżący podglad na prace serwera możemy uzyskać wchodząc na adres http://foo:50030
* porty jakie należy odblokować na firewallu to tcp/54310 tcp/54311 tcp/50010 tcp/8020 tcp/50020 tcp/50100 tcp/50030 tcp/50070 tcp/8021 tcp/9001 tcp/8012
