class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.datetime :published_at

      t.timestamps
    end

    add_index :products, [:slug, :published_at]
  end
end
