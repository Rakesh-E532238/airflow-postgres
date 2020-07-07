RUN chmod +x /usr/local/airflow/unittests.cfg
sudo chown -R airflow /usr/local/airflow
sudo chgrp -R airflow /usr/local/airflow

# if [ "$1" = "webserver" ]
# then
#     exec airflow webserver
# fi
# ​
# if [ "$1" = "scheduler" ]
# then
#     exec airflow scheduler
# fi