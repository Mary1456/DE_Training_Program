-- Started with Airflow


-- Airflow Architecture and its core components:

    DAG (Directed Acyclic Graph) – Defines the workflow structure and task dependencies

    Metadata Database – Stores information about DAG runs, task states, and more

    Scheduler – Continuously monitors DAGs and schedules tasks based on defined intervals

    Executor – Responsible for running the tasks (LocalExecutor, CeleryExecutor, etc.)

    Worker – Executes the actual task instances (mainly used with CeleryExecutor)

    Webserver – UI to monitor DAGs, trigger runs, and check logs and statuses


Understood how tasks flow in Airflow from definition → scheduling → execution
