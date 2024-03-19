# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  def cart_price_total
    total = 0

    current_cart.cart_items.each do |item|
      total += item.item.price * item.quantity
    end
    total
  end

  private

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= current_cart.id
    current_cart
  end
end
