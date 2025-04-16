from Day3.sql_queries import func_sum_count_avg, \
    func_row_number, func_rank, func_dense_rank, func_partition, \
    func_stored_procedure, func_views

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'random',
    'database': 'Ecommerce'
}

if __name__ == "__main__":
    func_sum_count_avg(db_config)
    func_row_number(db_config)
    func_rank(db_config)
    func_dense_rank(db_config)
    func_partition(db_config)
    func_stored_procedure(db_config)
    func_views(db_config)
    
