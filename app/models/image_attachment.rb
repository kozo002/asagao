class ImageAttachment < ActiveRecord::Base
  acts_as_list scope: [:attachable_type, :attachable_id]

  belongs_to :attachable,
    polymorphic: true

  belongs_to :image
end
