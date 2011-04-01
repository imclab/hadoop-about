#!/usr/bin/env bash

export HADOOP_HOME=/home/dogrizz/tools/hadoop-0.21.0
export HERE=`pwd`

if [ $# = "1" ] && [ $1 = "-c" ]
then
	echo Clean
	$HADOOP_HOME/bin/hadoop dfs -rmr testData
	$HADOOP_HOME/bin/hadoop dfs -rmr testData-output
else
	echo Test
    $HADOOP_HOME/bin/hadoop dfs -copyFromLocal $HERE/* testData
	  $HADOOP_HOME/bin/hadoop jar MapReduce.jar MapReduce -input testData -output testData-output
	  $HADOOP_HOME/bin/hadoop dfs -cat testData-output/part-00000
fi

