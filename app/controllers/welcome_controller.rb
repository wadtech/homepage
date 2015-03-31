class WelcomeController < ApplicationController
  def index
    clear_flash

    if params[:search]
      @articles = check_article_search
    elsif params[:tag]
      @articles = check_article_tag
    else
      @articles = default_article_scope
    end

    @repositories = github.repositories
    @activity     = github.public_activity

    respond_to do |format|
      format.html
    end
  end

  def show_article
    @article = Article.get(params[:id])

    respond_to do |format|
      format.html
    end
  end

  protected
  def default_article_scope
    Article.where(:published => true).page(params[:page]).order('created_at desc')
  end

  def check_article_search
    articles = Article.where(:published => true).search(params[:search]).page(params[:page]).order('created_at desc')

    if articles.empty?
      flash[:alert] = "No results for '#{params[:search]}' found."
      default_article_scope
    else
      flash[:notice] = "Search results for '#{params[:search]}'."
      articles
    end
  end

  def check_article_tag
    articles = Article.where(:published => true).tagged_with(params[:tag]).page(params[:page]).order('created_at desc')

    if articles.empty?
      flash[:alert] = "No results for '#{params[:tag]}' found."
      default_article_scope
    else
      flash[:notice] = "Articles tagged with '#{params[:tag]}'."
      articles
    end
  end

  private

  def github
    @github ||= Github.new
  end
end
