class CartItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :product 
  # belongs_to :cart
  validates :quantity, presence: true
  validate :item_count_within_limit, on: [ :create, :update]

  def item_count_within_limit
    if quantity >= 50
      errors.add(:base, "Exceeded thing limit")
    end
  end

end
