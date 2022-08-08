class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  # 画像の投稿
  def get_image
    (image.attached?) ? image : 'noimage_icon.png'
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  
  has_one_attached :image
end
