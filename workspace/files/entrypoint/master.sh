#!/bin/bash

sh /app/workspace/files/entrypoint/spark-services.sh

service ssh start; cd $SPARK_HOME; bash
