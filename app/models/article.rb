class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :grade
  belongs_to :postage
  belongs_to :area
  belongs_to :schedule
  
end
