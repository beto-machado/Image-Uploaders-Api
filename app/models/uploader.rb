class Uploader < ApplicationRecord
  include Rails.application.routes.url_helpers

  attribute :image_url, :string

  validates :image, presence: true
  validates :slug, uniqueness: true

  has_one_attached :image

  before_create do
    self.slug = SecureRandom.uuid[0..5]
  end

  after_initialize do |user|
    self.image_url = rails_blob_path(self.image)
  end
end
