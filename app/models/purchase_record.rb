class PurchaseRecord < ApplicationRecord
  belongs_to :items
  belongs_to :user
  belongs_to :shipping_infomation
end
