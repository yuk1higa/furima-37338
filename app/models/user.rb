class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         
         validates :nickname, presence: :true 
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message: '全角文字を使用して下さい'} do
         validates :first_name 
         validates :last_name 
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用して下さい'} do
         validates :kana_first_name
         validates :kana_last_name
         end
         validates :birthday, presence: :true

end
