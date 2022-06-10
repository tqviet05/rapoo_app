class Cart < ApplicationRecord
  acts_as_paranoid
  has_many :cart_items, dependent: :destroy
  has_one :order
end
