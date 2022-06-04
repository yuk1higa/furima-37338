require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録出来ない' do
      # ↓↓nicknameが空では登録出来ないテストコードを記述↓↓
      user = User.new(nickname: '', email: 'test@test.com', password: '111111', password_confirmation: '111111', first_name: '太郎', last_name: '中田', kana_first_name: 'タロウ', kana_last_name: 'ナカダ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録出来ない' do
      # ↓↓emailが空では登録出来ないテストコードを記述↓↓
      user = User.new(nickname: 'test', email: '', password: '111111', password_confirmation: '111111', first_name: '太郎', last_name: '中田', kana_first_name: 'タロウ', kana_last_name: 'ナカダ', birthday: '1930-01-01')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
