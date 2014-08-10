class Categorization < ActiveRecord::Base
  belongs_to :category

  belongs_to :categorizable,
    polymorphic: true

  belongs_to :product,
    -> { where(categorizable_type: 'Product') }
end
