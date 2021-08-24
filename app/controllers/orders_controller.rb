class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def destroy
   @order = Order.find(params[:id])
   #@buyer = Buyer.find(params[:id])
   @order.destroy
   flash[:notice] = "成功！"
   redirect_to buyer_path, notice:"注文が正常に登録されました。"
 end

  def new
    @fish = Fish.find(params[:fish_id].to_i)
    @order = Order.new
  end

  def confirm
    @fish = Fish.find(order_params[:fish_id])
    @order = Order.new(order_params)
  end

  def create
    #@fish = FIsh.find(order_params[:fish_id])
    @order =Order.new(order_params)
    if @order.save
     redirect_to fishs_path, notice:"注文が正常に登録されました。"
    else
      redirect_to fishs_path, aleart:"注文の登録ができませんでした。"
    end
  end


  private
  def order_params
    params.require(:order).permit(:address, :price, :fish_id,:buyer_id,:seller_id,:ordername)
  end
end
