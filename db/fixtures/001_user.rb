User.delete_all

data = [
  { email: 'guest@example.com', password: '1231234' },
  { email: 'tangquocviet@gmail.com', password: '123123' }

]

data.each do |user|
  User.seed(email: user[:email], password: user[:password], password_confirmation: user[:password])
end
50.times do |t|
  User.seed do |s|
    s.email = "guest1#{t}@example.com"
    s.password = '123123'

  end
end