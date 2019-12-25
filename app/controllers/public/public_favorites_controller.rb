class Public::PublicFavoritesController < ApplicationController
  def create
    @product = Product.find(params[:public_product_id])
    @favorite = current_public.favorites.new(product_id:@product.id)
    @favorite.save
    redirect_to public_public_product_path(@product)
  end

  def destroy
    @product = Product.find(params[:public_product_id])
    @favorite = current_public.favorites.find_by(product_id: @product.id)
    @favorite.destroy
    redirect_to public_public_product_path(@product)
  end
end
