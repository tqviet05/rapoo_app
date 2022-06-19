class User < ApplicationRecord
  acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :cart, dependent: :destroy
  has_many :deliveries, dependent: :destroy
  has_many :orders
  has_many :recently_products
  has_many :deliveries

  def human_gender
    if gender.blank?
      return "No value"
    else
    gender == true ? "male" : "female"
    end
  end
end
