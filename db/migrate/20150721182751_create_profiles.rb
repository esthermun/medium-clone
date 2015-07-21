class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :username
      t.string :description
      t.attachment :avatar
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
