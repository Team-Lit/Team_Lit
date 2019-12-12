class Deliverie < ApplicationRecord
  belongs_to :user

  validates :zip, length: { is 7 }
  validates :address, presence: true
  validates :address_name, presence: true
end
