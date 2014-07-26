module DataHelper
  def timestamp_table(resource)
    content_tag(:table, class: 'table') do
      content_tag(:tr) do
        content_tag(:th, '作成') +
        content_tag(:td, l(resource.created_at))
      end +
      content_tag(:tr) do
        content_tag(:th, '更新') +
        content_tag(:td, l(resource.updated_at))
      end
    end
  end

  def publish_state_label(resource)
    if resource.published?
      content_tag(:span, '公開', class: 'label label-success')
    else
      content_tag(:san, '下書き', class: 'label label-default')
    end
  end
end
