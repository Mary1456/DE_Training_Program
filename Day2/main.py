from sql_joins import get_product, get_min_quantity, filter_name, \
    filter_lastname, get_user_product, get_union

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'random',
    'database': 'Ecommerce'
}

if __name__ == "__main__":
    get_product(db_config)
    get_min_quantity(db_config, 5)
    filter_name(db_config, 'Cari')
    filter_lastname(db_config)
    get_user_product(db_config)
    get_union(db_config)
    
