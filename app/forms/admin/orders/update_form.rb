# frozen_string_literal: true

module Admin
  class Orders::UpdateForm
    include ActiveModel::Model

    attr_accessor :name, :phone, :address

    validates :name, :phone, :address, presence: true

  end
end
