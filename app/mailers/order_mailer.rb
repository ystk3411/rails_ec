# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  helper :carts

  def order_email(order, item)
    @order = order
    @items = item
    mail(to: @order.email, subject: 'ご購入ありがとうございます')
  end
end
