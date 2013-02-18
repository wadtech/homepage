require "capybara/rspec"

module AdminHelper
  def login_admin
    @user = FactoryGirl.create(:admin)

    visit new_admin_session_path

    fill_in 'admin_email', :with => @user.email
    fill_in 'admin_password', :with => @user.password
    click_button "Sign in"
  end
end

RSpec.configure do |config|
  config.include AdminHelper, :type => :request
end