module FlashMessageHelper
  def flash_messages
    if notice
      content_tag(:div, notice, class: 'alert alert-success')
    elsif alert
      content_tag(:div, alert, class: 'alert alert-danger')
    end
  end
end
