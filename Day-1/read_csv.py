import requests
import pandas as pd

# Get data from url
# user_url = "https://dummyjson.com/users"
# def fetch_users():
#     url = user_url
#     response = requests.get(url)

#     if response.status_code == 200:
#         data = response.json()
#         print("Reading User data....")
#         return data['users']
#     else:
#         raise Exception(f"API Error: {response.status_code}")


# Read data from csv
def read_csvs(file_list):
    dfs = {}
    for file in file_list:
        key = file.split('.')[0]
        dfs[key] = pd.read_csv(file)
    return dfs

