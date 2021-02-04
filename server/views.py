from flask import render_template, request, jsonify
from flask.views import MethodView, View

from realitor import Realitor
from services import ImageMatchService


class IndexView(View):
    def dispatch_request(self):
        return render_template('index.html')


class MatchView(MethodView):
    def post(self):
        # fetch homes from Realitor API
        city = request.json['city']
        state_code = request.json['state']
        api = Realitor()
        listings = api.listings(city, state_code)

        # get property images
        images = []
        for listing in listings:
            images.append(listing['photo'])

        # find matching homes
        image = request.json['image']
        service = ImageMatchService(image)
        scores = service.handle(images)

        # add score field to each listing
        for i, listing in enumerate(listings):
            listing['score'] = scores[i]

        print("Scores: ")
        print(scores)

        response = {
            "listings": listings
        }

        return jsonify(response)
