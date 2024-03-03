# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :current_cart

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @item_latest = Item.last
  end
end
