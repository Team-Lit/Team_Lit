class Label < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :label_name, presence: true

  acts_as_paranoid
end
