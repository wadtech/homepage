class WelcomeController < ApplicationController
  def index
    # get latest 5 articles in summary form
    # only if they're published though!
    @articles = Article.where(:published => true).page(params[:page]).order('created_at desc')
    @project = Project.readonly.first(:order => "RAND()", :conditions => [ "image_file_name IS NOT NULL" ])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end    
  end

  def show_article
    @article = Article.get(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @articles }
    end
  end
end
