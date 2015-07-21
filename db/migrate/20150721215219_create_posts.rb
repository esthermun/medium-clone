class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :slug
      t.string :title
      t.attachment :image
      t.string :content
      t.integer :state

      t.timestamps null: false
    end
  end
end
