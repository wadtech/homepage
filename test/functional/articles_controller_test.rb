require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)

    @unique_article = {:title => "Unique",
                       :content => "Nonsense",
                       :author => "Pete",
                       :published => false
    }
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
      post :create, article: @unique_article
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
    assert article.invalid?
    assert article.errors[:content].any?
    assert article.errors[:author].any?
    assert article.errors[:published].any?
    assert article.errors[:title].any?
  end

  test "article should have a unique title" do
    Article.create(@article.attributes)
    assert_no_difference 'Article.count' do
      article = Article.create(:title => @article.title)
      assert !article.valid?
    end
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article.to_param
    end

    assert_redirected_to articles_path
  end
end
