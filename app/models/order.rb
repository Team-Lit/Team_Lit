class Order < ApplicationRecord
  
  
  has_many :order_details
  
  belongs_to :public


  enum delivery_status: {"未配送":0, "配送済み":1}


  validates :zip, presence: true
  validates :address, presence: true
  validates :address_name, presence: true

  acts_as_paranoid

  array = []
  Order.all.each do |order|
    array << order.total_price
  end
  array.sum
  
end