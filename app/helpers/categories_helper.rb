module CategoriesHelper
  def select_category
    Category.all.map do |category|
      [category.nazwa, category.id]
    end
  end
end
