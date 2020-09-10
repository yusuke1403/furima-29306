class PurchasesController < ApplicationController
  before_action :move_to_sign_up
  before_action :set_item

  def index
    @purhcase = Purchase.new
    @item = Item.find(params[:item_id])
  end

  private

  def set_item
  end

  def move_to_sign_up
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
