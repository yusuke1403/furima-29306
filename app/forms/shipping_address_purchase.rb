class ShippingAddressPurchase

  include ActiveModel::Model
 attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :tel_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, :address, :token
    validates :tel_number, numericality: { only_integer: true }
  end
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }

  def save
    # 購入の情報を保存し、「purchase」という変数に入れている
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, tel_number: tel_number, purchase_id: purchase.id)
  end
end