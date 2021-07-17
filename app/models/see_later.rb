class SeeLater < ApplicationRecord
  belongs_to :member
  
  validates :movie_name, presence: true
  validates :movie_image, presence: true
  validates :movie_number, presence: true
end
