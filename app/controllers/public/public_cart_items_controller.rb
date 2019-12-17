class Public::PublicCartItemsController < ApplicationController
  
#カート内一覧
  def index
    @cart_items = Caer_item.all
  end

#カートに入れる
  def create
    @cart_item = Cartitem.new
    @cart_item.public_id = current_public.id
    @cart_item.product_id = Product.find(params[:id])
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to public_public_cart_items_path
  end

#カートアイテムを削除する
  def destroy
    @cart_item = Cartitem.find(params[:id])
    @cart_item.destroy
    redirect_to  public_public_cart_items_path
  end
  


end