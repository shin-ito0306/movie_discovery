class ChangeColumnDefaultToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column_default :reviews, :evaluation, from: nil, to: 0
  end
end
