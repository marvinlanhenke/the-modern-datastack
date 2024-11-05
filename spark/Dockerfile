FROM bitnami/spark:3.4.1

USER root

RUN apt update && apt install wget -y
RUN wget https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.4_2.12/1.3.1/iceberg-spark-runtime-3.4_2.12-1.3.1.jar -P /opt/bitnami/spark/jars
