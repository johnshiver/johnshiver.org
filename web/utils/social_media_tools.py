from collections import namedtuple
import logging
import os

from dateutil import parser
from django.core.cache import cache

from github import Github
from instagram.client import InstagramAPI
from tweepy import OAuthHandler, API


logger = logging.getLogger(__name__)

Push = namedtuple("Push", ["repo_name", "repo_url", "message",
                           "date", "number_of_commits"])

class SocialMedia(object):
    def __init__(self):
        self.gram_access_token = os.environ.get('gram_access_token')
        self.consumer_key = os.environ.get('consumer_key')
        self.consumer_secret = os.environ.get('consumer_secret')
        self.access_token = os.environ.get('access_token')
        self.access_token_secret = os.environ.get('access_token_secret')

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
            grams = gram_package

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
            tweets = pay_load
        return tweets

    @property
    def commits(self):
        logger.info("this is a test log")
        commits = cache.get('commits')
        if not commits:
            commits = []
            github_user = os.getenv("github_user")
            github_pw = os.getenv("github_pw")
            try:
                github_api = Github(github_user, github_pw)
            except Exception as e:
                print("Error contacting github {}".format(e))
                return []
            my_user = github_api.get_user("johnshiver")
            recent_commits = [x for x in my_user.get_public_events()
                              if x.type == "PushEvent"]
            for commit in recent_commits:
                repo_name = commit.raw_data["repo"]["name"]
                repo_url = commit.raw_data["repo"]["url"]
                repo_url = repo_url.replace("api.", "")
                repo_url = repo_url.replace("repos/", "")
                number_of_commits = len(commit.raw_data["payload"]["commits"])
                message = commit.raw_data["payload"]["commits"][0]["message"]
                date = parser.parse(commit.raw_data["created_at"])
                commits.append(Push(repo_name=repo_name,
                                    repo_url=repo_url,
                                    message=message,
                                    date=date,
                                    number_of_commits=number_of_commits))
            cache.set('commits', commits[:5], 300)
        return commits


