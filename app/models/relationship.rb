class Relationship < ApplicationRecord
  belongs_to :follower, class_name: 'Member'#follower_idの親であるmember
  belongs_to :followed, class_name: 'Member'#followed_idの親であるmember
end
