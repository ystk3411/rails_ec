class OrderMailer < ApplicationMailer
  default from: 'kobazon@example.com'
  helper CartsHelper

  def order_email(email,item)
    @order = email
    @items = item
    @price_total = number_to_currency(cart_price_total,locale:'jp')
    mail(to: @order.email, subject: 'ご購入ありがとうございます')
  end
end
