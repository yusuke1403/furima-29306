FactoryBot.define do
  factory :item do
    name                 { Faker::JapaneseMedia::DragonBall.character }
    content              { Faker::Lorem.sentence }
    category_id          { 2 }
    performance_id       { 2 }
    postage_id           { 2 }
    shipping_origin_id   { 2 }
    post_time_id         { 2 }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
