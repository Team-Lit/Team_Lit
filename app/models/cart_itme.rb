class CartItme < ApplicationRecord
  belongs_to :product
  belongs_to :user

  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  validates :product_id, presence: true
  validates :user_id, presence: true
end