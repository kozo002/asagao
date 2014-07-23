module FormHelper
  def form_error_messages(resource)
    if resource.errors.any?
      content_tag(:div, { class: 'panel panel-danger' }) do
        content_tag(:div, 'Error', { class: 'panel-heading' }) +
        content_tag(:div, { class: 'panel-body' }) do
          content_tag(:ul) do
            resource.errors.full_messages.map { |message|
              content_tag(:li, message)
            }.join.html_safe
          end
        end
      end.html_safe
    end
  end

  def form_submit_button(builder, resource)
    text = (resource.persisted? ? '更新' : '登録')
    options = { class: 'btn btn-primary', data: { disabled_with: '送信中...' } }
    builder.submit(text, options)
  end

  def form_submit_buttons(builder, resource)
    builder.submit('公開', class: 'btn btn-primary') +
    '&nbsp;'.html_safe +
    builder.submit('下書き保存', class: 'btn btn-default') +
    '&nbsp;&nbsp;'.html_safe +
    if resource.persisted?
      if resource.published?
        content_tag(:span, '公開', class: 'label label-success')
      else
        content_tag(:span, '下書き', class: 'label label-default')
      end
    else
      content_tag(:span, '未保存', class: 'label label-default')
    end
  end

  def form_text_area(builder, attr_name, options = {})
    options = { class: 'form-control autosize', rows: 5 }.merge(options)
    builder.text_area(attr_name, options)
  end

  def form_text_field(builder, attr_name, options = {})
    options = { class: 'form-control' }.merge(options)
    builder.text_field(attr_name, options)
  end

  def form_image_panel(builder, resource, attr_name, versions = [])
    if resource.send("#{ attr_name }?")
      image_option = { class: 'img-responsive' }
      original_image = image_tag(resource.send("#{ attr_name }_url"), image_option)
      version_images = versions.map { |ver|
        image_tag(resource.send("#{ attr_name }_url", ver), image_option)
      }.join.html_safe

      content_tag(:div, { class: 'panel panel-default' }) do
        content_tag(:div, original_image + version_images, { class: 'panel-body' }) +
        content_tag(:div, { class: 'panel-footer' }) do
          builder.label("remove_#{ attr_name }") do
            builder.check_box("remove_#{ attr_name }") +
            " #{ resource.class.human_attribute_name(attr_name) }を削除"
          end
        end
      end.html_safe
    end
  end

  def danger_zone_panel(&block)
    content_tag(:div, { class: 'panel panel-danger' }) do
      content_tag(:div, 'Danger Zone', { class: 'panel-heading' }) +
      content_tag(:div, capture(&block), { class: 'panel-body' })
    end.html_safe
  end

  def delete_button(text, path, confirm_message = '本当に削除してよろしいですか?')
    link_to(text, path, { class: 'btn btn-danger', data: { method: :delete, confirm: confirm_message } })
  end

  def admin_search_form(url, q)
    result = content_tag(:form, { class: 'form-inline', action: url, method: :get }) do
      content_tag(:div, { class: 'form-group' }) do
        text_field_tag(:q, q, { class: 'form-control' }) +
        content_tag(:input, '', { class: 'btn btn-default', type: 'submit', value: '検索' })
      end
    end
    if q.present?
      result << content_tag(:a, '&times;検索を解除'.html_safe, { class: 'btn btn-default', href: url })
    end
    result
  end
end
