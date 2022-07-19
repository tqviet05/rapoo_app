# frozen_string_literal: true

module OrderItems
  class CreateForm
    include ActiveModel::Model

    attr_accessor :order_id
    attr_accessor :product_id
    validates :order_id, :product_id, presence: true
    validates :order_id, uniqueness: { scope: :product_id }
    end
  end
end
