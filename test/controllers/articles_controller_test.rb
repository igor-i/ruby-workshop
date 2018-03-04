require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @article = articles(:one)
    # @category = article_categories(:one)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new" do
    get new_article_url
    assert_response :success
  end

  test "should create article" do
    assert_difference('Article.count') do
      post articles_url, params:
        {
          article:
            {
              title: @article.title,
              text: @article.text,
              author_name: @article.author_name,
              state: @article.state,
              article_category_id: @article.article_category_id,
            }
        }
    end

    assert_response :redirect
  end

  test "should show article" do
    get article_url(@article)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_url(@article)
    assert_response :success
  end

  test "should update article" do
    patch article_url(@article), params:
    {
      article:
        {
          title: @article.title,
          text: @article.text,
          author_name: @article.author_name,
          state: @article.state
        }
    }
    assert_response :redirect
  end

  test "should destroy article" do
    assert_difference('Article.count', -1) do
      delete article_url(@article)
    end

    assert_response :redirect
  end
end
