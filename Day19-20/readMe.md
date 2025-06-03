covered topics in Airflow:

DAG (Directed Acyclic Graph)	Defines the workflow structure. It specifies what tasks need to run, when they should run, and in what order.

Task	A single unit of execution within a DAG. Tasks represent the actual steps or actions to be performed.

Operator	The implementation of a task. Operators determine what gets executed — e.g., PythonOperator, BashOperator, EmailOperator.

Sensor	A special kind of operator that waits for a certain condition to be met (e.g., file existence, data availability, external trigger).

XComs (Cross-communication)	A mechanism that allows tasks to exchange small amounts of data — used to share results between tasks.

Variable	Key-value store used to store configuration or environment-specific values globally, which can be accessed by any DAG or task.