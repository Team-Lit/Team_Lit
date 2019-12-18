class Genre < ApplicationRecord
  has_many :products, dependent: :destroy

  # validates :genre_name, presence: true

  acts_as_paranoid
end
