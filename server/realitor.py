import requests
from settings import REALITOR_KEY


class Realitor:
    def __init__(self):
        self.headers = {
            'x-rapidapi-key': REALITOR_KEY,
            'x-rapidapi-host': "realtor.p.rapidapi.com"
        }

    def listings(self, city, state_code):
        query_string = {
            "city": city,
            "offset": "0",
            "limit": "20",
            "state_code": state_code,
            "sort": "relevance"
        }

        url = "https://realtor.p.rapidapi.com/properties/list-for-sale"

        response = requests.request(
            "GET",
            url,
            headers=self.headers,
            params=query_string
        )

        json = response.json()
        # print(json["listings"])

        return json["listings"]

    def listing(self, property_id):
        query_string = {"property_id": property_id}

        url = "https://realtor.p.rapidapi.com/properties/v2/detail"

        response = requests.request(
            "GET",
            url,
            headers=self.headers,
            params=query_string
        )

        json = response.json()
        return json["properties"][0]
