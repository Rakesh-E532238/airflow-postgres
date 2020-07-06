FROM apache/airflow
RUN ls
RUN pwd
ENV AIRFLOW_HOME=/usr/local/airflow
COPY ./requirements.txt /usr/local/airflow/requirements.txt
RUN pip install -r /usr/local/airflow/requirements.txt

#COPY bootstrap.sh /bootstrap.sh
#RUN chmod +x /bootstrap.sh
#ENTRYPOINT ["/bootstrap.sh"]


# uncomment next 2 lines if you want to use 'docker-compose-volume-packages.yml'
# RUN mkdir /usr/local/airflow/packages
# COPY ./packages.pth /usr/local/lib/python3.7/site-packages

# COPY ./airflow.cfg /usr/local/airflow/airflow.cfg
# or change to ./airflow_celeryexecutor.cfg /usr/local/airflow/airflow.cfg
# if you need .cfg with CeleryExecutor
