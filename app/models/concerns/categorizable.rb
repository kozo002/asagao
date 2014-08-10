module Categorizable
  extend ActiveSupport::Concern

  included do
    has_many :categorizations,
      as: :categorizable,
      dependent: :destroy

    accepts_nested_attributes_for :categorizations,
      allow_destroy: true

    has_many :categories,
      through: :categorizations
  end
end
