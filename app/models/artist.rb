class Artist < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :artist_name, presence: true

  acts_as_paranoid
end
