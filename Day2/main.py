from sql_joins import get_product_category

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'random',
    'database': 'Shopping'
}

if __name__ == "__main__":
    get_product_category(db_config)
