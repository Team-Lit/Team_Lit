class Delivery < ApplicationRecord
  belongs_to :public, optional: true

  # validates :zip, length: { is: 8 }
  # validates :address, presence: true
  # validates :address_name, presence: true
  acts_as_paranoid
end
