class RemoveWithdrawalStatusFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :withdrawal_status, :boolean
  end
end
