class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.string :docment

      t.timestamps
    end
  end
end
