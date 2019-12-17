class Arrival < ApplicationRecord
  belongs_to :product  

  validates :arrival_date, length: { is: 10 }, presence: true
  validates :arrival_quantity, presence: true
end
