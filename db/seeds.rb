Admin.create!(
  email: 'hobby@com',
  password: '123456'
)

# Member.create!(
#   [
#     {
#       first_name: '趣味',
#       last_name: '茂作',
#       first_name_kana: 'シュミ',
#       last_name_kana: 'モサク',
#       nickname: 'モサッキー',
#       email: 'shumi@com',
#       password: '123456',
#       profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-0.png")),filename: 'state-0.png')
#     },
#     {
#       first_name: '名無し',
#       last_name: '権兵衛',
#       first_name_kana: 'ナナシ',
#       last_name_kana: 'ゴンベエ',
#       nickname: 'ゴン',
#       hobby_state: 2,
#       introduction: '趣味はサッカーです。',
#       email: 'soccer@com',
#       password: '123456',
#       profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-1.png")),filename: 'hobby-1.png')
#     },
#     {
#       first_name: '疑似',
#       last_name: '体験',
#       first_name_kana: 'ギジ',
#       last_name_kana: 'タイケン',
#       nickname: 'ギッジー',
#       hobby_state: 1,
#       introduction: '趣味、疑似体験してます。',
#       email: 'nothing@com',
#       password: '123456',
#       profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/state-1.png")),filename: 'state-1.png')
#     },
#     {
#       first_name: '退会',
#       last_name: '澄夫',
#       first_name_kana: 'タイカイ',
#       last_name_kana: 'スミオ',
#       nickname: 'スイミー',
#       hobby_state: 2,
#       introduction: '読書が好きです。',
#       is_deleted: true,
#       email: 'deactivated@.com',
#       password: '123456'
#     },
#     {
#       first_name: '例示',
#       last_name: '致',
#       first_name_kana: 'レイジ',
#       last_name_kana: 'イタス',
#       nickname: 'Reiji',
#       hobby_state: 2,
#       introduction: 'いろいろやってます。',
#       email: 'example@.com',
#       password: '123456'
#     }
#   ]
# )

# record_timestamps = { updated_at: Time.current, created_at: Time.current } 

# Genre.insert_all(
#   [
#     {
#       name: "趣味探し中",
#       body:"今は趣味を探している最中だという人。",
#       **record_timestamps
#     },
#     {
#       name: "趣味を疑似体験したい",
#       body:"ほかの人の投稿を通して趣味を疑似体験したい人。",
#       **record_timestamps
#     },
#     {
#       name: "能動的な趣味",
#       body:"自ら行動したりする趣味です。スポーツ・旅行などが含まれます。",
#       **record_timestamps
#     },
#     {
#       name: "創作的な趣味",
#       body:"何かを作ったりする趣味です。DIY・料理・バンドなどが含まれます。",
#       **record_timestamps
#     },
#     {
#       name: "受動的な趣味",
#       body:"ほかの人が作ったものを楽しむ趣味です。音楽鑑賞・読書などが含まれます。",
#       **record_timestamps
#     },
#     {
#       name: "その他",
#       body:"自分の趣味がどの分類に該当するかわからない人。",
#       **record_timestamps
#     }
#   ]
# )

# Post.create!(
#   [
#     {
#       member_id: 2,
#       genre_id: 3,
#       title: "サッカー",
#       body: "今週の週末はサッカーをしました。",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-1.png")),filename: 'hobby-1.png')
#     },
#     {
#       member_id: 2,
#       genre_id: 4,
#       title: "料理",
#       body: "今日の昼食はオムライス。",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-2.png")),filename: 'hobby-2.png')
#     },
#     {
#       member_id: 2,
#       genre_id: 5,
#       title: "ゲーム",
#       body: "新作ゲーム攻略中。",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-3.png")),filename: 'hobby-3.png')
#     },
#     {
#       member_id: 4,
#       genre_id: 5,
#       title: "Music",
#       body: "音楽鑑賞♪",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-4.png")),filename: 'hobby-4.png')
#     },
#     {
#       member_id: 4,
#       genre_id: 3,
#       title: "キャンプ",
#       body: "家族でキャンプ♪",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-5.png")),filename: 'hobby-5.png')
#     },
#     {
#       member_id: 5,
#       genre_id: 3,
#       title: "近所をランニング",
#       body: "今日は、一日近所を走っていました。",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-6.png")),filename: 'hobby-6.png')
#     },
#     {
#       member_id: 5,
#       genre_id: 4,
#       title: "お絵描き",
#       body: "今日は人物画に挑戦！！輪郭が難しい",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-7.png")),filename: 'hobby-7.png')
#     },
#     {
#       member_id: 5,
#       genre_id: 5,
#       title: "読書",
#       body: "今日は積んでた本を消化しました。",
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-8.png")),filename: 'hobby-8.png')
#     },

