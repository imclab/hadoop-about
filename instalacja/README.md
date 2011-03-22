Instalacja Hadoop'a
===================

single-instace
--------------
* ściągamy hadoop ze [strony](http://hadoop.apache.org/common/releases.html) fundacji apache (w momencie pisania tego tekstu stabilne wydanie to 0.21.0)
> wget http://ftp.tpnet.pl/vol/d1/apache//hadoop/core/hadoop-0.21.0/hadoop-0.21.0.tar.gz
* rozpakowujemy
> tar xvzpf hadoop-0.21.0.tar.gz
* jeżeli instalujemy hadoopa na serwerze innym niz sigma nalezy zadpac o ustawienie zmiennej JAVA HOME w pliku conf/hadoop-env.sh
* w folderze conf/ pliki core-site.xml, hdfs-site.xml, mapred-site.xml, edytujemy zgodnie z wzorcowymi plikami umieszczonymi w folderze single-instance/, nalezy pamietac o ustawieniu unikalnych portów
* generujemy klucze ssh
> ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa 
> cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
