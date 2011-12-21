require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post :create, article: @article.attributes
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article.to_param
    assert_response :success
  end

  test "should update article" do
    put :update, id: @article.to_param, article: @article.attributes
    assert_redirected_to article_path(assigns(:article))
  end

  test "article attributes must not be empty" do
    article = Article.new
    assert article.invalid?, 'article is invalid'
    assert article.errors[:content].any?, ':content has errors'
    assert article.errors[:author].any?, ':author has errors'
    assert article.errors[:published].any?, ':published has errors'
    assert article.errors[:title].any?, ':title has errors'
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article.to_param
    end

    assert_redirected_to articles_path
  end
end
