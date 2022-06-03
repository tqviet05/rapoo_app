Category.delete_all

categories =
  ['Sản phẩm','TOP DEAL VĂN PHÒNG','TOP DEAL GAMING',
  'Chuột Văn Phòng','Bàn Phím Văn Phòng','Combo Chuột & Bàn Phím',
  'Chuột Gaming','Bàn Phím Gaming','Tay Cầm Gaming','Tai nghe']

categories.each_with_index do |value, index|
  Category.seed do |s|
    s.name = value
    s.position  = index
  end
end