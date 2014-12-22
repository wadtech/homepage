require 'spec_helper'

describe Page do
  it "has a valid factory" do
    FactoryGirl.create(:page)
  end
  it "is invalid without a permalink" do
    page = expect(FactoryGirl.build(:page, :permalink => nil)).not_to be_valid
  end
  it "is invalid without content" do
    page = expect(FactoryGirl.build(:page, :content => nil)).not_to be_valid
  end

  it "must have a unique permalink" do
    FactoryGirl.create(:page, :permalink => "Duplicate")
    expect(FactoryGirl.build(:page, :permalink => "Duplicate")).not_to be_valid
  end

  context "URL" do
    it "should match the permalink" do
      page = FactoryGirl.build(:page)
      expect(page.to_param).to eq page.permalink.downcase
    end
  end
end