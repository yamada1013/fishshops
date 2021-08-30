class BuyersController < ApplicationController
  def index
    @buyers = Buyer.all
  end

  def show
    @buyer = Buyer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
 def buyer_params
   params.require(:buyer).permit(:buyername, :email, :address)
 end
end
