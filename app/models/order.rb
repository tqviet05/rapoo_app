class Order < ApplicationRecord
  acts_as_paranoid
  has_many :order_items, dependent: :destroy
end
