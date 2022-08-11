class Board < ApplicationRecord
  belongs_to :member
  has_many :board_comments, dependent: :destroy

  validates :title, presence: true, length: { in: 1..15 }
  validates :body, presence: true, length: { in: 1..80 }

end
