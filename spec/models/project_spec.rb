require 'spec_helper'

describe Project do
  it "has a valid factory" do
    FactoryGirl.create(:project)
  end
  it "is invalid without a title" do
    FactoryGirl.build(:project, :title => nil).should_not be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:project, :description => nil).should_not be_valid
  end
end