import os
import cv2
import pandas as pd
from flask import Flask, request, jsonify
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from scipy.spatial import distance
from google.cloud import vision


from realitor import Realitor
from image_processing import process_image
# from views import MatchView, IndexView

# Google Cloud Credentials
credential_path = "/Users/sterlinggamble/Downloads/home-match-316216-b03a318ee037.json"
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = credential_path

app = Flask(__name__)


@app.route('/test', methods=['POST'])
def test():
    data = request.json
    return jsonify(data)


@app.route('/listing', methods=['GET'])
def listing():
    id = request.args.get('id')
    api = Realitor()
    listing = api.listing(id)
    response = jsonify(listing)
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response


@app.route('/match', methods=['GET'])
def match():
    city = request.args.get('city')
    state_code = request.args.get('state')
    img_url = request.args.get('img_url').encode('iso-8859-1').decode('utf-8')

    api = Realitor()
    listings = api.listings(city, state_code)

    for listing in listings:
        listing.update({
            'tags': [],
            'colors': [],
            'tag_score': 0.0,
            'color_score': 0.0,
            'match_score': 0.0
        })

    listings.append({
        'photo': img_url,
        'tags': [],
        'colors': [],
        'tag_score': 0.0,
        'color_score': 0.0,
        'match_score': 0.0
    })

    # get the tags and colors for each lisitng
    for listing in listings:
        response = google_vision(listing['photo'])
        tags = set()  # to remove duplicate labels
        for label in response.label_annotations:
            tags.add(label.description)

        listing['tags'] += tags
        colors = response.image_properties_annotation.dominant_colors.colors
        for color in colors:
            listing['colors'].append(
                [color.color.red, color.color.green, color.color.blue])

    # TF-IDF Tag Similairty
    tag_df = pd.DataFrame()
    tags_text = []
    for listing in listings:
        text = ""
        for tag in listing['tags']:
            text += tag + " "
        tags_text.append(text)

    tag_df['tags_text'] = tags_text

    tfidf = TfidfVectorizer(stop_words='english')
    tfidf_matrix = tfidf.fit_transform(tag_df['tags_text'])

    cosine_sim = linear_kernel(tfidf_matrix, tfidf_matrix)

    sim_scores = list(enumerate(cosine_sim[-1]))
    for i, score in sim_scores:
        listings[i]['tag_score'] = score

    # Color Similarity
    for listing in listings:
        for color in listing['colors']:
            cos_sim = 1 - distance.cosine(color, listings[-1]['colors'][0])
            listing['color_score'] = max(listing['color_score'], cos_sim)

    # OpenCV algorithm
    source_img = process_image(img_url)
    source_orb = cv2.ORB_create(nfeatures=1000)
    source_kp, source_des = source_orb.detectAndCompute(source_img, None)
    source_bf = cv2.BFMatcher()

    for listing in listings:
        img = process_image(listing['photo'])
        kp, des = source_orb.detectAndCompute(img, None)
        matches = source_bf.knnMatch(source_des, des, k=2)

        good = []
        for m, n in matches:
            if m.distance < 0.75*n.distance:
                good.append([m])

        listing['match_score'] = len(good)

    response = jsonify(
        sorted(
            listings[:-1],
            key=lambda x: x['tag_score']+x['color_score']+x['match_score'],
            reverse=True
        ))
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response


def google_vision(image_url):
    client = vision.ImageAnnotatorClient()

    source = {"image_uri": image_url}
    image = {"source": source}
    features = [
        {"type_": vision.Feature.Type.LABEL_DETECTION},
        {"type_": vision.Feature.Type.IMAGE_PROPERTIES},
    ]

    return client.annotate_image({'image': image, 'features': features})


if __name__ == 'main':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
