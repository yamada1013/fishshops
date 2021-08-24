class Fish < ApplicationRecord
  attachment :image
  belongs_to :seller
  has_many :buyerfishs, dependent: :destroy

  has_many :orders

 #has_many :questions
  has_many :questions , dependent: :destroy
  has_many :answers , dependent: :destroy
  with_options presence: true do
    validates :fishname
    validates :body
    validates :image
  end
end
