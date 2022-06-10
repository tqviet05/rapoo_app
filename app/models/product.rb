class Product < ApplicationRecord
  acts_as_paranoid
#   has_many :cart_items
#   has_many :cart, through: :cart_items
end
