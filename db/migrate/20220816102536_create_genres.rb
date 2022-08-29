class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|

      t.integer :genre_id
      t.string :name
      #t.datetime :created_at
      #t.datetime :update_at
      t.timestamps
    end
  end
end
