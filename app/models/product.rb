class Product < ApplicationRecord
  acts_as_paranoid
  mount_uploader :image, ProductUploader

  belongs_to :category

  has_many :recently_products
  has_many :product_attachments

  accepts_nested_attributes_for :product_attachments
  validates_associated :product_attachments

  validates :name, :category_id, :price, :image, presence: true
end

