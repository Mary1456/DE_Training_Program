-- Commands to run the files using spark-submit

1. Bronze 
    customer - spark-submit --packages mysql:mysql-connector-java:8.0.28 bronze_ingestion.py   jdbc:mysql://localhost:3308/ecommerce_db   ecomuser   ecompassword   customers   ../data_lake/bronze

    products- spark-submit --packages mysql:mysql-connector-java:8.0.28 bronze_ingestion.py   jdbc:mysql://localhost:3308/ecommerce_db   ecomuser   ecompassword   products   ../data_lake/bronze/

    orders- spark-submit --packages mysql:mysql-connector-java:8.0.28 bronze_ingestion.py   jdbc:mysql://localhost:3308/ecommerce_db   ecomuser   ecompassword   orders   ../data_lake/bronze

2. Silver
    spark-submit silver_processing.py ../data_lake/bronze/mysql ../data_lake/silver 2025-06-05

3. Gold
    spark-submit gold_aggregation.py ../data_lake/silver ../data_lake/gold 2025-06-05

4. Load to warehouse 
    spark-submit   --jars ./jars/postgresql-42.6.0.jar   ./load_to_warehouse.py   ../data_lake/gold/product_daily_performance   jdbc:postgresql://localhost:5433/ecommerce_warehouse   dw_user   dw_password   public.fact_orders   2025-06-05


-- Docker commands

1. docker compose down -v && docker compose up --build -d :- To remove the volume, build the docker compose file and run in detach mode

2. docker compose ps :- list all the running container

3. docker compose exec -it spark-master bash :- Go inside the container

4. 


-- Common commands

1. psql -h postgres_dw -p 5432 -U dw_user -d ecommerce_warehouse :- Use the ecommere_warehouse db in postgres

2. sudo chmod -R 777 ./data_lake :- Provide full access to all folders and files inside the data_lake folder

3. sudo chown -R neosoft:neosoft ./data_lake :- Change ownership to all folders and files inside the data_lake folder

4. sudo chown -R 1000:1000 ./data_lake :- Manually to UID 1000

5. sudo chown -R $UID:$UID ./data_lake :- Dynamically to your current user

6. wget https://jdbc.postgresql.org/download/postgresql-42.6.0.jar -P ./pyspark_apps/jars/ :- Install the postgres jar file

7. ls -lh /data_lake/mysql/products/2025/06/04 :- check the permission of the folder/file