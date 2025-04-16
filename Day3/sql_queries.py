import mysql.connector

# Windows Functions
# SUM, COUNT, AVG
def func_sum_count_avg(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT DISTINCT name, 
                SUM(price) OVER
                    (PARTITION BY category_id ORDER BY id) AS product_total,
                COUNT(price) OVER
                    (PARTITION BY category_id ORDER BY id) AS product_count,
                AVG(price) OVER
                    (PARTITION BY category_id ORDER BY id) AS product_avg
            FROM Products
            LIMIT 10
        """
        print("Windows Functions SUM, COUNT, AVG")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results

    except mysql.connector.Error as e:
        print("Database error:", e)


# Windows Functions
# ROW_NUMBER()
def func_row_number(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT 
                id, 
                name, 
                price,
                ROW_NUMBER() OVER (ORDER BY price DESC) AS price_row
            FROM (
                SELECT DISTINCT id, name, price
                FROM Products
            ) AS unique_products
            LIMIT 10;
        """
        print("Windows Functions ROW NUMBER()")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results

    except mysql.connector.Error as e:
        print("Database error:", e)


# Windows Functions
# RANK()
def func_rank(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT 
                name, 
                price,
                RANK() OVER (ORDER BY price DESC) AS price_row
            FROM Products
            LIMIT 10;
        """
        print("Windows Functions RANK()")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results

    except mysql.connector.Error as e:
        print("Database error:", e)

# Windows Functions
# DENSE_RANK()
def func_dense_rank(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT 
                id, 
                name, 
                price,
                DENSE_RANK() OVER (ORDER BY price DESC) AS price_row
            FROM (
                SELECT DISTINCT id, name, price
                FROM Products
            ) AS unique_products
            LIMIT 10;
        """
        print("Windows Functions DENSE_RANK()")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results

    except mysql.connector.Error as e:
        print("Database error:", e)


# PARTITION()
def func_partition(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT id, name, 
                ROW_NUMBER() OVER
                    (PARTITION BY category_id ORDER BY id) AS product_partition
            FROM (
                SELECT DISTINCT id, name, price, category_id
                FROM Products
            ) AS unique_products
            LIMIT 10
        """
        print("Windows Functions PARTITION()")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results

    except mysql.connector.Error as e:
        print("Database error:", e)


# STORED PROCEDURE()
def func_stored_procedure(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        print("STORED PROCEDURE()")
        cursor.callproc('get_user_details')  

        for result in cursor.stored_results():
            rows = result.fetchall()
            columns = [desc[0] for desc in result.description]
            print(" | ".join(columns))
            print("-" * 60)
            for row in rows:
                print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()


    except mysql.connector.Error as e:
        print("Database error:", e)

# VIEWS()
def func_views(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT * from get_product
        """
        print("SQL VIEWS")
        cursor.execute(query)
        results = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        print(" | ".join(columns))
        print("-" * 60)
        for row in results:
            print(" | ".join(map(str, row)))

        cursor.close()
        conn.close()
        return results


    except mysql.connector.Error as e:
        print("Database error:", e)