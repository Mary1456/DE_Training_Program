import mysql.connector

def get_product_category(db_config):
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
        print("✨ Executing query...")
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
