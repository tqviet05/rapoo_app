class Banner < ApplicationRecord
  mount_uploader :image, BannerUploader
  validates :image, presence: true
end
