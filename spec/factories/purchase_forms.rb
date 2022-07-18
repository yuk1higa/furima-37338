FactoryBot.define do
  factory :purchase_form do
    user_id { 1 }
    item_id { 1 }
    post_number { '100-0000' }
    area_id { 2 }
    municipalitie { '市町村' }
    address { 111 }
    building_name { 'ビル' }
    phone_number { 99_911_112_222 }
    token { 'tok_abcdefghijk000000000000000000' }
  end
end
