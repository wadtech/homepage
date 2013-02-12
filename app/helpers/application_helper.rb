module ApplicationHelper
  require 'markdown_helper'
  require 'title_helper'

  def avatar(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def latest_tweet(account)
    tweet = TwitterFeed.order("tweet_id desc").first
    tweet.nil? ? "No relevant tweets yet!" : tweet.content
  end

  def messages_text
    unread_total = Contact.where(:archived => false).length
    unread_total == 0 ? "Messages" : "Messages (#{unread_total})"
  end
end
