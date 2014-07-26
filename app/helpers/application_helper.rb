module ApplicationHelper
  def space(length = 1)
    ('&nbsp;' * length).html_safe
  end

  def button(text, path = '#', type = 'default', &block)
    attr = { class: "btn btn-#{ type }" }
    if block_given?
      link_to(text, attr, &block)
    else
      link_to(text, path, attr)
    end
  end
end
