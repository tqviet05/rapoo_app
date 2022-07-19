# frozen_string_literal: true

module CartItems
  class CreateForm
    include ActiveModel::Model

    attr_accessor :quantity
    validates :quantity, presence: true
    validate :item_count_within_limit
  
    def item_count_within_limit
      if quantity >= 50 || quantity <1
        errors.add(:cart, "Exceeded thing limit")
      end
    end
  end
end
