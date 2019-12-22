class Public::PublicCartItemsController < ApplicationController
  
#カート内一覧
  def show
    @cart_item = CartItem.where(public_id: current_public.id)
  end

#カートに入れる
  def create
    @cart_item = CartItem.new(cart_item_params)
    @product = Product.find(params[:public_product_id])
    @cart_item.product_id = @product.id
    @cart_item.public_id = current_public.id
    @cart_item.save
    redirect_to public_public_user_public_cart_items_path(current_public)
  end

#カートアイテムを削除する
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to  public_public_user_public_cart_items_path(current_public)
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id,:public_id,:quantity)
  end

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end

end