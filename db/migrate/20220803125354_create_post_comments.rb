class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|

      t.integer :member_id
      t.integer :admin_id
      t.integer :post_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
