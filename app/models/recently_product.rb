class RecentlyProduct < ApplicationRecord
  acts_as_paranoid

  belongs_to :product
  validates :user_id, uniqueness: { scope: :product_id }

end
