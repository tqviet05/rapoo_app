# frozen_string_literal: true
class Admin::Categories::BaseForm
  include ActiveModel::Model

  attr_accessor :name, :position
  validates :name, :position, presence: true

end
