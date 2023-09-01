class Pic < ApplicationRecord
    acts_as_votable
    has_one_attached :image
    belongs_to :user
    has_many :comments
    
end
