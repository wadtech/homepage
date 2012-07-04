# == Schema Information
#
# Table name: twitter_feeds
#
#  id         :integer          not null, primary key
#  tweet_id   :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TwitterFeed < ActiveRecord::Base
  attr_accessible :content, :tweet_id

  def self.pull_tweet
    tweet = Twitter.user_timeline("Mellett68").first
    unless exists?(tweet_id: tweet.id)
      create!(tweet_id: tweet.id, content: tweet.text)
    end
  end
end
