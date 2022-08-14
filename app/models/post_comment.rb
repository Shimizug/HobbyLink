class PostComment < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :post
  belongs_to :admin, optional: true

  validates :comment, presence: true,length: { in: 1..100 }
end
