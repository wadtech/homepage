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

require 'spec_helper'

describe TwitterFeed do
  pending "add some examples to (or delete) #{__FILE__}"
end
