class Public::PublicOrdersController < ApplicationController
  

  def confirm
    @order = Order.new(payment_method: params[:payment_method])
    @deliverie = Deliverie.find(params[:id])
    @cart_items = CartItem.where(public_id: current_public.id)
    @total_price = 0
    @cart_items.each do |cart|
      @product = Product.find(cart.product_id)
      @total_price += @product.pre_tax_price * cart.quantity
    end
    @charge = Charge.find(1)
    @payment = @total_price * @charge.tax_rate + @charge.charge
  end

  def index
    @deliverie = Deliverie.find(params[:id])
    @charge = Charge.find(1)
    @cart_items = CartItem.where(public_id: current_public.id)
    @total_price = 0
    @cart_items.each do |cart|
      @product = Product.find(cart.product_id)
      @total_price += @product.pre_tax_price * cart.quantity
    end
    @payment = @total_price + @charge.charge
  end



  def create
    @order = Order.new(order_params)
    @cart_items = CartItem.where(public_id: current_public.id)
    @charge = Charge.find(1)
    @cart_items.each do |cart|
      @product = Product.find(cart.product_id)
      @total_price = @product.pre_tax_price * cart.quantity
    end
    @deliverie = Deliverie.find(params[:id])
    @order.address = @deliverie.address
    @order.address_name = @deliverie.address_name
    @order.zip = @deliverie.zip
    @order.delivery_charge = @charge.charge
    @order.tax_rate = @charge.tax_rate
    @order.public_id = current_public.id
    @order.total_price = @total_price
    if @order.save
      @cart_items.each do |item|
        @order_datail = OrderDetail.new
        @order_datail.order_id = @order.id
        @order_datail.product_id = item.product_id
        @order_datail.quantity = item.quantity
        @order_datail.pre_tax_price = item.product.pre_tax_price
        if @order_datail.save
          item.destroy
        else
          render :confirm
        end
      end

    else
      render :confirm
    end
    redirect_to public_public_user_path(current_public)
  end



  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
    @all_price = @order.total_price * @order.tax_rate + @order.delivery_charge
    binding.pry 
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
def change
  change_column :orders, :payment_method, :integer
end
