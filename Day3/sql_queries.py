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
                MIN(price) OVER
                    (PARTITION BY category_id ORDER BY id) AS product_min
                MAX(price) OVER
                    (PARTITION BY category_id ORDER BY id) AS product_max
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


def trigger(db_config):
    conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
    cursor = conn.cursor()


    query = """
        INSERT INTO Users (first_name, last_name, email)
        VALUES (%s, %s, %s)
    """
    data = ("Bhavana", "Mishra","bhavanamishra@gmail.com")

    try:
        cursor.execute(query, data)
        conn.commit()
        print("Inserted user (trigger should auto-uppercase name).")
    except mysql.connector.Error as err:
        print(f"Error inserting user:\n{err}")
    finally:
        cursor.close()
        conn.close()



# Percent_rank
"""
SELECT 
    id,
    name,
    price,
    PERCENT_RANK() OVER (ORDER BY price DESC) AS price_percentile
FROM Products
LIMIT 10;
"""

# NTILE
"""
SELECT 
    id,
    name,
    price,
    NTILE(4) OVER (ORDER BY price DESC) AS price_quartile
FROM Products
"""

#CUME_DISCT()
'''
SELECT 
    id,
    name,
    price,
    CUME_DIST() OVER (ORDER BY price DESC) AS price_rank
FROM Products;
'''

#FIRST_VALUE()
'''
SELECT 
    category_id,
    name,
    price,
    FIRST_VALUE(name) OVER (
        PARTITION BY category_id ORDER BY price DESC
    ) AS top_product_per_category
FROM Products;
'''

#LAST_VALUE()
'''
SELECT 
    id,
    name,
    price,
    LAST_VALUE(name) OVER (
        ORDER BY price 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS cheapest_product
FROM Products;
'''

#NTH_VALUE()
'''
SELECT 
    id,
    name,
    price,
    NTH_VALUE(name, 3) OVER (
        ORDER BY price 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS third_cheapest
FROM Products;
'''

#LEAD()
'''
SELECT 
    id,
    name,
    price,
    LEAD(price, 1) OVER (ORDER BY price) AS next_price
FROM Products;
'''

#LAG()
'''
SELECT 
    id,
    name,
    price,
    LAG(price, 1) OVER (ORDER BY price) AS previous_price
FROM Products;
'''

# Union_all()
"""
SELECT 
    id,
    name,
    price
FROM Products

UNION ALL

SELECT 
    id AS id,
    user_id AS name,
    NULL AS price
FROM Orders

UNION ALL

SELECT 
    id AS id,
    name AS name,
    NULL AS price
FROM Categories

UNION ALL

-- From Users Table
SELECT 
    id AS id,
    first_name AS name,
    NULL AS price
FROM Users;
"""


# Stored Procedure
'''
CALL get_orders_by_user(1);


CALL get_filtered_orders(1, 100, 1500);

'''


# Views
'''
select * from detailed_order_view;
'''