class Buyerfish < ApplicationRecord
  belongs_to :buyer
  belongs_to :fish
  validates_uniqueness_of :fish_id , scope:  :buyer_id
end
