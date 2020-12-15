class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:create, :index]
  def index
    @orders = Order.all
    @order_address = OrderAddress.new
    if user_signed_in? && current_user.id != @order_item.user_id
      @orders.each do |order|
        if @order_item.id == order.item_id
          redirect_to root_path and return
        end
      end
    else
      redirect_to root_path and return
    end
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @order_item.price,
      card: order_address_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @order_item = Item.find(params[:item_id])
  end
end
