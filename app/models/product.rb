class Product < ApplicationRecord
  acts_as_paranoid
  belongs_to :category
  has_many :recently_products
  has_many :product_attachments
  accepts_nested_attributes_for :product_attachments
#   has_many :cart, through: :cart_items
end
