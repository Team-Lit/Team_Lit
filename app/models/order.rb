class Order < ApplicationRecord
  has_many :order_datails, dependent: :destroy
  has_many :products, dependent: :destroy
  
  belongs_to :user

  validates :product_id, presence: true
  validates :end_user_id, presence: true
  validates :tax_rate, presence: true
  validates :delivery_charge, presence: true
  validates :total_price, presence: true
  validates :payment_mothed, presence: true
  validates :zip, length: { is 7 }
  validates :address, presence: true
  validates :address_name, presence: true
  
end
