class Product < ActiveRecord::Base
  include PublishStateSwitchable

  has_many :articles,
    dependent: true

  validates :name,
    presence: true

  validates :slug,
    presence: true,
    format: { with: SLUG_PATTERN },
    uniqueness: true

  before_validation :set_slug

  class << self
    def per_page
      50
    end

    def param_keys
      %w(name slug description publish_flag)
    end
  end

  def to_param
    slug
  end

  def set_slug
    self.slug = slug.parameterize
  end
end
