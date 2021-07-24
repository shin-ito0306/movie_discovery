class SeeLater < ApplicationRecord
  belongs_to :member
  
  validates :movie_name, presence: true
  validates :movie_image, presence: true
  validates :movie_number, presence: true
  
  
  def self.serched_by(member_id)
    SeeLater.where(member_id: member_id)
  end
end
