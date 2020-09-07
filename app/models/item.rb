class Item < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :performance
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :post_time
end
