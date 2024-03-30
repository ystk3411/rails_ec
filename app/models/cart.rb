# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :item
  has_many :orders, dependent: :destroy
end
