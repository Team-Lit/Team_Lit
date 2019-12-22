class Charge < ApplicationRecord

  validates :charge, presence: true
  validates :tax_rate, presence: true

end
