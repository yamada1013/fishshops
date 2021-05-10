class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buyerfishs, dependent:  :destroy

  def already_buyerfished?(fish)
    self.buyerfishs.exists?(fish_id: fish.id)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
