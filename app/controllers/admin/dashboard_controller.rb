class Admin::DashboardController < ApplicationController
  # protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']
  
  def show
    @product_count = Product.count
    @product_categories = Category.count
  end
  
end
