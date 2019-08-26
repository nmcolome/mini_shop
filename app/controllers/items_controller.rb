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
end
