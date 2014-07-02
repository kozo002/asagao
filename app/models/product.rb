class Product < ActiveRecord::Base
  include PublishStateSwitchable

  validates :name,
    presence: true

  validates :slug,
    presence: true

  class << self
    def per_page
      50
    end

    def param_keys
      %w(name slug description publish_flag)
    end
  end

  def to_param
    slug.parameterize
  end
end
