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

  def self.arrange_as_array(options = {}, hash = nil)
    hash ||= arrange(options)

    arr = []
    hash.each do |node, children|
      arr << node
      arr += arrange_as_array(options, children) unless children.nil?
    end
    arr
  end

  def name_for_select
    "#{ 'ー' * depth } #{ name }"
  end
end
