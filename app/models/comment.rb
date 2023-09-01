class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pic
  validates :content, presence: true
end
