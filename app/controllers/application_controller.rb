# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_cart

  private

  def current_cart
    current_cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] ||= current_cart.id
    current_cart
  end
end
