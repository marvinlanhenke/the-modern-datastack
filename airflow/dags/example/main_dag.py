from airflow.decorators import dag
from airflow.operators.empty import EmptyOperator
from airflow.providers.airbyte.operators.airbyte import AirbyteTriggerSyncOperator
from pendulum import datetime

default_args = {"owner": "marvinlanhenke"}


CONNECTION_ID = "276d2442-4cda-4353-abe1-2d6e048955dd"

@dag(
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule=None,
    catchup=False,
    tags=["dwh", "dbt", "airbyte"],
)
def dwh_airbyte_dbt_example() -> None:
    start = EmptyOperator(task_id="start")

    extract = AirbyteTriggerSyncOperator(
        task_id="airbyte_extract_example",
        airbyte_conn_id="airbyte_conn",
        connection_id=CONNECTION_ID,
    )

    end = EmptyOperator(task_id="end")

    start >> extract >> end  # type: ignore


dwh_airbyte_dbt_example()
