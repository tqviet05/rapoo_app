# frozen_string_literal: true

module CartItems
  class UpdateForm 
    include ActiveModel::Model

    attr_accessor :quantity
    validates :quantity, presence: true
    validate :item_count_within_limit
  
    def item_count_within_limit
      if quantity.to_i >= 50 || quantity.to_i < 1
        errors.add(:cart, "Exceeded thing limit")
      end
    end
  end
end
