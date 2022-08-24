Admin.create!(
  email: 'hobby@com',
  password: '123456'
)

record_timestamps = { updated_at: Time.current, created_at: Time.current }

Member.create!(
  [
    {
      first_name: '趣味',
      last_name: '茂作',
      first_name_kana: 'シュミ',
      last_name_kana: 'モサク',
      nickname: 'モサッキー',
      email: 'shumi@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-0.png")),filename: 'state-0.png'),
      **record_timestamps
    },
    {
      first_name: '名無し',
      last_name: '権兵衛',
      first_name_kana: 'ナナシ',
      last_name_kana: 'ゴンベエ',
      nickname: 'ゴン',
      hobby_state: 2,
      introduction: '趣味はサッカーです。',
      email: 'soccer@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-1.png")),filename: 'hobby-1.png'),
      **record_timestamps
    },
    {
      first_name: '疑似',
      last_name: '体験',
      first_name_kana: 'ギジ',
      last_name_kana: 'タイケン',
      nickname: 'ギッジー',
      hobby_state: 1,
      introduction: '趣味、疑似体験してます。',
      email: 'nothing@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'state-1.png'),
      **record_timestamps
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
      email: 'deactivated@com',
      password: '123456',
      **record_timestamps
    },
     {
      first_name: '例示',
      last_name: '致',
      first_name_kana: 'レイジ',
      last_name_kana: 'イタス',
      nickname: 'Reiji',
      hobby_state: 2,
      introduction: 'いろいろやってます。',
      email: 'example@.com',
      password: '123456',
      **record_timestamps
    },
    {
      first_name: 'あめんぼ',
      last_name: 'あかいな',
      first_name_kana: 'アメンボ',
      last_name_kana: 'アカイナ',
      nickname: 'あいうえお',
      hobby_state: 1,
      introduction: '浮藻に小蝦もおよいでる。',
      email: 'sample0@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-0.png'),
      **record_timestamps
    },
    {
      first_name: 'かきのき',
      last_name: 'くりのき',
      first_name_kana: 'カキノキ',
      last_name_kana: 'クリノキ',
      nickname: 'かきくけこ',
      hobby_state: 1,
      introduction: '啄木鳥こつこつ、枯れけやき。',
      email: 'sample1@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-1.png'),
      **record_timestamps
    },
    {
      first_name: 'ささげに',
      last_name: 'すをかけ',
      first_name_kana: 'ササゲニ',
      last_name_kana: 'スヲカケ',
      nickname: 'さしすせそ',
      hobby_state: 1,
      introduction: 'その魚浅瀬で刺しました。',
      email: 'sample2@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-2.png'),
      **record_timestamps
    },
    {
      first_name: 'たちましょ',
      last_name: 'らっぱで',
      first_name_kana: 'タチマショ',
      last_name_kana: 'ラッパデ',
      nickname: 'たちつてと',
      hobby_state: 2,
      introduction: 'トテトテタッタと飛び立った。',
      email: 'sample3@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-3.png'),
      **record_timestamps
    },
    {
      first_name: 'なめくじ"',
      last_name: 'のろのろ',
      first_name_kana: 'ナメクジ',
      last_name_kana: 'ノロノロ',
      nickname: 'なにぬねの',
      hobby_state: 2,
      introduction: '納戸にぬめって、なにねばる。',
      email: 'sample4@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-4.png'),
      **record_timestamps
    },
    {
      first_name: 'はとぽっぽ',
      last_name: 'ほろほろ',
      first_name_kana: 'ハトポッポ',
      last_name_kana: 'ホロホロ',
      nickname: 'はひふへほ',
      hobby_state: 2,
      introduction: '日向のお部屋にゃ笛を吹く。',
      is_deleted: true,
      email: 'sample5@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-5.png'),
      **record_timestamps
    },
    {
      first_name: 'まいまい',
      last_name: 'ねじまき',
      first_name_kana: 'マイマイ',
      last_name_kana: 'ネジマキ',
      nickname: 'まみむめも',
      hobby_state: 0,
      introduction: '梅の実落ちても見もしまい。',
      is_deleted: true,
      email: 'sample6@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-6.png'),
      **record_timestamps
    },
    {
      first_name: 'やきぐり',
      last_name: 'ゆでぐり',
      first_name_kana: 'ヤキグリ',
      last_name_kana: 'ユデグリ',
      nickname: 'やいゆいえよ',
      hobby_state: 0,
      introduction: '山田に灯のつく宵の家。',
      is_deleted: true,
      email: 'sample7@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-7.png'),
      **record_timestamps
    },
    {
      first_name: 'らいちょうは',
      last_name: 'さむかろ',
      first_name_kana: 'ライチョウハ',
      last_name_kana: 'サムカロ',
      nickname: 'らりるれろ',
      hobby_state: 0,
      introduction: '蓮花が咲いたら、瑠璃の鳥。',
      is_deleted: true,
      email: 'sample8@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-8.png'),
      **record_timestamps
    },
    {
      first_name: 'わいわい',
      last_name: 'わっしょい',
      first_name_kana: 'ワイワイ',
      last_name_kana: 'ワッショイ',
      nickname: 'ワイウエヲ',
      hobby_state: 0,
      introduction: '植木屋、井戸換え、お祭りだ。',
      is_deleted: true,
      email: 'sample9@com',
      password: '123456',
      profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'hobby-9.png'),
      **record_timestamps
    }
  ]
)

