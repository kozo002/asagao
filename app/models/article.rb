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
end
