class Admin::CategoriesController < ApplicationController
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD'], only: [:admin, :new, :edit, :destroy]
  
  def index
    @categories = Category.order(id: :desc).all
  end

  # def new
  #   @categories = Category.new
  # end

  # def create
  #   @category = Category.new(category_params)

  #   if @category.save
  #     redirect_to [:admin, :categories], notice: 'Category created!'
  #   else
  #     render :new
  #   end
  # end


  # private

  # def product_params
  #   params.require(:product).permit(
  #     :name,
  #     :description,
  #     :category_id,
  #     :quantity,
  #     :image,
  #     :price
  #   )
  # end
end
