class Order < ApplicationRecord
  acts_as_paranoid
  has_many :order_items, dependent: :destroy

  belongs_to :user

  validates :name, :phone, :address, presence: true


end
