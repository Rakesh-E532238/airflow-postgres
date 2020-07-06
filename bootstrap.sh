sudo chown -R ubuntu /usr/local/airflow
sudo chgrp -R ubuntu /usr/local/airflow
# if [ "$1" = "webserver" ]
# then
#     exec airflow webserver
# fi
# ​
# if [ "$1" = "scheduler" ]
# then
#     exec airflow scheduler
# fi