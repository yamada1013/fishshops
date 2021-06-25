class FishsController < ApplicationController
  before_action :authenticate_seller!, except: [:index, :show ]

  def index
   @q = Fish.ransack(params[:q])
   @fishs = @q.result(distinct: true)
  end

  def show
    @fish = Fish.find(params[:id])
  end

  def new
    @fish = Fish.new
  end

  def create
    @fish = Fish.create(fish_params)
    @fish.seller_id = current_seller.id
    if @fish.save
    redirect_to fish_path(@fish),notice:"投稿に成功しましたよ"
   else render :new
   end
  end

  def edit
    @fish = Fish.find(params[:id])
    if @fish.seller != current_seller
    redirect_to fish_path, aleart: "不正なアクセスです。"
   end
  end

  def update
    @fish = Fish.find(params[:id])
    @fish.seller_id = current_seller.id
    if @fish.update(fish_params)
       redirect_to fish_path(@fish),notice:"更新に成功しましたよ"
    else render :edit
    end
  end

  def destroy
    @fish = Fish.find(params[:id])
    @fish.seller_id = current_seller.id
    @fish.delete
    redirect_to fishs_path(@fish)
  end

  private
  def fish_params
    params.require(:fish).permit(:fishname, :body, :image)
  end

end
