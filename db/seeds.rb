Admin.create!(
  email: 'hobby@gmail.com',
  password: '123456'
)




Member.create!(
  [
    {
      first_name: '趣味',
      last_name: '茂作',
      first_name_kana: 'シュミ',
      last_name_kana: 'モサク',
      nickname: 'モサッキー',
      email: 'shumi@gmail.com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/finding_hobby.png")),filename: 'finding_hobby.png')
    },
    {
      first_name: '名無し',
      last_name: '権兵衛',
      first_name_kana: 'ナナシ',
      last_name_kana: 'ゴンベエ',
      nickname: 'ゴン',
      hobby_state: 2,
      introduction: '趣味はサッカーです。',
      email: 'soccer@gmail.com',
      password: '123456'
    },
    {
      first_name: '名無し',
      last_name: '権兵衛',
      first_name_kana: 'ナナシ',
      last_name_kana: 'ゴンベエ',
      nickname: 'ゴン',
      hobby_state: 2,
      introduction: '趣味はサッカーです。',
      email: 'nothing@gmail.com',
      password: '123456'
    },
    {
      first_name: '名無し',
      last_name: '権兵衛',
      first_name_kana: 'ナナシ',
      last_name_kana: 'ゴンベエ',
      nickname: 'ゴン',
      hobby_state: 2,
      introduction: '読書が好きです。',
      
      email: 'deactivated@gmail.com',
      password: '123456'
    }
  ]
)


  

# Post.create!(
#   [
#     {
      
#     },
#   ]
# )

# board.create!(
#   [
#     {
      
#     },
#   ]
# )

Genre.create!(
  [
    {
      name: "趣味探し中",
      body:"今は趣味を探している最中だという人。"
    },
    {
      name: "趣味を疑似体験したい",
      body:"ほかの人の投稿を通して趣味を疑似体験したい人。"
    },
    {
      name: "能動的な趣味",
      body:"自ら行動したりする趣味です。スポーツ・旅行などが含まれます。"
    },
    {
      name: "創作的な趣味",
      body:"何かを作ったりする趣味です。DIY・料理・バンドなどが含まれます。"
    },
    {
      name: "受動的な趣味",
      body:"ほかの人が作ったものを楽しむ趣味です。音楽鑑賞・読書などが含まれます。"
    },
    {
      name: "その他",
      body:"自分の趣味がどの分類に該当するかわからない人。"
    }
  ]
 )


