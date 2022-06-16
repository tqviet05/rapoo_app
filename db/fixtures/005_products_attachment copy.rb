ProductAttachment.delete_all

Product.all.each do |product|
  4.times do 
    ProductAttachment.seed do |s|
      s.product_id  = product.id
      s.remote_image_url = Faker::LoremFlickr.image(size: "320x320", search_terms: ['dog'])
    end
  end
end

