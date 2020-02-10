class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :image_id
      t.string :genre_id
      t.string :user_id

      t.timestamps
    end
  end
end
