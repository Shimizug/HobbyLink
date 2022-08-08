class PostComment < ApplicationRecord
  belongs_to :member
  belongs_to :post
  
  validates :comment, presence: true,length: { in: 1..80 }
end
