class ChangeDataEvaluationToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :evaluation, :float
  end
end
