class ItemsController < ApplicationController
before_action :move_to_sign_up, except: [:index , :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :performance_id, :postage_id, :shipping_origin_id, :post_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end
end
