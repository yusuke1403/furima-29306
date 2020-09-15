class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.references  :purchase      , null: false, foreign_key: true
      t.string      :postal_code    , null: false
      t.integer     :prefecture_id  , null: false
      t.string      :city           , null: false
      t.string      :address        , null: false
      t.string      :building_name
      t.string      :tel_number     , null: false
      t.timestamps
    end
  end
end
