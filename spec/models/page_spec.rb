require 'spec_helper'

describe Page do
  it "has a valid factory" do
    FactoryGirl.create(:page)
  end
  it "is invalid without a permalink" do
    page = FactoryGirl.build(:page, :permalink => nil).should_not be_valid
  end
  it "is invalid without content" do
    page = FactoryGirl.build(:page, :content => nil).should_not be_valid
  end
end