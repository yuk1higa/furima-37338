class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :grade
  belongs_to :postage
  belongs_to :area
  belongs_to :schedule


  validates :name, :text, :price, :user,  presence: true
  validates :category_id, :grade_id, :postage_id, :area_id, :area_id, :schedule_id, numericality: { other_than: 1, message: "can't be blank" }
end
