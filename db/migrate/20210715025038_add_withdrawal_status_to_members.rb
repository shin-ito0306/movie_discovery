class AddWithdrawalStatusToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :withdrawal_status, :boolean, default: false, null: false
  end
end
