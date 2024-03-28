class AddOrderIdToPromoCode < ActiveRecord::Migration[7.0]
  def change
    add_reference :promo_codes, :order, foreign_key: true
  end
end
