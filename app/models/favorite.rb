class Favorite < ApplicationRecord

  belongs_to :public
  belongs_to :product
end
