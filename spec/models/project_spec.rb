require 'spec_helper'

describe Project do
  it "has a valid factory" do
    FactoryGirl.create(:project)
  end
  it "is invalid without a title" do
    expect(FactoryGirl.build(:project, :title => nil)).not_to be_valid
  end
  it "is invalid without a description" do
    expect(FactoryGirl.build(:project, :description => nil)).not_to be_valid
  end

  it "has the correct to_param value" do
    project = FactoryGirl.build(:project)
    expect(project.to_param).to eq project.title.parameterize
  end

  it "database record can be found by title" do
    %w[Todo Blog].each do |title|
      FactoryGirl.create(:project, :title => title)
    end
    expect(Project.find("todo").title).to eq "Todo"
    expect(Project.find("blog").title).to eq "Blog"
  end
end
