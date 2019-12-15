class Public::PublicProductsController < ApplicationController
  

  def index
    @new_products =
    @popular_products =
    @products =
  end

  def show
    @product = Product.find(params[:id])
  end


end