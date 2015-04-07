class PagesController < ApplicationController
  def show
    @page = Page.find_by_downcased_permalink params[:id]
  end
end
