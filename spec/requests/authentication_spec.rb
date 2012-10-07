require 'spec_helper'

describe "Sign in link" do
  it "should show the login form when clicked" do
    click_link "Sign in"
    Page.should have_content "Email"
    page.should have_content "Password"
    page.should have_content "Sign in"
  end 
end

describe "Sign out link" do
  it "should log the user out when clicked" do
    login_admin
    click_link "Sign out"

    page.should have_content "sign in"
  end
end