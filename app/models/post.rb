class Post < ApplicationRecord
  belongs_to :member
  belongs_to :genre
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

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

  def save_tags(tags)
    # 自分自身に関連づいたタグを配列で取得する
    current_tags = self.tags.pluck(:name)
    # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
    # すでに作成されていたタグを抽出
    old_tags = current_tags - tags
    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tags - current_tags
    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるpost_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(name: old)
    end

    # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      new_post_tag = Tag.find_or_create_by(name: new)

      # tag_mapsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_post_tag
    end
  end
end
