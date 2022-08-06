class BoardComment < ApplicationRecord
  belongs_to :member
  belongs_to :board
  
  validates :comment, presence: true
end
