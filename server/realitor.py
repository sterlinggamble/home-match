import requests
from settings import REALITOR_KEY


class Realitor:
    def __init__(self):
        self.url = "https://realtor.p.rapidapi.com/properties/list-for-sale"
        self.headers = {
            'x-rapidapi-key': REALITOR_KEY,
            'x-rapidapi-host': "realtor.p.rapidapi.com"
        }

    def listings(self, city, state_code):
        query_string = {
            "city": city,
            "offset": "0",
            "limit": "2",
            "state_code": state_code,
            "sort": "relevance"
        }

        response = requests.request(
            "GET",
            self.url,
            headers=self.headers,
            params=query_string
        )

        json = response.json()
        # print(json["listings"])

        return json["listings"]
