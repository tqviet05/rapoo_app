class Product < ApplicationRecord
  acts_as_paranoid

  has_many :recently_products
#   has_many :cart, through: :cart_items
end
