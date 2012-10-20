require 'spec_helper'

describe "Twitter feed", :broken => true do
  it "should only store a new tweet in the database" do
    TwitterFeed.first.should be_nil
    TwitterFeed.pull_tweet
    TwitterFeed.first.should_not be_nil
    TwitterFeed.pull_tweet
    TwitterFeed.all.count.should eq 1
  end
end