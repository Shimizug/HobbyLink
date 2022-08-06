class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :post_comments
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
  
  has_one_attached :image
end
