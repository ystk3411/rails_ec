# frozen_string_literal: true

class CreatePromoCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_codes do |t|
      t.string :code
      t.integer :discount
      t.boolean :is_used

      t.timestamps
    end
  end
end
