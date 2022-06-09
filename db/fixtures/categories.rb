Category.delete_all

categories =
  ['Product','TOP DEAL OFFICE','TOP DEAL GAMING',
  'Office Mouse','Keybroad Office','Combo Mouse & Keybroad',
  'Gaming Mouse','Gaming Keybroad','Gaming Console','Headphone']

categories.each_with_index do |value, index|
  Category.seed do |s|
    s.name = value
    s.position  = index
  end
end