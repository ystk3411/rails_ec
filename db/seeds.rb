# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Item.destroy_all

items = [
  { name: 'おにぎり', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) },
  { name: 'カニ', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) },
  { name: 'プロテインバー', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) },
  { name: '金沢カレー', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) },
  { name: '餅', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) },
  { name: '揚げ餃子', price: rand(1000..2000), describe: 'test', sku: 'test', stock: rand(10) }
]

items.each do |item|
  item_data = Item.create!(item)
  item_data.image.attach(io: File.open(Rails.root.join("app/assets/images/#{item_data.name}.png")),
                         filename: "#{item_data.name}.png")
end
