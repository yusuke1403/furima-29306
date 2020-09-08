require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    end

    it '全ての項目を記載していれば、商品出品できる' do
      expect(@item).to be_valid
    end

    # nameのテストコード
    it '商品名が空では出品できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    # imageのテストコード
    it '商品画像が空では出品できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    # contentのテストコード
    it '商品説明が空では出品できないこと' do
      @item.content = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end

    # category_idのテストコード
    it 'カテゴリが何も選択されていなければ出品できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    # performance_idのテストコード
    it '商品の状態が何も選択されていなければ出品できないこと' do
      @item.performance_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Performance Select')
    end

    # postage_idのテストコード
    it '配送料の負担が何も選択されていなければ出品できないこと' do
      @item.postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Postage Select')
    end

    # shipping_origin_idのテストコード
    it '発送元の地域が何も選択されていなければ出品できないこと' do
      @item.shipping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping origin Select')
    end

    # post_time_idのテストコード
    it '発送までの日数が何も選択されていなければ出品できないこと' do
      @item.post_time_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Post time Select')
    end

    # priceのテストコード
    it '販売価格が空では出品できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格の範囲が、¥299以下では出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '販売価格の範囲が、¥10000000以上では出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '販売価格が全角数字では出品できないこと' do
      @item.price = '３５０'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end
  end
end
