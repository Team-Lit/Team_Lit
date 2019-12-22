class Disk < ApplicationRecord

  has_many :songs, inverse_of: :disk
  accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

  belongs_to :product

  acts_as_paranoid

  validates :disk_numbre, presence: true

end
