class OrdersController < ApplicationController
  def index
    @orders = current_cart.order.order_detail.includes([:item]).order(created_at: :desc)
  end

  def show
  end

  def create
    order = Order.new(order_params)
    order.save
    cart_items = current_cart.cart_items.all

    cart_items.each do |item|
      order_details = OrderDetail.new
      order_details.order_id = order.id
      order_details.item_id= item.item.id
      order_details.name = item.item.name
      order_details.price = item.item.price
      order_details.quantity = item.quantity
      order_details.save
    end

    flash[:info] = "購入ありがとうございます"
    current_cart.cart_items.destroy_all
    redirect_to items_path


  end

  private
  def order_params
    params.require(:order).permit(%i[first_name last_name username email address1 address2 country prefecture zip_code name_on_card credit_card_number credit_card_expiration cvv cart_id])
  end
end
