# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] ||= current_cart.id
    current_cart
  end
end
