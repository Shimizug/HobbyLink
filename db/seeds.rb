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
  is_deleted: false,
  email: 'shumi@gmail.com',
  password: '123456',
  )

  Genre.create!(
  name: "模索中",
  body: "今はまだ趣味がない人"
)