#!/usr/bin/env bash

export HADOOP_HOME=/home/dogrizz/tools/hadoop-0.21.0
export HERE=`pwd`

if [ $# = "1" ] && [ $1 = "-c" ]
then
	echo Clean                                                                                                                                                                                      
	$HADOOP_HOME/bin/hadoop dfs -rmr testAcker
	$HADOOP_HOME/bin/hadoop dfs -rmr testAcker-output 
else
	echo Test
	$HADOOP_HOME/bin/hadoop dfs -copyFromLocal $HERE/ackerData.txt testAcker
	$HADOOP_HOME/bin/hadoop jar $HADOOP_HOME/mapred/contrib/streaming/hadoop-0.21.0-streaming.jar -file $HERE/map_a.py -mapper $HERE/map_a.py -input testAcker -output testAcker-output -reducer NONE
	$HADOOP_HOME/bin/hadoop dfs -cat testAcker-output/part-00000
fi

