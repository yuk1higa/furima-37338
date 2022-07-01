class Item < ApplicationRecord
  
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :grade
    belongs_to :postage
    belongs_to :area
    belongs_to :schedule
  
  
    validates :name, :text, :price, :user, :image,  presence: true
    validates :category_id, :grade_id, :postage_id, :area_id, :area_id, :schedule_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :price, numericality: { with: /\A[0-9]+\z/,greater_than: 300, less_than: 9999999, message: '半角数字で300円から9,999,999円の間で出品して下さい'}
    
    
  
  belongs_to :user
  has_one :purchese_record
  has_one_attached :image
end
