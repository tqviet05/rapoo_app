# frozen_string_literal: true
class Admin::Products::BaseForm
  include ActiveModel::Model

  attr_accessor :name, :category_id, :price, :image, :product_attachments_attributes, :description

  validates :name, :category_id, :price, :image, presence: true

end
