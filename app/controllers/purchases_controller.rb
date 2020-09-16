class PurchasesController < ApplicationController
  before_action :set_item
  before_action :move_page

  def index
    @purchase = ShippingAddressPurchase.new
  end

  def create
    @purchase = ShippingAddressPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_page
    @item = Item.find(params[:item_id])
    redirect_to new_user_session_path unless user_signed_in?
    redirect_to root_path if current_user.id == @item.user.id
    redirect_to root_path if @item.purchase != nil
  end

  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :tel_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency:'jpy'
    )
  end
end
