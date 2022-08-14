class BoardComment < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :board
  belongs_to :admin, optional: true

  validates :comment, presence: true,length: { in: 1..300 }
end
