class ImageUploader < ApplicationUploader
  version :thumb do
    process :resize_to_thumbnail
  end
end
