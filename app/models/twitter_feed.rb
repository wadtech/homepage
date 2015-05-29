class TwitterFeed < ActiveRecord::Base
  def self.pull_tweet
    return unless ENV['TWITTER_NAME']

    tweet = Twitter.user_timeline(ENV['TWITTER_NAME']).first
    unless exists?(tweet_id: tweet.id)
      create!(tweet_id: tweet.id, content: tweet.text)
    end
  end
end
