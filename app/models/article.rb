class Article < ActiveRecord::Base
  include PublishStateSwitchable

  belongs_to :product

  validates :slug,
    presence: true,
    format: { with: SLUG_PATTERN },
    uniqueness: true

  validates :title,
    presence: true

  validates :product_id,
    presence: true

  scope :order_desc, -> { order('created_at DESC') }

  class << self
    def per_page
      50
    end

    def param_keys
      %w(slug title content publish_flag)
    end
  end

  def to_param
    slug
  end
end
