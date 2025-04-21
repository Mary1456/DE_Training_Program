import mysql.connector

# Inner Join
def get_product(db_config):
    try:
        # Connect to DB
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()
        print("connection established")

        query = """
            SELECT DISTINCT
                u.id AS user_id,
                u.first_name,
                u.last_name,
                o.quantity,
                p.name
            FROM Orders o
            INNER JOIN Users u ON o.user_id = u.id
            INNER JOIN Products p ON o.product_id = p.id
            ORDER BY u.id
            LIMIT 10;
        """
        print("SQL INNER JOINS")
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


# Left Join
def get_min_quantity(db_config, min_quantity):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = f"""
            SELECT DISTINCT
                u.id AS user_id,
                u.first_name,
                u.last_name,
                o.quantity,
                o.order_date
            FROM Users u
            LEFT JOIN Orders o ON u.id = o.user_id
            WHERE o.quantity >= {min_quantity}
            ORDER BY u.id
            LIMIT 10;
        """
        print("SQL LEFT JOINS")
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


# Right Join
def filter_name(db_config, user_name):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = f"""
            SELECT DISTINCT
                u.id AS user_id,
                u.first_name,
                u.last_name,
                o.quantity,
                o.order_date
            FROM Orders o
            RIGHT JOIN Users u ON o.user_id = u.id
            WHERE u.first_name = '{user_name}'
            ORDER BY u.id
            LIMIT 10;
        """
        print("SQL RIGHT JOINS")
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


# Self Join
def filter_lastname(db_config):
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
                u1.id AS user1_id,
                u1.first_name AS user1_first,
                u1.last_name AS shared_last_name,
                u2.id AS user2_id,
                u2.first_name AS user2_first
            FROM Users u1
            JOIN Users u2 
                ON u1.last_name = u2.last_name 
                AND u1.id != u2.id
            LIMIT 10;
        """
        print("SQL SELF JOINS")
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


# cross Join
def get_user_product(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT *
            FROM Users
            CROSS JOIN Products
            LIMIT 10;
        """
        print("SQL CROSS JOINS")
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


# Union
def get_union(db_config):
    try:
        conn = mysql.connector.connect(
            host=db_config['host'],
            user=db_config['user'],
            password=db_config['password'],
            database=db_config['database']
        )
        cursor = conn.cursor()

        query = """
            SELECT id, name, price FROM Products WHERE price > 1000
            UNION
            SELECT id, name, price FROM Products WHERE price < 500;
        """
        print("SQL UNION")
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


# Left Anti Join
# Get the list of customer who never ordered
'''
SELECT *
FROM Customers cst
LEFT ANTI JOIN Orders ord
ON cst.CustomerID = ord.CustomerID;
'''


# RIGHT Anti Join
'''
SELECT *
FROM Customers cst
RIGHT ANTI JOIN Orders ord
ON cst.CustomerID = ord.CustomerID;
'''
