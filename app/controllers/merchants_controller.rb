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

  def edit
    @merchant = Merchant.find(params[:id])
  end

  def update
    Merchant.update(merchant_params)

    redirect_to "/merchants/#{params[:id]}"
  end

  def destroy
    Merchant.destroy(params[:id])

    redirect_to '/merchants'
  end

  private_methods
  def merchant_params
    params.require(:merchant).permit(:name, :address, :city, :state, :zip)
  end
end
