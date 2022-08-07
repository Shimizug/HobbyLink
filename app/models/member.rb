class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :boards, dependent: :destroy
  has_many :board_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  # 自分がフォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed
  has_one_attached :profile_image
  
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower
  
  


  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :introduction, length: { maximum: 30 }
  
  
  
  
  #フォローする
  def follow(member)
    relationships.create(followed_id: member.id)
  end
  
  #フォローを外す
  def unfollow(member)
    relationships.find_by(followed_id: member.id).destroy
  end
  #フォローしているか調べる
  def following?(member)
    followings.include?(member)
  end


  def full_name
    first_name + " " + last_name
  end

  def full_name_kana
    first_name_kana + " " + last_name_kana
  end
end
