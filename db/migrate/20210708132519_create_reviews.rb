class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :member, foreign_key: true
      t.string :movie_name
      t.integer :movie_number
      t.string :movie_image
      t.float :evaluation
      t.text :review_detail

      t.timestamps
    end
  end
end
