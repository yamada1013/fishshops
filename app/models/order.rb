class Order < ApplicationRecord
  belongs_to :fish
  belongs_to :buyer

  #belongs_to :seller
end
