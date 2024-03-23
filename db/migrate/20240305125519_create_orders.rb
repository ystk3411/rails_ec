# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :address1
      t.string :address2
      t.string :country
      t.string :prefecture
      t.integer :zip_code
      t.string :name_on_card
      t.integer :credit_card_number
      t.string :credit_card_expiration
      t.integer :cvv
      t.references :cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end
