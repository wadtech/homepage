class WelcomeController < ApplicationController
  helper GithubEvent

  def index
    clear_flash

    if params[:search]
      @articles = check_article_search
    elsif params[:tag]
      @articles = check_article_tag
    else
      @articles = paged_articles
    end

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
  def paged_articles
    Article.published.page(params[:page]).order('created_at desc')
  end

  def check_article_search
    articles = Article.published.search(params[:search]).page(params[:page]).order('created_at desc')

    if articles.empty?
      flash[:alert] = "No results for '#{params[:search]}' found."
      paged_articles
    else
      flash[:notice] = "Search results for '#{params[:search]}'."
      articles
    end
  end

  def check_article_tag
    articles = Article.published.tagged_with(params[:tag]).page(params[:page]).order('created_at desc')

    if articles.empty?
      flash[:alert] = "No results for '#{params[:tag]}' found."
      paged_articles
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
