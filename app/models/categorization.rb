class Categorization < ActiveRecord::Base
  belongs_to :category

  belongs_to :categorizable,
    polymorphic: true

  belongs_to :product,
    -> { where(categorizable_type: 'Product') }

  validates :category_id,
    uniqueness: {
      scope: [:categorizable_type, :categorizable_id],
      message: '同じカテゴリーを同時に選択できません'
    }
end
