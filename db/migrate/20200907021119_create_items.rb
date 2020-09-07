class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user                , null: false, foreign_key: true
      t.string     :name                , null: false
      t.text       :content             , null: false
      t.integer    :category_id         , null: false
      t.integer    :performance_id      , null: false
      t.integer    :postage_id          , null: false
      t.integer    :shipping_origin_id  , null: false
      t.integer    :post_time_id        , null: false
      t.integer    :price               , null: false
      t.timestamps
    end
  end
end
