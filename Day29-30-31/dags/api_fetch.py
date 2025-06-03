import requests

def fetch_from_api(last_updated):
    # url = "https://mockapi.com/data"
    # params = {"updated_after": last_updated}
    # response = requests.get(url, params=params)
    # return response.json()
    url = "https://jsonplaceholder.typicode.com/posts"
    response = requests.get(url)
    response.raise_for_status()
    return response.json()

