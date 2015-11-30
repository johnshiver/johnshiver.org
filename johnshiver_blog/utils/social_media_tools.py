import os

from dateutil import parser
from django.core.cache import cache
from instagram.client import InstagramAPI
from tweepy import OAuthHandler, API


class SocialMedia(object):
    def __init__(self):

        self.gram_access_token = os.environ.get('gram_access_token', None)
        self.consumer_key = os.environ.get('consumer_key', None)
        self.consumer_secret = os.environ.get('consumer_secret', None)
        self.access_token = os.environ.get('access_token', None)
        self.access_token_secret = os.environ.get('access_token_secret', None)

    @property
    def grams(self):
        grams = cache.get('grams')
        if not grams:
            gram_api = InstagramAPI(access_token=self.gram_access_token)
            grams, nex = gram_api.user_recent_media(user_id='11728698',
                                                    count=4)
            gram_package = []

            for gram in grams:
                gram_json = {}
                photo = str(gram.images['thumbnail'])
                photo = photo[7:]
                gram_json['photo'] = photo
                gram_json['url'] = gram.link
                gram_package.append(gram_json)

            cache.set('grams', gram_package, 300)
            return gram_package
        else:
            return grams

    @property
    def tweets(self):
        tweets = cache.get('tweets')
        if not tweets:
            auth = OAuthHandler(self.consumer_key, self.consumer_secret)
            auth.set_access_token(self.access_token, self.access_token_secret)
            api = API(auth)

            tweets = api.user_timeline(screen_name='TrustyJohn', count=5)

            pay_load = []
            for tweet in tweets:
                tweet_json = {'text': tweet._json['text']}
                date = tweet._json['created_at']
                tweet_json['date'] = parser.parse(date)
                pay_load.append(tweet_json)
            cache.set('tweets', pay_load, 300)
            return pay_load
        return tweets