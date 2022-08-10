class Board < ApplicationRecord
  belongs_to :member
  has_many :board_comments, dependent: :destroy

  validates :title, presence: true
  validates :body,length: { in: 1..30 }

end
