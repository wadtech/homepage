require 'spec_helper'

describe Article do
      before(:each) do
    @attr = { 
      :title => "Sample Title",
      :author => "Author",
      :content => "Sample content of multiple characters.",
      :published => true,
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Admin.create!(@attr)
  end
end