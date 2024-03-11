class OrderMailer < ApplicationMailer
  default from: 'kobazon@example.com'

  def order_email(email,item)
    @order = email
    @items = item
    mail(to: @order.email, subject: 'ご購入ありがとうございます')
  end
end
