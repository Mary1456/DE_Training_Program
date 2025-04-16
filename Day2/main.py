from sql_joins import get_product, get_min_quantity, filter_name, \
    filter_lastname, get_user_product, get_union, func_sum_count_avg, \
    func_row_number, func_rank, func_dense_rank, func_partition, \
    func_stored_procedure, func_views

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
    func_sum_count_avg(db_config)
    func_row_number(db_config)
    func_rank(db_config)
    func_dense_rank(db_config)
    func_partition(db_config)
    func_stored_procedure(db_config)
    func_views(db_config)
    
