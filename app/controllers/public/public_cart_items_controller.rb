class Public::PublicCartItemsController < ApplicationController
  

  def index
    @cart_items = Caer_item.all
  end

  def create
    @cart_itme = Cart_item.new
    @cart_item.public_id = current_public.id
    
  end

  def update
  end

  def destroy
  end


end