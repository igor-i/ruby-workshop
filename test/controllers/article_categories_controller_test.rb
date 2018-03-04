require 'test_helper'

class ArticleCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = article_categories(:one)
    @category_without_articles = article_categories(:two)
  end

  test "should get index" do
    get article_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_article_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Article::Category.count') do
      post article_categories_url, params: {
          article_category: {
              name: @category.name,
              slug: @category.slug,
            }
        }
    end

    assert_response :redirect
  end

  test "should show category" do
    get article_category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_article_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch article_category_url(@category), params: {
      article_category: {
          name: @category.name,
          slug: @category.slug,
        }
    }
    assert_response :redirect
  end

  test "should destroy category" do
    assert_difference('Article::Category.count', -1) do
      delete article_category_url(@category_without_articles)
    end

    assert_response :redirect
  end
end
