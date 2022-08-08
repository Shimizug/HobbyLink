Admin.create!(
  email: 'hobby@gmail.com',
  password: '123456',
)

Member.create!(
  first_name: '趣味',
  last_name: '茂作',
  first_name_kana: 'シュミ',
  last_name_kana: 'モサク',
  nickname: 'モサッキー',
  introduction: '趣味探し中です。',
  email: 'shumi@gmail.com',
  password: '123456',
  )

Genre.create!(
  [
    {
      name: "趣味探し中の人",
      body:"今はまだ趣味がない。"
    },
    {
      name: "趣味を疑似体験したい人",
      body:"ほかの人の投稿を通して趣味を疑似体験したい。"
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
      body:"どの分類の趣味に当たるかわからない人"
    }
  ]
 )


