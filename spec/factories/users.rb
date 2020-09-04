FactoryBot.define do
  factory :user do
    nickname              {Faker::JapaneseMedia::DragonBall.character}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6, mix_case: true)}
    password_confirmation {password}
    family_name           {Gimei.name.last}
    first_name            {Gimei.name.first}
    family_name_kana      {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    birthday              {Faker::Date.birthday}
  end
end