class Product < ActiveRecord::Base
  include PublishStateSwitchable

  validates :name,
    presence: true

  validates :slug,
    presence: true
end
