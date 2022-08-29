class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :post_id
      t.text :introduction
      t.string :item_name
      t.string :image
      t.integer :score
      t.integer :price
      t.integer :genre_id
      #t.datetime :created_at
      #t.datetime :update_at
      t.timestamps
    end
  end
end
