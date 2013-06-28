class TwitterFeed < ActiveRecord::Base
  def self.pull_tweet
    tweet = Twitter.user_timeline(Settings.twitter.name).first
    unless exists?(tweet_id: tweet.id)
      create!(tweet_id: tweet.id, content: tweet.text)
    end
  end
end
