require 'spec_helper'
include AdminHelper

describe 'auth' do
  context "logged out" do
    describe "Sign in route" do
      it "should contain the login form" do
        visit '/login'

        ['Email', 'Password', 'Sign in'].each do |thing|
          page.should have_content thing
        end
      end
    end

    describe "Entering valid details" do
      it "should authenticate the user" do
        login_admin
      end
    end
  end

  context "logged in" do
    describe "Sign out link" do
      it "should log the user out when clicked" do
        login_admin

        page.should have_content 'Sign out'
        first(:link, 'Sign out').click

        page.should_not have_content 'New Article'
      end
    end
  end
end
