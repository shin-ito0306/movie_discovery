class Notification < ApplicationRecord
  belongs_to :visiter, class_name: 'Member', optional: true
  belongs_to :visited, class_name: 'Member', optional: true
  belongs_to :review, optional: true
  
  validates :action, presence: true
  validates :check, inclusion: { in: [true, false] }
end
