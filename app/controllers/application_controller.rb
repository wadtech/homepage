class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :delete_timedout_flash

  def delete_timedout_flash
    flash.delete(:timedout)
  end
end
