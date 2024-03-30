# frozen_string_literal: true

module CartsHelper
  def cart_item_size
    item_size = 0

    current_cart.cart_items.each do |item|
      item_size += item.quantity
    end

    item_size
  end

  def cart_price_total
    total = 0

    current_cart.cart_items.each do |item|
      total += item.item.price * item.quantity
    end
    total
  end

  def item_price_total(item)
    item.quantity * item.item.price
  end

  def price_dicounted
    discount = PromoCode.find_by(code: session[:register_code])
    cart_price_total - discount.discount
  end
end
