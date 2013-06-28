class PagesController < ApplicationController

  before_action :authenticate_admin!, :except => :show

  def show
    @page = Page.find_by_downcased_permalink params[:id]
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find_by_downcased_permalink params[:id]
  end

  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @page = Page.find_by_downcased_permalink params[:id]

    respond_to do |format|
      if @page.update_attributes(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @page = Page.find_by_downcased_permalink params[:id]
    @page.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end

  private

  def page_params
    params.require(:page).permit(:permalink, :content)
  end
end
