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
  it "has a well-formatted to_param" do
    article = FactoryGirl.build(:article, :id => 25, :title => "Article")
    article.to_param.should eq "25-Article-article"
  end

  it "has a well-formatted created_month attribute" do
    article = FactoryGirl.create(:article)
    article.created_month.should eq Time.now.strftime("%B %Y")
  end
end