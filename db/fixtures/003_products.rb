Product.delete_all
top_deal_office_images = ['https://cf.shopee.vn/file/d8d2859084f63bed300cea0fa3256070_tn', 'https://cf.shopee.vn/file/ba8a75f23f00ca362c3358ea7c6103ef_tn', 'https://cf.shopee.vn/file/a86d6d9bfcd70fc7bac2df7a98f59d4f_tn', 'https://cf.shopee.vn/file/a946b647750502f6d70e5e9e5859de64_tn', 'https://cf.shopee.vn/file/d2ac28e17b09ab205c50c099908a4771_tn', 'https://cf.shopee.vn/file/1bcc47d966e7825a96efe7eb6c9ddbc8_tn', 'https://cf.shopee.vn/file/ba8a75f23f00ca362c3358ea7c6103ef_tn', 'https://cf.shopee.vn/file/a86d6d9bfcd70fc7bac2df7a98f59d4f_tn', 'https://cf.shopee.vn/file/a946b647750502f6d70e5e9e5859de64_tn', 'https://cf.shopee.vn/file/d2ac28e17b09ab205c50c099908a4771_tn', 'https://cf.shopee.vn/file/2ff609dc6d473ce0a5de3a9b6ba1f449_tn', 'https://cf.shopee.vn/file/61b23b09e28c9025acce8de941eb3440_tn', 'https://cf.shopee.vn/file/1bcc47d966e7825a96efe7eb6c9ddbc8_tn', 'https://cf.shopee.vn/file/7fdc9b56cbd4571b98ec45e81aeedca6_tn', 'https://cf.shopee.vn/file/ba9077c73aed3dc1eb1b2961c01aa4d2_tn', 'https://cf.shopee.vn/file/7e19ab18b352db92b85baf567387f97b_tn', 'https://cf.shopee.vn/file/e58914fa9d22ce080409cb9ad81dedc0_tn', 'https://cf.shopee.vn/file/1b478c2a9b03e4819449dad0267bae06_tn', 'https://cf.shopee.vn/file/35d44d46287f9d0ffe40240e93b143ca_tn', 'https://cf.shopee.vn/file/a5739a17a6cd62cd6d01a852bf9659b9_tn', 'https://cf.shopee.vn/file/31feb1b66d6d1896c0c4e1b8c4500f78_tn', 'https://cf.shopee.vn/file/ba8a75f23f00ca362c3358ea7c6103ef_tn', 'https://cf.shopee.vn/file/a86d6d9bfcd70fc7bac2df7a98f59d4f_tn', 'https://cf.shopee.vn/file/a946b647750502f6d70e5e9e5859de64_tn', 'https://cf.shopee.vn/file/d2ac28e17b09ab205c50c099908a4771_tn', 'https://cf.shopee.vn/file/2ff609dc6d473ce0a5de3a9b6ba1f449_tn', 'https://cf.shopee.vn/file/61b23b09e28c9025acce8de941eb3440_tn', 'https://cf.shopee.vn/file/f8b4aaa6e60b30d20f202d2f39aea3c3_tn', 'https://cf.shopee.vn/file/120da20bcb372c88d31be43c711f55ae_tn', 'https://cf.shopee.vn/file/06d35345baee6cc9ae0abf737c5c76e0_tn', 'https://cf.shopee.vn/file/9671c95d9c1d54c6385d958d6ff01889_tn', 'https://cf.shopee.vn/file/eabf4b88c3d8231d964099f790290180_tn', 'https://cf.shopee.vn/file/3b45094f3c50ce3def7d33cc1a5e2153_tn', 'https://cf.shopee.vn/file/ac8062f441b7f1d5a8d6cb2fbff68038_tn', 'https://cf.shopee.vn/file/335bb369b0721c5c901e8eac3220ce23_tn']

Category.all.each do |category|
  top_deal_office_images.size.times do |index|
    Product.seed do |s|
      s.name = Faker::Commerce.product_name
      s.price = rand(500...100000)
      s.description  = Faker::Lorem.sentences.first
      s.category_id  = category.id
      
      if category.name == 'Top deal office'
        s.remote_image_url = top_deal_office_images[index]
      end
    end
  end
end
