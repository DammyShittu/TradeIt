module CategoriesHelper
  def category_img(category)
    category.icon.present? ? category.icon : 'https://source.unsplash.com/random'
  end
end
