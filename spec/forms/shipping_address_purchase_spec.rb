require 'rails_helper'

RSpec.describe ShippingAddressPurchase, type: :model do
  describe '商品購入機能の実装' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('app/assets/images/item-sample.png')
      @item.save
      sleep(1)
      @shipping_address_purchase = FactoryBot.build(:shipping_address_purchase, user_id: @user.id, item_id: @item.id)

    end

    it '全ての項目を正しく記載していれば、購入できる' do
      expect(@shipping_address_purchase).to be_valid
    end

    # totenのテストコード
    it 'カード情報のtokenが生成されなければ購入できないこと' do
      @shipping_address_purchase.token = ""
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Token can't be blank")
    end
    
    # postal_codeのテストコード
    it '郵便番号が空では購入できないこと' do
      @shipping_address_purchase.postal_code = ""
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号はハイフンが入っていないと購入できないこと' do
      @shipping_address_purchase.postal_code = "1112222"
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    # prefecture_idのテストコード
    it '都道府県が選択されていなけれは購入できないこと' do
      @shipping_address_purchase.prefecture_id = 1
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Prefecture Select")
    end

    # cityのテストコード
    it '市町村が空では購入できないこと' do
      @shipping_address_purchase.city = ""
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("City can't be blank")
    end

    # addressのテストコード
    it '番地が空では購入できないこと' do
      @shipping_address_purchase.address = ""
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Address can't be blank")
    end

    # tel_numberのテストコード
    it '電話番号が空では購入できないこと' do
      @shipping_address_purchase.tel_number = ""
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Tel number can't be blank")
    end

    it '電話番号にハイフンがあると購入できないこと' do
      @shipping_address_purchase.tel_number = "090-1111222"
      @shipping_address_purchase.valid?
      expect(@shipping_address_purchase.errors.full_messages).to include("Tel number Half-width number")
    end
  end
end