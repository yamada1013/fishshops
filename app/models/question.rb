class Question < ApplicationRecord
  belongs_to :buyer
  has_many :answers, dependent: :destroy
end
