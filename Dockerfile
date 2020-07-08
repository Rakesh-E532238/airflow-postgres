FROM centos:7
CMD pwd

RUN yum -y install httpd
RUN yum makecache
RUN yum install epel-release -y
RUN yum install python36-setuptools -y
RUN easy_install-3.6 pip
#RUN python36 -m pip --version
#RUN yum install python34-pip -y
#RUN yum install gcc python34-devel.x86_64 gcc-c++

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

COPY ./requirements.txt /usr/local/airflow/requirements.txt

RUN pip install -r /usr/local/airflow/requirements.txt


# Airflow
ARG AIRFLOW_VERSION=1.10.9
ARG AIRFLOW_USER_HOME=/usr/local/airflow
ENV AIRFLOW_HOME=${AIRFLOW_USER_HOME}

COPY ./dags /usr/local/airflow/dags
COPY ./test /usr/local/airflow/test
COPY ./config/airflow.cfg /usr/local/airflow/

EXPOSE 8080

#CMD [webserver]