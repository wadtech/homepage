class TwitterFeed < ActiveRecord::Base
  attr_accessible :content, :tweet_id

  def self.pull_tweet
    tweet = Twitter.user_timeline("Mellett68").first
    unless exists?(tweet_id: tweet.id)
      create!(tweet_id: tweet.id, content: tweet.text)
    end
  end
end
