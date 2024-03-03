# frozen_string_literal: true

module ApplicationHelper
  def hidden_field_tag(_name, _value = nil, _options = {})
    raise 'Happiness chainではhidden_field_tagの使用を禁止しています'
  end

  def current_cart
    current_cart = Cart.find_by(id: session[:cart_id]) || Cart.create
    session[:cart_id] ||= current_cart.id
    current_cart
  end
end
