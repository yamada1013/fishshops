class BuyerfishsController < ApplicationController

  def create
    @buyerfish = current_buyer.buyerfishs.create(fish_id: params[:fish_id])
    redirect_back(fallback_location: root_path )
  end

  def destroy
    @fish = Fish.find(params[:fish_id])
    @buyerfish = current_buyer.buyerfishs.find_by(fish_id: @fish.id)
    @buyerfish.destroy
    redirect_back(fallback_location: root_path)
  end
end
