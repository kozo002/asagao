class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :slug
      t.string :title
      t.text :content
      t.datetime :published_at
      t.integer :product_id

      t.timestamps
    end

    add_index :articles, :published_at
    add_index :articles, :slug, unique: true
    add_index :articles, :title
  end
end
