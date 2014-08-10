class Category < ActiveRecord::Base
  has_ancestry
  acts_as_list scope: [:ancestry]

  has_many :categorizations,
    dependent: :destroy

  has_many :products,
    through: :categorizations
end
