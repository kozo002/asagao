class CreateImageAttachments < ActiveRecord::Migration
  def change
    create_table :image_attachments do |t|
      t.string :attachable_type
      t.integer :attachable_id
      t.integer :position
      t.integer :image_id

      t.timestamps
    end

    add_index :image_attachments, [:attachable_type, :attachable_id], name: 'attachable_index'
  end
end
