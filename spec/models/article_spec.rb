require 'spec_helper'

describe Article do
  it "has a valid factory" do
    FactoryGirl.create(:article).should be_valid
  end
  it "is invalid without a title" do
    article = FactoryGirl.build(:article, :title => nil).should_not be_valid
  end
  it "is invalid without content" do
    article = FactoryGirl.build(:article, :content => nil).should_not be_valid
  end
end