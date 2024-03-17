# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :item, through: :item
  has_many :order,dependent: :destroy
end
