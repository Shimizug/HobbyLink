class Board < ApplicationRecord
  belongs_to :member
  has_many :board
  
  validates :title, presence: true
  validates :introduction,  validates :length: { in: 1..30 }  
end
