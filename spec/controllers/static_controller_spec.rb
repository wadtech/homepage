require 'spec_helper'

describe StaticController do

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

  describe "GET 'cv'" do
    it "returns http success" do
      get 'cv'
      response.should be_success
    end
  end

end
