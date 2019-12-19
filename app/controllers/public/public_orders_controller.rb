class Public::PublicOrdersController < ApplicationController
  

  def confirm
    @order = Order.new
    @deliverie = Deliverie.find(params[:id])
    @cart_items = CartItem.where(public_id: current_public.id)
    @cart_items.each do |cart|
      @products = Product.find(cart.product_id)
    end
    @total_price = 0
    @cart_items.each do |cart|
      @product = Product.find(cart.product_id)
      @total_price += @product.pre_tax_price * cart.quantity
    end
    @payment = @total_price * 1.1 + 500
    binding.pry
  end

  def result
    @order_datails = Order_datail.find_by(params[:order_id])
    @order = Order.find(params[:id])
    @all_price = @order.total_price + @order.delivery_charge + @order.tax_rate
  end

  def index
    @deliverie = Deliverie.find(params[:id])
    @cart_items = CartItem.where(public_id: current_public.id)
    @total_price = 0
    @payment = @total_price + 500
  end

  def create
    @order = Order.new(order_params)
    @cart_items = CaerItem.where(public_id: current_public.id)
    @cart_items.each do |cart|
      @product = Product.find(cart.product_id)
      @total_price += @product.pre_tax_price * cart.quantity
    end
    @order.address = @deliverie.address
    @order.address_name = @deliverie.address_name
    @order.zip = @deliverie.zip
    @order.delivery_charge = @delivery_charge
    @order.tax_rate = @tax_rate
    @order.public_id = current_public.id
    @order.total_price = @total_price
    if @order.save
      @cart_item.each do |item|
        @order_datail = Order_datail.new
        @order_datail.order_id = @order.id
        @order_datail.product_id = item.product_id
        @order_datail.quantity = item.quantity
        @order_datail.pre_tax_price = item.pre_tax_price
        @order_datail.save
        @cart_item.destroy
      end
  	  redirect_to public_public_products_path
    end
    

    
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:product_id,:public_id,:quantity)
  end

  def deliverie_params
    params.require(:deliverie).permit(:id,:address,:address_name,:zip)
  end

   def order_params
     params.require(:order).permit(:public_id,:tax_rate,:delivery_charge,:total_price,:delivery_status,:payment_method,:address,:address_name,:zip,:deleted_at)
   end
end

