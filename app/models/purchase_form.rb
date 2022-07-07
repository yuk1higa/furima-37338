class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :area_id, :municipalitie, :address, :building_name, :phone_number

    with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id,numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalitie
    validates :address
    validates :building_name
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
end

def save
  purchase = Purchase_record.create(user_id: user_id, item_id: item_id)
  Shipping_infomation.create(post_number: post_number, area_id: area_id, municipalitie: municipalitie, address: address, building_name: building_name, phone_number: phone_number )
end
end