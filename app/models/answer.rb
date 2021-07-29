class Answer < ApplicationRecord
  belongs_to :seller
  belongs_to :question

  belongs_to :fish


end
