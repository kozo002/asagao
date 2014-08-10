module CategoriesHelper
  def nested_categories(partial, categories)
    categories.map { |category, sub_categories|
      render(partial, category: category) +
        nested_categories(partial, sub_categories)
    }.join.html_safe
  end
end
