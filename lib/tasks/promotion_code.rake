# frozen_string_literal: true

namespace :promotion_code do
  task generate: :environment do
    10.times do
      code = SecureRandom.alphanumeric(7)
      discount = rand(100..1000)
      PromoCode.create(code:, discount:, is_used: true)
    end
  end
end
