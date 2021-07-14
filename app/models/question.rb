class Question < ApplicationRecord
  belongs_to :buyer
  has_many :answers, dependent: :destroy

  #belongs_to :fish
  #belongs_to :buyer
end
