class Deliverie < ApplicationRecord
  belongs_to :public

  validates :zip, length: { is: 8 }
  validates :address, presence: true
  validates :address_name, presence: true
end
