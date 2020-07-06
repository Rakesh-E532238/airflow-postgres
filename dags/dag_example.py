from __future__ import print_function
# import sys
# sys.path.insert(0,"/usr/local/airflow/dags/subfolder/index.py")
from subfolder import index
import time
from builtins import range
from pprint import pprint

from airflow.utils.dates import days_ago

from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator

args = {
    'owner' : 'Airflow',
    'start_date' : days_ago(2),
    }

dag = DAG(
    dag_id = 'example_python_operator',
    default_args = args,
    schedule_interval = None
    # end_date = days_ago(4)
    )

def print_context(**kwargs):
    pprint(kwargs)
    # print("hi!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
    return 'hi!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! Whatever you print gets printed in the logs'

run_this = PythonOperator(
    task_id = 'python_script',
    python_callable=index.hello,
    dag=dag,
    )

# def my_sleeping_function(randome_base):
#     time.sleep(random_base)

# for i in range(4):
#     task = PythonOperator(
#         task_id='sleep_for_' + str(i),
#         python_callable=my_sleeping_function,
#         op_kwargs={'randome_base':float(i)/10},
#         dag=dag,
#         )

run_this
