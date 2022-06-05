class Item < ApplicationRecord
  belongs_to :user
  has_one :purchese_record
end
