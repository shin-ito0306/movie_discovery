class RenameMemberImageColumnToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_column :members, :member_image, :member_image_id
  end
end
