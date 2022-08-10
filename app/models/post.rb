class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title,presence:true,length: { in: 1..30 } 
  validates :body,presence:true,length: { in: 1..100 } 
  
  #キーワード検索
  def self.search_for(content, method)
    if method == 'perfect'
      Book.where(title: content)
    elsif method == 'forward'
      Book.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Book.where('title LIKE ?', '%'+content)
    else
      Book.where('title LIKE ?', '%'+content+'%')
    end
  end
  
  # 画像の投稿
  def get_image
    (image.attached?) ? image : 'noimage_icon.png'
  end

  def favorited_by?(member)
    favorites.exists?(member_id: member.id)
  end
  
  has_one_attached :image
end
