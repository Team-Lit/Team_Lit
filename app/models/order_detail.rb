class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validates :total_price, presence: true
  # validates :order_id, presence: true
  # validates :product_id, presence: true
  acts_as_paranoid
end
