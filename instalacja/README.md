Instalacja Hadoop'a
===================

single-instace
--------------
* ściągamy hadoop ze [strony](http://hadoop.apache.org/common/releases.html) fundacji apache (w momencie pisania tego tekstu stabilne wydanie to 0.21.0)
> wget http://ftp.tpnet.pl/vol/d1/apache//hadoop/core/hadoop-0.21.0/hadoop-0.21.0.tar.gz
* rozpakowujemy
> tar xvzpf hadoop-0.21.0.tar.gz
* nalezy zadpac o ustawienie zmiennej JAVA HOME w pliku conf/hadoop-env.sh, w wypadku sigmy jest poprawnie wpis powinien wyglądać tak:
> export JAVA_HOME=/usr/lib/jvm/java
* w folderze conf/ pliki core-site.xml, hdfs-site.xml, mapred-site.xml, edytujemy zgodnie z wzorcowymi plikami umieszczonymi w folderze single-instance/, nalezy pamietac o ustawieniu unikalnych portów
* generujemy klucze ssh
> ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa 

> cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

* hadoopa z poziomu folderu domowego mozemy uruchomic poleceniem:
> ./hadoop-0.21.0/bin/start-all.sh
* a zatrzymać:
> ./hadoop-0.21.0/bin/stop-all.sh
* wszystkie pliki modyfikowane na potrzeby instalacji są umieszczone w folderze 'single-instance'
