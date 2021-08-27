class Notification < ApplicationRecord
  belongs_to :visiter, class_name: 'Member'
  belongs_to :visited, class_name: 'Member'
  
  validates :action, presence: true
  validates :check, inclusion: { in: [true, false] }
end
