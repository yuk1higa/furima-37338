FactoryBot.define do

  factory :user do
    nickname {'test'}
    email {'test@test.com'}
    password {'111111'}
    password_confirmation {'111111'}
    last_name {'中田'}
    first_name {'太郎'}
    kana_last_name {'ナカダ'}
    kana_first_name {'タロウ'}
    birthday {'1930-01-01'}
  end
end