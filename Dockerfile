FROM apache/airflow

RUN pwd
ENV AIRFLOW_HOME=/usr/local/airflow
COPY ./requirements.txt /usr/local/airflow/requirements.txt
RUN pip install -r /usr/local/airflow/requirements.txt
RUN ls /usr/local/airflow/ -al
#RUN chmod 755 /usr/local/airflow/*


COPY ./bootstrap.sh /usr/local/airflow/bootstrap.sh
#RUN chmod +x /usr/local/airflow/bootstrap.sh
ENTRYPOINT ["/usr/local/airflow/bootstrap.sh"]


# uncomment next 2 lines if you want to use 'docker-compose-volume-packages.yml'
# RUN mkdir /usr/local/airflow/packages
# COPY ./packages.pth /usr/local/lib/python3.7/site-packages

# COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
# or change to ./airflow_celeryexecutor.cfg /usr/local/airflow/airflow.cfg
# if you need .cfg with CeleryExecutor
