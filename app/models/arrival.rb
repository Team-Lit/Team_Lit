class Arrival < ApplicationRecord

  belongs_to :product  


  acts_as_paranoid

  validates :arrival_date, presence: true
  validates :arrival_quantity, presence: true
  validates :product_id, presence: true


end