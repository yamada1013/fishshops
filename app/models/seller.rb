class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #has_many :orders


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   attachment :profile_image
   has_many :fishs , dependent: :destroy

   has_many :answers, dependent: :destroy

   with_options presence: true do
     validates :sellername
     validates :email
   end
end
