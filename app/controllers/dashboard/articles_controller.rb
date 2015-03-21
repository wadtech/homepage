module Dashboard
  class ArticlesController < ApplicationController
    def layout_by_resource
      "dashboard"
    end

    before_action :authenticate_admin!

    # GET /articles
    # GET /articles.json
    def index
      @articles = Article.all

      respond_to do |format|
        format.html
      end
    end

    # GET /articles/new
    # GET /articles/new.json
    def new
      @article = Article.new

      respond_to do |format|
        format.html
      end
    end

    # GET /articles/1/edit
    def edit
      @article = Article.find(params[:id])
    end

    # POST /articles
    # POST /articles.json
    def create
      @article = Article.new(article_params)

      respond_to do |format|
        if @article.save
          format.html { redirect_to @article, notice: 'Article was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end

    # PUT /articles/1
    # PUT /articles/1.json
    def update
      @article = Article.find(params[:id])

      respond_to do |format|
        if @article.update_attributes(article_params)
          format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        else
          format.html { render action: "edit" }
        end
      end
    end

    # DELETE /articles/1
    # DELETE /articles/1.json
    def destroy
      @article = Article.find(params[:id])
      @article.destroy

      respond_to do |format|
        format.html { redirect_to articles_url }
      end
    end

   def toggle_publish
      @article = Article.find(params[:id])
      @article.toggle!(:published)

      respond_to do |format|
        format.js
      end
    end

    private

    def article_params
      params.require(:article).permit(:content, :author, :title, :published, :tag_list)
    end
  end
end
