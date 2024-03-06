# frozen_string_literal: true

class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :cart, through: :cart_items
  has_many :order_detail
end
