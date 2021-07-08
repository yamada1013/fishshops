class Answer < ApplicationRecord
  belongs_to :seller
  belongs_to :question
end
