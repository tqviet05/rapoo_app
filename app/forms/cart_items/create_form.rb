# frozen_string_literal: true

module CartItems
  class CreateForm
    include ActiveModel::Model

    attr_accessor :cart_id
    attr_accessor :quantity
    validates :quantity, presence: true
    validate :check_limit_cart_items

    def check_limit_cart_items
      if CartItem.where(cart_id: cart_id).count >= 20
        errors.add(:cart, 'Exceeded the limit cart items')
      end
    end
  end
end