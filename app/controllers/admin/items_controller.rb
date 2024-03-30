# frozen_string_literal: true

module Admin
  class ItemsController < ApplicationController
    before_action :basic_auth, only: %i[index new edit]
    before_action :set_item, only: %i[edit update destroy]

    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        redirect_to admin_items_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if @item.update(item_params)
        redirect_to admin_items_path
      else
        render :edit
      end
    end

    def destroy
      if @item.destroy
        redirect_to admin_items_path
      else
        render :index
      end
    end

    private

    def basic_auth
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def item_params
      params.require(:item).permit(:name, :price, :describe, :sku, :stock, :image)
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end
end
