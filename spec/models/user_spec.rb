require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録出来ない' do
      # ↓↓nicknameが空では登録出来ないテストコードを記述↓↓
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録出来ない' do
      # ↓↓emailが空では登録出来ないテストコードを記述↓↓
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