Genre.insert_all(
  [
    {
      name: "能動的な趣味",
      body:"自ら行動したりする趣味です。スポーツ・旅行などが含まれます。",
      **record_timestamps
    },
    {
      name: "創作的な趣味",
      body:"何かを作ったりする趣味です。DIY・料理・バンドなどが含まれます。",
      **record_timestamps
    },
    {
      name: "受動的な趣味",
      body:"ほかの人が作ったものを楽しむ趣味です。音楽鑑賞・読書などが含まれます。",
      **record_timestamps
    },
    {
      name: "その他",
      body:"自分の趣味がどの分類に該当するかわからない人。",
      **record_timestamps
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
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-1.png")),filename: 'hobby-1.png'),
      **record_timestamps
    },
    {
      member_id: 2,
      genre_id: 4,
      title: "料理",
      body: "今日の昼食はオムライス。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-2.png")),filename: 'hobby-2.png'),
      **record_timestamps
    },
    {
      member_id: 2,
      genre_id: 5,
      title: "ゲーム",
      body: "新作ゲーム攻略中。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-3.png")),filename: 'hobby-3.png'),
      **record_timestamps
    },
    {
      member_id: 4,
      genre_id: 5,
      title: "Music",
      body: "音楽鑑賞♪",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-4.png")),filename: 'hobby-4.png'),
      **record_timestamps
    },
    {
      member_id: 4,
      genre_id: 3,
      title: "キャンプ",
      body: "家族でキャンプ♪",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-5.png")),filename: 'hobby-5.png'),
      **record_timestamps
    },
    {
      member_id: 5,
      genre_id: 3,
      title: "近所をランニング",
      body: "今日は、一日近所を走っていました。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-6.png")),filename: 'hobby-6.png'),
      **record_timestamps
    },
    {
      member_id: 5,
      genre_id: 4,
      title: "お絵描き",
      body: "今日は人物画に挑戦！！輪郭が難しい",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-7.png")),filename: 'hobby-7.png'),
      **record_timestamps
    },
    {
      member_id: 5,
      genre_id: 5,
      title: "読書",
      body: "今日は積んでた本を消化しました。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-8.png")),filename: 'hobby-8.png'),
      **record_timestamps
    },

  ]
)

for i in 1..30 do
  for j in 0..9 do
    post = Post.new(
      member_id: rand(1..5),
      genre_id: rand(1..6),
      title: "test#{i}",
      body: "テスト" * i,
      image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-#{j}.png")),filename: "hobby-#{j}.png")
      )
    post.save!
  end
end

Board.insert_all(
  [
    {
      member_id: 1,
      title: "おすすめの趣味を教えてください。",
      body: "みんなの趣味やそのいいところを教えてほしいです！！",
      **record_timestamps
    },
    {
      member_id: 5,
      title: "人物画のコツを教えて。",
      body: "特に輪郭の描き方を知りたいです。",
      **record_timestamps
    }
  ]
)

for i in 1..5 do
  board = Board.new(
    member_id: i,
    title: "test#{i}",
    body: "テストの掲示板の概要です。" * i
    )
  board.save!
end



Member.all.each do |member|
  member.post_comments.create!(
    member_id: member.id,
    post_id: rand(1..8),
    comment: "デモ#{member.nickname}"
  )
end

for i in 1..10
  post_comment = PostComment.new(
    admin_id: 1,
    post_id: rand(1..8),
    comment: "デモ" * i
    )
  post_comment.save!
end

Member.all.each do |member|
  member.board_comments.create!(
    member_id: member.id,
    board_id: rand(1..2),
    comment: "デモ#{member.nickname}"
  )
end

for i in 1..10
  board_comment = BoardComment.new(
    admin_id: 1,
    board_id: rand(1..2),
    comment: "デモ" * i
    )
  board_comment.save!
end

for i in 1..4
  relationship = Relationship.new(
    follower_id: i,
    followed_id: i + 1
    )
  relationship.save!
end

for i in 1..8
  for j in 1..5
    favorite = Favorite.new(
      member_id: j,
      post_id: i
      )
    favorite.save!
  end
end




