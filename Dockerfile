FROM python:3.7-slim-buster
COPY ./requirements.txt /usr/local/airflow/requirements.txt
RUN pip install -r /usr/local/airflow/requirements.txt
ENV AIRFLOW_HOME=/usr/local/airflow

COPY ./dags /usr/local/airflow/dags
COPY ./test /usr/local/airflow/test
COPY ./config/airflow.cfg /usr/local/airflow/
EXPOSE 8080

CMD ["webserver"]