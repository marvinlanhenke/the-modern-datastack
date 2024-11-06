from airflow.decorators import dag
from airflow.operators.empty import EmptyOperator
from pendulum import datetime

default_args = {"owner": "marvinlanhenke"}


@dag(
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule=None,
    catchup=False,
    tags=["dwh", "dbt", "airbyte"],
)
def dwh_airbyte_dbt_example() -> None:
    start = EmptyOperator(task_id="start")
    end = EmptyOperator(task_id="end")

    start >> end  # type: ignore


dwh_airbyte_dbt_example()
