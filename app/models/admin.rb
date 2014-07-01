class Admin < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,
    presence: true

  before_validation :set_name

  def set_name
    return if name.present?
    self.name = email.sub(/@.+$/, '')
  end
end
