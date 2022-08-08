class Board < ApplicationRecord
  belongs_to :member
  has_many :board

  validates :title, presence: true
  validates :introduction,length: { in: 1..30 }

end
