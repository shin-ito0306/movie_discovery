class CreateSeeLaters < ActiveRecord::Migration[5.2]
  def change
    create_table :see_laters do |t|
      t.references :member, foreign_key: true
      t.string :movie_name
      t.string :movie_image
      t.integer :movie_number

      t.timestamps
    end
  end
end
