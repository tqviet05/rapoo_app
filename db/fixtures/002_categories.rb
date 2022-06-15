Category.delete_all

categories =
  ['Product','Top deal office','Top deal gaming',
  'Office Mouse','Keybroad Office','Combo Mouse & Keybroad',
  'Gaming Mouse','Gaming Keybroad','Gaming Console','Headphone']

categories.each_with_index do |value, index|
  Category.seed do |s|
    s.name = value
    s.position  = index
  end
end