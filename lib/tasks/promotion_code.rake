namespace :promotion_code do
  task generate: :environment do
    10.times do |n|
      code = SecureRandom.alphanumeric(7)
      discount = rand(100..1000)
      PromoCode.create(code:code,discount:discount,status:true)
    end
  end
end
