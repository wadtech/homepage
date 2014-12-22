require 'spec_helper'

describe Article do
  it "has a valid factory" do
    expect(FactoryGirl.create(:article)).to be_valid
  end
  it "is invalid without a title" do
    article = expect(FactoryGirl.build(:article, :title => nil)).not_to be_valid
  end
  it "is invalid without content" do
    article = expect(FactoryGirl.build(:article, :content => nil)).not_to be_valid
  end
  it "has a well-formatted to_param" do
    article = FactoryGirl.build(:article, :id => 25, :title => "Article")
    expect(article.to_param).to eq "25-Article-article"
  end

  it "has a well-formatted created_month attribute" do
    article = FactoryGirl.create(:article)
    expect(article.created_month).to eq Time.now.strftime("%B %Y")
  end
end
