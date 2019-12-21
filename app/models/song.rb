class Song < ApplicationRecord

  belongs_to :disk

  validates :song_title, presence: true
  validates :song_order, presence: true
  
  # acts_as_paranoid
end
