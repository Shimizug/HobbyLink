class Board < ApplicationRecord
  belongs_to :member
  has_many :board_comments, dependent: :destroy

  validates :title, presence: true, length: { in: 1..30 }
  validates :body, presence: true, length: { in: 1..70 }

end
