class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)\w{6,}\z/
  validates :password,
            format: { with: VALID_PASSWORD_REGEX,
                      message: 'passwordは半角英数字混合の入力が必要です' }
  validates :nickname, presence: :true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用して下さい' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用して下さい' } do
    validates :kana_first_name
    validates :kana_last_name
  end
  validates :birthday, presence: :true
end
