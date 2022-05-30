100.times do
  product = 
    Product.seed do |s|
      s.name = Faker::Commerce.product_name
      s.price = rand(500...100000)
      s.description  = Faker::Lorem.sentences.first
      # s.category_id  = Category.take(5).map(&:id).sample
    end
    # product.update!(category_id: )
end