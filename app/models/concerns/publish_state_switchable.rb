module PublishStateSwitchable
  extend ActiveSupport::Concern

  included do
    scope :published, lambda {
      where("#{ self.name.underscore.pluralize }.published_at IS NOT NULL")
    }

    scope :not_published, lambda {
      where("#{ self.name.underscore.pluralize }.published_at IS NULL")
    }
  end

  def publish_flag
    !!self.published_at
  end

  def publish_flag=(val)
    to_publish = [1, "1", "t", true, "true"].include?(val) ? true : false
    if to_publish && published_at.nil?
      self.published_at = Time.now
    elsif !to_publish
      self.published_at = nil
    end
  end

  def published?
    !!self.published_at
  end

  def publish!
    self.publish_flag = true
    save!
  end

  def unpublish!
    self.publish_flag = false
    save!
  end
end
