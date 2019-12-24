class Product < ApplicationRecord
  attr_accessor :arrival
  
  has_many :disks, inverse_of: :product
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true


  has_many :arrivals
  has_many :order_details, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  enum stock_status: {"販売中": 0, "在庫切れ": 1, "売切れ": 2}

  validates :product_name, presence: true
  validates :stock_status, presence: true
  validates :artist_id, presence: true
  validates :label_id, presence: true
  validates :genre_id, presence: true
  validates :pre_tax_price, presence: true

  attachment :jacket_image

  acts_as_paranoid

end
