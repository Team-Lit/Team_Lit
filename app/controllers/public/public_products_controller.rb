class Public::PublicProductsController < ApplicationController
  

  def index

    # @new_products = Product.where(created_at: )
    # @popular_products = Product.find(3)
    @products = Product.all
   
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

end