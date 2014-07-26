class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  validates :image,
    presence: true

  scope :order_desc, -> { order('created_at DESC') }

  class << self
    def param_keys
      %w(image title)
    end

    def per_page
      50
    end
  end
end
