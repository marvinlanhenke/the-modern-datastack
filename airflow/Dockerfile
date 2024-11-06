FROM apache/airflow:2.10.0

USER airflow

RUN pip install --upgrade pip
RUN pip install apache-airflow-providers-http
RUN pip install apache-airflow-providers-airbyte==3.9.0
RUN pip install apache-airflow-providers-airbyte[http]
