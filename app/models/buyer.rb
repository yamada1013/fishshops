class Buyer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :buyerfishs, dependent:  :destroy
  has_many  :questions, dependent: :destroy

  has_many :orders

  def self.guest
       find_or_create_by!(email: 'guest@example.com') do |buyer|
         buyer.buyername = "バイヤー用ゲスト"
         buyer.password = SecureRandom.urlsafe_base64
       end
     end

  def already_buyerfished?(fish)
    self.buyerfishs.exists?(fish_id: fish.id)
  end

  #buyerもバリデーションをかける(最後の調整で)

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
