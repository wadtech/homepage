require 'spec_helper'
include AdminHelper

describe 'auth' do
  context "with no session" do
    describe "visiting the 'sign in' route" do
      it "should contain the login form" do
        visit '/articles/new'

        ['Email', 'Password', 'Sign in'].each do |thing|
          expect(page).to have_content thing
        end
      end
    end

    describe "Entering valid details" do
      it "should authenticate the user" do
        login_admin
      end
    end
  end

  context "with active sesssion" do
    describe "clicking the 'sign out' link" do
      it "should log the user out when clicked" do
        login_admin

        expect(page).to have_content 'Sign out'
        first(:link, 'Sign out').click

        expect(page).not_to have_content 'New Article'
      end
    end
  end
end
