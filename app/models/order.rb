class Order < ApplicationRecord
  
  
  has_many :order_datails
  
  belongs_to :public


  enum delivery_status: {"未配送":0, "配送済み":1}

  acts_as_paranoid

  
end