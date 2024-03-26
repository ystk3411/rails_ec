# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @items = current_cart.cart_items.includes([:item]).order(created_at: :desc)
    @order = Order.new
    @promo_code = PromoCode.new
    @discount = PromoCode.find_by(code: session[:register_code])
  end

  def create
    cart_item ||= current_cart.cart_items.build(item_id: params[:item_id])
    cart_item.increment(:quantity, params[:quantity].to_i)

    if cart_item.save
      redirect_to request.referer
    else
      render 'items/index'
    end
  end

  def destroy
    cart_item = current_cart.cart_items.find(params[:id])

    if cart_item.destroy
      redirect_to request.referer
    else
      render :index
    end
  end
end
