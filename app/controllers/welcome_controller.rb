class WelcomeController < ApplicationController
  def index
    if params[:search]
      @articles = Article.where(:published => true).search(params[:search]).page(params[:page]).order('created_at desc')
      flash[:notice] = "Search results for '#{params[:search]}'."
    elsif params[:tag]
      @articles = Article.where(:published => true).tagged_with(params[:tag]).page(params[:page]).order('created_at desc')
      flash[:notice] = "Articles tagged with '#{params[:tag]}'."
    else
      @articles = default_article_scope
    end

    if @articles.empty?
      flash.delete :notice
      flash[:alert] = "No results for '#{params[:search]}' found."
      @articles = default_article_scope
    end

    respond_to do |format|
      format.html
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

  protected
  def default_article_scope
    Article.where(:published => true).page(params[:page]).order('created_at desc')
  end
end
