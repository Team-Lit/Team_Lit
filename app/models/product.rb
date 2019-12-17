class Product < ApplicationRecord
  has_many :arrivals, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :disks, dependent: :destroy
  has_many :cart_itmes, dependent: :destroy

  belongs_to :artist
  belongs_to :label
  belongs_to :genre

  # validates :product_name, presence: true
  # validates :jacekt_image_id, presence: true
  # validates :artist, presence: true
  # validates :label, presence: true
  # validates :genre, presence: true
  # validates :disk, presence: true
  # validates :per_tax_price, presence: true
  acts_as_paranoid
end
