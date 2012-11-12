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

  it "has the correct to_param value" do
    project = FactoryGirl.build(:project)
    project.to_param.should eq project.title.parameterize
  end

  it "database record can be found by title" do
    %w[Todo Blog].each do |title|
      FactoryGirl.create(:project, :title => title)
    end
    Project.find("todo").title.should eq "Todo"
    Project.find("blog").title.should eq "Blog"
  end
end