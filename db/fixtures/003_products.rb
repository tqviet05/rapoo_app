Product.delete_all

Category.all.each do |category|
  50.times do
    Product.seed do |s|
      s.name = Faker::Commerce.product_name
      s.price = rand(500...100000)
      s.description  = Faker::Lorem.sentences.first
      s.category_id  = category.id
    end
  end
end
