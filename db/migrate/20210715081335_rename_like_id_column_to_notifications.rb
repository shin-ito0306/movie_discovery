class RenameLikeIdColumnToNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :like_id, :review_id
  end
end
