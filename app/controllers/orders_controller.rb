class OrdersController < ApplicationController
  def index
    @order_item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_item = Item.find(params[:item_id])
    binding.pry
    @order_address = OrderAddress.new(order_address_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_address_params
    params.require(:order_address).permit(:item_id, :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: params[:price])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @order_item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end
end
