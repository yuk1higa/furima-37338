class PurchaseForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :area_id, :municipalitie, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalitie
    validates :address
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, area_id: area_id, municipalitie: municipalitie, address: address,
                   building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
