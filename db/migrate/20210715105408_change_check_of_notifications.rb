class ChangeCheckOfNotifications < ActiveRecord::Migration[5.2]
  def up
    change_column :notifications, :check, :boolean, default: false, null: false
  end
  
  def down
    change_column :notifications, :check, :boolean
  end
end
