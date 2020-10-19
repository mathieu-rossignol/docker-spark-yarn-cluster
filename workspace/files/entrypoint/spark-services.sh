#!/bin/bash

$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

jps -lm

hdfs dfsadmin -report

hdfs dfs -mkdir -p /apps/spark
zip /usr/local/spark/jars/spark-jars.zip /usr/local/spark/jars/*
hadoop fs -put /usr/local/spark/jars/spark-jars.zip  /apps/spark

$SPARK_HOME/sbin/start-all.sh

hdfs dfs -mkdir -p /tmp/spark/history
hdfs dfs -chmod 777 /tmp/spark/history
$SPARK_HOME/sbin/start-history-server.sh

scala -version
jps -lm



