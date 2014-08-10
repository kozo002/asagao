class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.string :categorizable_type
      t.integer :categorizable_id
      t.integer :category_id

      t.timestamps
    end

    add_index :categorizations, [:categorizable_type, :categorizable_id], name: 'categorizable_index'
    add_index :categorizations, :category_id
  end
end
