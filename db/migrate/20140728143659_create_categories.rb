class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :position
      t.string :ancestry

      t.timestamps
    end

    add_index :categories, :slug, unique: true
    add_index :categories, [:position, :ancestry]
  end
end
