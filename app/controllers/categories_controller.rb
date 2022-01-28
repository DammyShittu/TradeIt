class CategoriesController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = current_user.categories.order(:created_at)
  end

  def show
    @category = Category.includes(:exchanges).find(params[:id])
    @exchanges = @category.recent_exchanges
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)

    respond_to do |format|
      format.html do
        if @category.save
          redirect_to authenticated_root_path, notice: 'Category has been successfully created'
        else
          render new_category_path, alert: 'Category not created. Please, try again!'
        end
      end
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
