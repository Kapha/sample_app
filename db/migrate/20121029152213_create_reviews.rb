class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :user_id
      t.integer :book_id
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, [:user_id, :created_at, :book_id]
  end
end
