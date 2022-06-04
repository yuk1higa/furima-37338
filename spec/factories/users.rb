FactoryBot.define do

  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'中田'}
    first_name {'太郎'}
    kana_last_name {'ナカダ'}
    kana_first_name {'タロウ'}
    birthday {'1930-01-01'}
  end
end