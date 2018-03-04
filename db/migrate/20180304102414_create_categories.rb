class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
    end
    add_index :categories, :slug, unique: true
  end
end
