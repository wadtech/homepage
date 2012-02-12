class WelcomeController < ApplicationController
  def index
    # get latest 5 articles in summary form
    # only if they're published though!
    # if params[:search].nil?
    #   @articles = Article.paginate(:per_page => 1, :page => params[:page]).order('created_at desc').where(:published => true)
    # else

    # this is a bit broken, default welcome page shouldn't have a load of results on it.
      @search = Article.search do
        fulltext params[:search]
        with(:is_published, true)
        facet(:created_month)
        with(:created_month, params[:month]) if params[:month].present?
      end
      @search
      @articles = @search.results
    # end
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
