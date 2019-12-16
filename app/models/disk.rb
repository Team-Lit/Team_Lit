class Disk < ApplicationRecord

  has_many :songs, dependent: :destroy

  belongs_to :product

  validates :disk_number, presence: true

  acts_as_paranoid
end
