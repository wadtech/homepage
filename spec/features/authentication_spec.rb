require 'spec_helper'
include AdminHelper

describe "Signing in links" do
  context "logged out" do
    describe "Sign in link" do
      it "should show the login form when clicked" do
        visit root_url

        click_link 'Sign in'

        page.should have_content 'Email'
        page.should have_content 'Password'
        page.should have_content 'Sign in'
      end
    end
  end

  context "logged in" do
    describe "Sign out link" do
      it "should log the user out when clicked" do
        login_admin

        page.should have_content 'Sign out'
        click_link 'Sign out'

        page.should have_content 'Sign in'
      end
    end
  end

  context "logging on" do
    describe "Entering valid details" do
      it "should authenticate the user" do
        login_admin
      end
    end
  end
end

