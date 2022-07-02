require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品できる時' do
    it '画像を添付して商品名、説明、カテゴリー、状態、配送料、発送元、発送までの日数、価格を入力すると出品できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品出来ないとき' do
    it '商品名が空では出品出来ない' do
      
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が空では出品出来ない' do
      
      @item.text = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Text can't be blank")
    end
    it 'カテゴリーの情報が空では出品出来ない' do
      
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態の情報が空では出品出来ない' do
      
      @item.grade_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Grade can't be blank")
    end
    it '配送料の負担の情報が空では出品出来ない' do
      
      @item.postage_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end
    it '発送元の地域の方法が空では出品出来ない' do
      
      @item.area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it '発送までの日数の情報が空では出品出来ない' do
      
      @item.schedule_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule can't be blank")
    end
    it '価格の情報が空では出品出来ない' do
      
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格が300円未満では出品出来ない' do
      
      @item.price = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円から9,999,999円の間で出品して下さい')
    end
    it '価格が10,000,000円を超えると出品出来ない' do
      
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円から9,999,999円の間で出品して下さい')
    end
    it '価格が半角数値でないと出品出来ない' do
      
      @item.price = '２０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price 半角数字で300円から9,999,999円の間で出品して下さい')
    end
    it '画像が添付されていないと出品出来ない' do

      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it 'userが紐づいてなければ出品出来ない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
  end
end