#   ]
# )

# Board.create!(
#   [
#     {
#       member_id: 1,
#       title: "おすすめの趣味を教えてください。",
#       body: "みんなの趣味やそのいいところを教えてほしいです！！"
#     },
#     {
#       member_id: 5,
#       title: "人物画のコツを教えて。",
#       body: "特に輪郭の描き方を知りたいです。"
#     }
#   ]
# )

# first_names =  ["あめんぼ", "かきのき", "ささげに","たちましょ", "なめくじ", "はとぽっぽ", "まいまい", "やきぐり", "らいちょうは"]
# last_names = ["あかいな", "くりのき", "すをかけ", "らっぱで", "のろのろ", "ほろほろ", "ねじまき", "ゆでぐり", "さむかろ"]
# first_name_kanas = ["アメンボ", "カキノキ", "ササゲニ", "タチマショ", "ナメクジ", "ハトポッポ", "マイマイ", "ヤキグリ", "ライチョウハ"]
# last_name_kanas = ["アカイナ", "クリノキ", "スヲカケ", "ラッパデ", "ノロノロ", "ホロホロ", "ネジマキ", "ユデグリ", "サムカロ"]
# nicknames = ["あいうえお", "かきくけこ", "さしすせそ", "たちつてと", "なにぬねの", "はひふへほ", "まみむめも", "やいゆいえよ", "らりるれろ"]
# is_deleteds = [true, false]

# for i in 1..10 do
#   member = Member.new(
#     first_name: first_names[i-1],
#     last_name: last_names[i-1],
#     first_name_kana: first_name_kanas[i-1],
#     last_name_kana: last_name_kanas[i-1],
#     nickname: nicknames[i-1],
#     hobby_state: rand(2),
#     introduction: "テスト！" * rand(1..10),
#     is_deleted: is_deleteds.sample,
#     email: "sample#{i}@com",
#     password: "123456",
#     profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-#{i-1}.png")),filename: "hobby-#{i-1}.png")
#   )
#   member.save!
# end

# Member.all.each do |member|
#   member.post_comments.create!(
#     member_id: member.id,
#     post_id: rand(1..8),
#     comment: "デモ#{member.nickname}"
#   )
# end

# for i in 1..10
#   post_comment = PostComment.new(
#     admin_id: 1,
#     post_id: rand(1..8),
#     comment: "デモ" * i
#     )
#   post_comment.save!
# end

# Member.all.each do |member|
#   member.board_comments.create!(
#     member_id: member.id,
#     board_id: rand(1..2),
#     comment: "デモ#{member.nickname}"
#   )
# end

# for i in 1..10
#   board_comment = BoardComment.new(
#     admin_id: 1,
#     board_id: rand(1..2),
#     comment: "デモ" * i
#     )
#   board_comment.save!
# end

# for i in 1..4
#   relationship = Relationship.new(
#     follower_id: i,
#     followed_id: i + 1
#     )
#   relationship.save!
# end

# for i in 1..8
#   for j in 1..5
#     favorite = Favorite.new(
#       member_id: j,
#       post_id: i
#       )
#     favorite.save!
#   end
# end

# for i in 1..30 do
#   for j in 0..9 do
#     post = Post.new(
#       member_id: rand(1..5),
#       genre_id: rand(1..6),
#       title: "test#{i}",
#       body: "テスト" * i,
#       image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/hobby-#{j}.png")),filename: "hobby-#{j}.png")
#       )
#     post.save!
#   end
# end

# for i in 1..5 do
#   board = Board.new(
#     member_id: i,
#     title: "test#{i}",
#     body: "テストの掲示板の概要です。" * i
#     )
#   board.save!
# end



