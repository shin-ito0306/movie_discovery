class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :like_id
      t.string :action
      t.boolean :check

      t.timestamps
    end
  end
end
