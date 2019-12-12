class Arrival < ApplicationRecord
  belongs_to :product

  validates :arrival_date, length: { is: 11 }
end
