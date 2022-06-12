class CartItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :product 
  # belongs_to :cart
end
