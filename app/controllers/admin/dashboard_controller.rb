class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']
  
  def show
    @product_count = Product.count
    @product_categories = Category.count
  end
  
end
