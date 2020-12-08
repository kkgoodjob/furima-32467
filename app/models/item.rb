class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :days_to_ship
  belongs_to :prefecture
  belongs_to :shipping_fee_burden
  belongs_to :user

  validates :category, :condition, :days_to_ship, :prefecture, :shipping_fee_burden, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates :category_id, :condition_id, :days_to_ship_id, :prefecture_id, :shipping_fee_burden_id, numericality: { other_than: 1 } 
  validates :price, :numericality => { :greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999 }


  has_one_attached :image
end
