class Public::PublicCartItemsController < ApplicationController
  
#カート内一覧
  def show
    @cart_item = CartItem.where(public_id: current_public.id)
  end

#カートに入れる
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart = Product.find(params[:product_id])
    @cart_item.product_id = @cart.id
    @cart_item.public_id = current_public.id
    @cart_item.save
    redirect_to public_public_cart_items_path
  end

#カートアイテムを削除する
  def destroy
    @cart_item = Cartitem.find(params[:id])
    @cart_item.destroy
    redirect_to  public_public_cart_items_path
  end
  
  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id,:public_id,:quantity)
  end


end