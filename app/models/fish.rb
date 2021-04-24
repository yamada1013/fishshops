class Fish < ApplicationRecord
  attachment :image
  belongs_to :seller

  with_options presence: true do
    validates :fishname
    validates :body
    validates :image
  end
end
