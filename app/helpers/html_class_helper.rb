module HtmlClassHelper
  def active_class(target_path, options = {})
    pattern_str = options[:lefthand_match] ? "^#{ target_path }" : "^#{ target_path }$"
    request.path.match(Regexp.new(pattern_str)) ? ' active ' : nil
  end
end
