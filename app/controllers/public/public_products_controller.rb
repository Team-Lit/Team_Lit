class Public::PublicProductsController < ApplicationController
  

  def index
    @new_products = Product.find(6)
    @popular_products = Product.find(3)
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end


end