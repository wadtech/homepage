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

  # rspec-rails 3 will no longer automatically infer an example group's spec type
  # from the file location. You can explicitly opt-in to the feature using this
  # config option.
  # To explicitly tag specs without using automatic inference, set the `:type`
  # metadata manually:
  #
  #     describe ThingsController, :type => :controller do
  #       # Equivalent to being in spec/controllers
  #     end
  config.infer_spec_type_from_file_location!
end