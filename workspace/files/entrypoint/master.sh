#!/bin/bash

service ssh start; cd $SPARK_HOME; sh /app/workspace/files/entrypoint/spark-services.sh; bash