class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  has_many :boards, dependent: :destroy
  has_many :board_comments, dependent: :destroy

  has_many :favorites, dependent: :destroy

  # 自分がフォローする側の関係性
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # 自分がフォローしている人
  has_many :followings, through: :relationships, source: :followed
  # 自分がフォローされる側の関係性
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 自分をフォローしている人
  has_many :followers, through: :reverse_of_relationships, source: :follower

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, presence: true
  validates :introduction, length: { maximum: 40 }

  enum hobby_state: { finding_hobby: 0, pseudo_trial: 1, has_hobby: 2 }

  #ゲストログイン用
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
      member.first_name = "今回"
      member.last_name = "仮登録"
      member.first_name_kana ="コンカイ"
      member.last_name_kana = "カリトウロク"
      member.nickname = 'ゲスト'
    end
  end

  has_one_attached :profile_image

  # 会員の画像の投稿
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.png'
  end

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
    first_name + "　" + last_name
  end

  def full_name_kana
    first_name_kana + "　" + last_name_kana
  end
end
