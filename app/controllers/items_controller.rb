class ItemsController < ApplicationController
  def index
    if params[:merchant_id].nil?
      @items = Item.all
    else
      @items = Merchant.find(params[:merchant_id]).items
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
  end

  def create
    merchant = Merchant.find(params[:merchant_id])
    merchant.items.create!(item_params)

    redirect_to "/merchants/#{params[:merchant_id]}/items"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :inventory)
  end
end
