import write_csv , read_csv

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': 'random'
}

# main.py
if __name__ == "__main__":
    files = ['Categories.csv', 'Orders.csv', 'Products.csv', 'Users.csv']
    dataframes = read_csv.read_csvs(files)
    write_csv.db_creation(files,db_config,'Shopping')
    write_csv.generate_report(dataframes, output_file="final_report.xlsx")
    

