class ItemsController < ApplicationController
  def index
    @items = if params[:merchant_id].nil?
               Item.all.page params[:page]
             else
               Merchant.find(params[:merchant_id]).items.page params[:page]
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    Item.update(item_params)

    redirect_to "/items/#{params[:id]}"
  end

  def destroy
    Item.destroy(params[:id])

    redirect_to '/items'
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :inventory, :status)
  end
end
