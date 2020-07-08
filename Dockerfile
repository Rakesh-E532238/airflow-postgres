FROM centos:7
COPY ./requirements.txt /usr/local/airflow/requirements.txt
RUN pip install -r /usr/local/airflow/requirements.txt
RUN yum -y install httpd
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

# Airflow
ARG AIRFLOW_VERSION=1.10.9
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

COPY ./dags /usr/local/airflow/dags
COPY ./test /usr/local/airflow/test
COPY ./config/airflow.cfg /usr/local/airflow/

EXPOSE 8080

CMD ["webserver"]