class Public::PublicProductsController < ApplicationController
  

  def index

    # @new_products = Product.where(created_at: )
    # @popular_products = Product.find(3)
    @products = Product.all
   
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def edit
  end
  
  private

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id,:public_id,:quantity)
  end
end