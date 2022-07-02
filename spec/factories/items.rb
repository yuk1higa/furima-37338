FactoryBot.define do
  factory :item do
    association :user
    name { 'test' }
    text { 'test' }
    category_id { '2' }
    grade_id { '2' }
    postage_id { '2' }
    area_id { '2' }
    schedule_id { '2' }
    price { '2000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
