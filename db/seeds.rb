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
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sports.png")),filename: 'sports.png')
    },
    {
      first_name: '疑似',
      last_name: '体験',
      first_name_kana: 'ギジ',
      last_name_kana: 'タイケン',
      nickname: 'ギッジー',
      hobby_state: 1,
      introduction: '趣味、疑似体験してます。',
      email: 'nothing@gmail.com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/pseudo_trial.png")),filename: 'pseudo_trial.png')
    },
    {
      first_name: '退会',
      last_name: '澄夫',
      first_name_kana: 'タイカイ',
      last_name_kana: 'スミオ',
      nickname: 'スイミー',
      hobby_state: 2,
      introduction: '読書が好きです。',
      is_deleted: true,
      email: 'deactivated@gmail.com',
      password: '123456'
    },
     {
      first_name: '例示',
      last_name: '致',
      first_name_kana: 'レイジ',
      last_name_kana: 'イタス',
      nickname: 'Reiji',
      hobby_state: 2,
      introduction: 'いろいろやってます。',
      email: 'example@gmail.com',
      password: '123456'
    }
  ]
)

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

Post.create!(
  [
    {
      member_id: 2,
      genre_id: 3,
      title: "サッカー",
      body: "今週の週末はサッカーをしました。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/sports.png")),filename: 'sports.png')
    },
    {
      member_id: 2,
      genre_id: 4,
      title: "料理",
      body: "今日の昼食はオムライス。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/cooking.png")),filename: 'cooking.png')
    },
    {
      member_id: 2,
      genre_id: 5,
      title: "ゲーム",
      body: "新作ゲーム攻略中。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/game.png")),filename: 'game.png')
    },
    {
      member_id: 4,
      genre_id: 5,
      title: "Music",
      body: "音楽鑑賞♪",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/music.png")),filename: 'music.png')
    },
    {
      member_id: 4,
      genre_id: 3,
      title: "キャンプ",
      body: "家族でキャンプ♪",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/outdoor.png")),filename: 'outdoor.png')
    },
    {
      member_id: 5,
      genre_id: 3,
      title: "近所をランニング",
      body: "今日は、一日近所を走っていました。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/running.png")),filename: 'running.png')
    },
    {
      member_id: 5,
      genre_id: 4,
      title: "お絵描き",
      body: "今日は人物画に挑戦！！輪郭が難しい",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/painting.png")),filename: 'painting.png')
    },
    {
      member_id: 5,
      genre_id: 5,
      title: "読書",
      body: "今日は積んでた本を消化しました。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/reading.png")),filename: 'reading.png')
    },
    
  ]
)

Board.create!(
  [
    {
      member_id: 1,
      title: "おすすめの趣味を教えてください。",
      body: "みんなの趣味やそのいいところを教えてほしいです！！"
    },
    {
      member_id: 5,
      title: "人物画のコツを教えて。",
      body: "特に輪郭の描き方を知りたいです。"
    }
  ]
)

