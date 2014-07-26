class ImageAttachment < ActiveRecord::Base
  belongs_to :attachable,
    polymorphic: true

  belongs_to :image
end
