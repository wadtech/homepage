class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :delete_timedout_flash
  layout :layout_by_resource

  protected

  def delete_timedout_flash
    flash.delete(:timedout)
  end

  def clear_flash
    flash.delete :notice
    flash.delete :alert
  end

  def layout_by_resource
    if devise_controller?
      "auth"
    else
      "application"
    end
  end
end
