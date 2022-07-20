# frozen_string_literal: true
module Admin
  class Banners::CreateForm
    include ActiveModel::Model

    attr_accessor :image
    validates :image, presence: true
  end
end
