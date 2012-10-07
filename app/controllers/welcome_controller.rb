class WelcomeController < ApplicationController
  def index
    # get latest 5 articles in summary form
    # only if they're published though!
    if params[:tag]
      @articles = Article.where(:published => true).tagged_with(params[:tag]).page(params[:page]).order('created_at desc')
    else
      @articles = Article.where(:published => true).page(params[:page]).order('created_at desc')
    end
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
