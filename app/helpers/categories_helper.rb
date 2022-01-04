module CategoriesHelper
  def category_img(category)
    category.icon.attached? ? category.icon : 'https://source.unsplash.com/random'
  end
end
