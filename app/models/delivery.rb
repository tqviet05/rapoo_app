class Delivery < ApplicationRecord
  acts_as_paranoid
  belongs_to :user
  validates :name, :phone, :address, presence: true

end
