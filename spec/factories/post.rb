# FactoryBot.define do
#   factory :post do
#     sequence(:title) { |n| "title#{n}"}
#     sequence(:body) { |n| "body#{n}"}
#   end
# end

FactoryBot.define do
  factory :post do
    title { Faker::Lorem.characters(number:30) }
    body { Faker::Lorem.characters(number:100) }
  end
end