class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #has_many :orders
   def self.guest
       find_or_create_by!(email: 'guest@example.com') do |seller|
         seller.sellername = "セラー用ゲスト"
         seller.password = SecureRandom.urlsafe_base64
         #seller.confirmed_at = Time.now
         # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
         # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
       end
     end


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
