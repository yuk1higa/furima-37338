require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
 before do 
  @purchase_form = FactoryBot.build(:purchase_form)
 end

 describe '購入者情報の保存' do
  context '購入者情報が保存できるとき' do
    it '必要な情報を入力していれば保存できる' do
      expect(@purchase_form).to be_valid
    end
  end
  context '購入者情報が保存できないとき' do
    it 'user_idが空だと保存できない' do
      @purchase_form.user_id = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include ("User can't be blank")
    end
    it 'item_idが空だと保存できない' do
      @purchase_form.item_id = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Item can't be blank")
    end
    it '郵便番号が空だと保存できない' do
      @purchase_form.post_number = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Post number can't be blank")
    end
    it '郵便番号にハイフンが入っていないと保存できない' do
      @purchase_form.post_number = '1111111'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
    end
    it '都道府県が選択されていないと保存できない' do
      @purchase_form.area_id = '1'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Area can't be blank")
    end
    it '市町村が空だと保存できない' do
      @purchase_form.municipalitie = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Municipalitie can't be blank")
    end
    it '番地が空だと保存できない' do
      @purchase_form.address = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が空だと保存できない' do
      @purchase_form.phone_number = ''
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が11桁未満だと保存できない' do
      @purchase_form.phone_number = '1234567890'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が12桁以上あると保存できない' do
      @purchase_form.phone_number = '123456789012'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が全角数字だと保存できない' do
      @purchase_form.phone_number = '１２３４５６７８９０１'
      @purchase_form.valid?
      expect(@purchase_form.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
end
