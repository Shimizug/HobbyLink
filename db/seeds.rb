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
      name: "アウトドア",
      body:"散歩・釣り・キャンプなど"
    },
    {
      name: "ゲーム",
      body:"アプリゲーム・テレビゲーム・テーブルゲームなど"
    },
    {
      name: "スポーツ",
      body:"球技・格闘技・トレーニングな"
    },
    {
      name: "音楽",
      body:"楽器演奏・カラオケ・ライブなど"
    },
    {
      name: "学習",
      body:"プログラミング・資格受験など"
    },
    {
      name: "作る",
      body:"イラスト・DIYなど"
    },
    {
      name: "収集",
      body:"御朱印帳・切手収集など"
    },
    {
      name: "動植物",
      body:"ペット・園芸など"
    },
    {
      name: "読書・鑑賞",
      body:"マンガ・小説・アニメなど"
    },
    {
      name: "旅行",
      body:"温泉など"
    },
    {
      name: "その他",
      body:"該当しそうなジャンルがない人"
    }
  ]
 )


