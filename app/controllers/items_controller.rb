class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Items.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :condition_id, :shipping_fee_burden_id, :prefecture_id, :days_to_ship_id, :explanation, :price, :image).merge(user_id: current_user.id)

end
