# frozen_string_literal: true

module Deliveries
  class CreateForm 
    include ActiveModel::Model

    attr_accessor :name, :phone, :address
    validates :name, :phone, :address, presence: true
  end
end
