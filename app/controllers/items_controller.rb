class ItemsController < ApplicationController
  before_action :move_to_sign_up, except: [:index, :show]
  before_action :item_find, only: [:edit, :update, :show, :destroy]
  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_find
    @item = Item.find(params[:id])
    @purchase = @item.purchase
  end

  def item_params
    params.require(:item).permit(:name, :image, :content, :category_id, :performance_id, :postage_id, :shipping_origin_id, :post_time_id, :price).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    redirect_to new_user_registration_path unless user_signed_in?
  end
end
