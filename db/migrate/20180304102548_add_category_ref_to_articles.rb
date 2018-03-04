class AddCategoryRefToArticles < ActiveRecord::Migration[5.1]
  def change
    add_reference :articles, :article_category, foreign_key: true
  end
end
