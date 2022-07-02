require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemailとlast_nameとfirst_nameとkana_last_nameとkana_first_nameとbirthdayが存在し、passwordとpassword_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ないとき' do
      it 'nicknameが空では登録出来ない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録出来ない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録出来ない(一意性でないといけない)' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは@を含む必要がある' do
        @user.email = 'hogecom'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが6文字以下では登録出来ない' do
        @user.password = 'Abcde'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationは一致していること' do
        @user.password = 'Abcdef'
        @user.password_confirmation = 'Abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは半角英数混合であること' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password passwordは半角英数字混合の入力が必要です')
      end
      it '名前は、名字が必要であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名前は、名前が必要であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前は、全角（漢字、ひらがな、カタカナ）での入力が必須であること' do
        @user.last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用して下さい')
      end
      it '名前(カナ)は、名字が必要であること' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it '名前(カナ)は、名前が必要であること' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it '名前(カナ)は、全角カタカナでの入力が必須であること' do
        @user.kana_last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name 全角カタカナを使用して下さい')
      end
      it '誕生日が空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '数字のみのパスワードでは登録出来ない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password passwordは半角英数字混合の入力が必要です')
      end
      it '全角文字を含むパスワードでは登録出来ない' do
        @user.password = '全角文字でパスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password passwordは半角英数字混合の入力が必要です')
      end
      it 'first_nameに半角文字が含まれていると登録出来ない ' do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用して下さい')
      end
      it 'kana_first_nameにカタカナ以外の文字(平仮名・漢字・英数字・記号)が含まれていると登録出来ない' do
        @user.kana_first_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name 全角カタカナを使用して下さい')
      end
    end
  end
end
