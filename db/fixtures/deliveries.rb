Delivery.delete_all
User.all.each do |user|
  10.times do
    Delivery.seed do |s|
      s.name = Faker::Name.name  
      s.phone = Faker::PhoneNumber.phone_number_with_country_code
      s.address = Faker::Address.full_address
      s.user_id = user.id
    end
  end
end