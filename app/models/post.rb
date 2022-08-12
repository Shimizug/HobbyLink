class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true,length: { in: 1..30 } 
  validates :body,presence:true,length: { in: 1..100 } 
  
  has_one_attached :image
  
  # 画像の投稿
  def get_image
    (image.attached?) ? image : 'noimage_icon.png'
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
end
