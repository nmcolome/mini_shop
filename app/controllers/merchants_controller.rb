class MerchantsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def show
    @merchant = Merchant.find(params[:id])
  end

  def new
  end

  def create
    Merchant.create!(merchant_params)

    redirect_to '/merchants'
  end

  private_methods
  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end
end
