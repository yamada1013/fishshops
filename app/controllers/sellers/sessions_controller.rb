class  Sellers::SessionsController < Devise::SessionsController
  def guest_sign_in
    seller = Seller.guest
    sign_in seller
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
