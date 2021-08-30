class Buyers::SessionsController < Devise::SessionsController
  def guest_sign_in
    buyer = Buyer.guest
    sign_in buyer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
