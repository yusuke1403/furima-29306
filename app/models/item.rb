class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :performance
  belongs_to_active_hash :category
  belongs_to_active_hash :postage
  belongs_to_active_hash :shipping_origin
  belongs_to_active_hash :post_time

  validates :name, :image, :content, :category, :performance, :postage, :shipping_origin, :post_time, :price, presence: {message: "can't be blank"}
  validates :category_id, :performance_id, :postage_id, :shipping_origin_id, :post_time_id, numericality: { other_than: 1 ,message: "Select"}
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number'}
  validates_inclusion_of :price, in: 300..9999999, message: 'Out of setting range'
end
