class Product < ActiveRecord::Base
  include PublishStateSwitchable

  has_many :articles,
    dependent: :destroy

  has_many :attachments,
    class_name: 'ImageAttachment',
    as: :attachable,
    dependent: :destroy

  has_many :images,
    -> { order('image_attachments.position ASC') },
    through: :attachments

  validates :name,
    presence: true

  validates :slug,
    presence: true,
    format: { with: SLUG_PATTERN },
    uniqueness: true

  before_validation :set_slug

  scope :order_desc, -> { order('created_at DESC') }

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
