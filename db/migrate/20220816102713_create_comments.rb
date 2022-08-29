class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      t.integer :comment_id
      t.integer :post_id
      #t.datetime :created_at
      #t.datetime :update_at
      t.timestamps
    end
  end
end
