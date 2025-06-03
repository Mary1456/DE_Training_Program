import pandas as pd
import mysql.connector

def fetch_from_db(last_id):
    conn = mysql.connector.connect(
        user='root',
        password='newpassword123', 
        host='mysql', 
        database='Ecommerce')
    print("Connected to DB")
    cursor = conn.cursor()
    cursor.execute("SELECT DATABASE();")
    print("Current DB:", cursor.fetchone())    
    query = f"SELECT * FROM `Ecommerce`.`Users` WHERE id > {last_id}"

    print("Printing query from DB", query)
    df = pd.read_sql(query, conn)
    print("Printing data from DB", df)
    return df
