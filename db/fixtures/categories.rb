cate = ['Sản phẩm','TOP DEAL VĂN PHÒNG','TOP DEAL GAMING',
  'Chuột Văn Phòng','Bàn Phím Văn Phòng','Combo Chuột & Bàn Phím',
  'Chuột Gaming','Bàn Phím Gaming','Tay Cầm Gaming','Tai nghe']
cate.each do |c|
  Category.create!(name: c) 
end