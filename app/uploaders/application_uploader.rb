require 'carrierwave/processing/mime_types'
require 'carrierwave/processing/mini_magick'

class ApplicationUploader < CarrierWave::Uploader::Base
  include CarrierWave::MimeTypes
  include CarrierWave::MiniMagick
  include Sprockets::Rails::Helper

  storage Rails.env.test? || Rails.env.development? ? :file : :fog

  MAX_THUMBNAIL_LENGTH = 300

  def store_dir
    "uploads/#{ model.class.to_s.underscore }/#{ mounted_as }/#{ model.id }"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  def resize_to_thumbnail
    manipulate! do |img|
      short, long, crop_x, crop_y = measure_for_thumbnail(img)
      if short > MAX_THUMBNAIL_LENGTH
        short, w, h, crop_x, crop_y = measure_for_resize_thumbnail(short, long, img)
        img.resize "#{ w }x#{ h }"
      end
      img.crop "#{ short }x#{ short }+#{ crop_x }+#{ crop_y }"
      img
    end
  end

  private
    def measure_for_thumbnail(img)
      result = nil
      crop_x = nil
      crop_y = nil
      if img[:width] > img[:height]
        result = [img[:height], img[:width]]
        result << (img[:width] - img[:height]) / 2
        result << 0
      else
        result = [img[:width], img[:height]]
        result << 0
        result << (img[:height] - img[:width]) / 2
      end
      result
    end

    def measure_for_resize_thumbnail(short, long, img)
      per = MAX_THUMBNAIL_LENGTH / short.to_f
      short = MAX_THUMBNAIL_LENGTH
      long = (long * per).floor
      w = nil
      h = nil
      crop_x = nil
      crop_y = nil
      if img[:width] > img[:height]
        w = long
        h = short
        crop_x = (long - short) / 2
        crop_y = 0
      else
        w = short
        h = long
        crop_x = 0
        crop_y = (long - short) / 2
      end
      [short, w, h, crop_x, crop_y]
    end
end
