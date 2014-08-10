class Category < ActiveRecord::Base
  has_ancestry
  acts_as_list scope: [:ancestry]

  has_many :categorizations,
    dependent: :destroy

  has_many :products,
    through: :categorizations

  validates :name,
    presence: true

  validates :slug,
    presence: true,
    format: { with: SLUG_PATTERN },
    uniqueness: true

  before_validation :set_slug

  class << self
    def param_keys
      %w(name slug parent_id)
    end
  end

  def to_param
    slug
  end

  def set_slug
    self.slug = slug.parameterize
  end
end
