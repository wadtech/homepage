class PagesController < ApplicationController
  def show
    @page = Page.find_by_downcased_permalink params[:id]

    render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found if @page.nil?
  end
end
