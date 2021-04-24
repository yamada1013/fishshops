class SellersController < ApplicationController
  before_action :authenticate_seller!, except: [:index]

  def index
    @sellers = Seller.all
  end

  def show
    @seller = Seller.find(params[:id])
  end

  def edit
    @seller = Seller.find(params[:id])
    if @seller != current_seller
    redirect_to seller_path, aleart: "不正なアクセスです。"
   end
  end

  def update
    @seller = Seller.find(params[:id])
    @seller.update(seller_params)
    redirect_to seller_path(@seller),notice: "更新に成功しました"
  end

  private
 def seller_params
   params.require(:seller).permit(:sellername, :email, :profile, :profile_image)
 end
end
