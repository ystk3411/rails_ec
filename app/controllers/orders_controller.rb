# frozen_string_literal: true

class OrdersController < ApplicationController
  # before_action :basic_auth, only: %i[index show]
  def index
    @orders = current_cart.order
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order_price = OrderDetail.find_by(order_id:params[:id]).price
    @discount = PromoCode.find_by(order_id:params[:id]).discount
    p @discount
  end

  def create
    # メーラーのメソッドの引数として使用するためトランザクションのブロック外に変数を定義
    order = Order.new(order_params)
    order[:cart_id] = current_cart.id
    discount = PromoCode.find_by(code: session[:register_code])

    ActiveRecord::Base.transaction do
      order.save!
      cart_items = current_cart.cart_items.all

      cart_items.each do |item|
        order_details = OrderDetail.new
        order_details.order_id = order.id
        order_details.item_id = item.item.id
        order_details.name = item.item.name
        if session[:register_code].present?
          order_details.price = cart_price_total - discount.discount
        else
          order_details.price = cart_price_total
        end
        order_details.quantity = item.quantity
        order_details.save!
        discount.is_used = false
        discount.order_id = order.id
        session[:register_code].clear
        discount.save!
      end
    end

    flash[:info] = '購入ありがとうございます'

    OrderMailer.order_email(order, current_cart.cart_items.includes([:item]).order(created_at: :desc)).deliver_now
    current_cart.cart_items.destroy_all
    redirect_to items_path
  end

  private

  def order_params
    params.require(:order).permit(%i[first_name last_name username email address1 address2 country prefecture zip_code
                                     name_on_card credit_card_number credit_card_expiration cvv cart_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |name, password|
      name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
