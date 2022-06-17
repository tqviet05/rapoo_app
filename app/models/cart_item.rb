class CartItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :product 
  # belongs_to :cart
  validates :quantity, presence: true

end
