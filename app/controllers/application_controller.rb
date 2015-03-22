class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :delete_timedout_flash
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
    "application"
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end
