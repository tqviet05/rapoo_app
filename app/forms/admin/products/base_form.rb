# frozen_string_literal: true
class Admin::Products::BaseForm
  include ActiveModel::Model

  attr_accessor :name, :category_id, :price, :image, :product_attachments_attributes, :description

  validates :name, :category_id, :price, :image, presence: true
  # validate :product_attachments?

  def product_attachments?
    product_attachment = product_attachments_attributes.detect do |attachment|
      attachment[:image].blank?
    end
    add.errors(product_attachments: :blank) if product_attachment.present?
  end

end
