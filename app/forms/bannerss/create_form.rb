# frozen_string_literal: true

module Bannerss
  class CreateForm
    include ActiveModel::Model

    attr_accessor :image
    validates :image, presence: true
  end
end
