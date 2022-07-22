class OrderItem < ApplicationRecord
  acts_as_paranoid
  belongs_to :order
  belongs_to :product
  # validates :order_id, :product_id, presence: true
  # validates :order_id, uniqueness: { scope: :product_id }
  # def uniqueness?
  #   errors.add(:order_id, :exists) if OrderItem.exists?(order_id: order_id, product_id: product_id)
  # end
end
