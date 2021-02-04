import os

from flask import Flask
from views import MatchView, IndexView

app = Flask(__name__)

app.add_url_rule(
    '/api/match',
    view_func=MatchView.as_view('match_home'),
    methods=['POST']
)

app.add_url_rule(
    '/',
    view_func=IndexView.as_view('index'),
    methods=['GET']
)

if __name__ == 'main':
    port = int(os.environ.get("PORT", 5000))
    app.run(host='0.0.0.0', port=port)
