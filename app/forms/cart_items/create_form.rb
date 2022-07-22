# frozen_string_literal: true

module CartItems
  class CreateForm
    include ActiveModel::Model

    attr_accessor :cart
    attr_accessor :quantity
    validates :quantity, presence: true
    validate :check_limit_cart_items

    def check_limit_cart_items
      if CartItem.where(cart_id: cart).count >= 20
        errors.add(:cart, :invalid)
      end
    end
  end
end
