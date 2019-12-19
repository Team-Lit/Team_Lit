class Public::PublicOrdersController < ApplicationController
  

  def confirm
    @deliverie = Deliverie.find(params[:public_id])
    @products = cart_item.products
    @total_price = 0
    @products.each do |product|
      @total_price += product.pre_tax_price
    end
    @payment = @total_price + @delivery_charge + @tax_rate
  end

  def result
    @order_datails = Order_datail.find_by(params[:order_id])
    @order = Order.find(params[:id])
    @all_price = @order.total_price + @order.delivery_charge + @order.tax_rate
  end

  def new
    @order = Order.new
    @deliverie = Deliverie.find(params[:public_id])
    @products = cart_item.products
    @total_price = 0
    @products.each do |product|
      @total_price += product.pre_tax_price
    end
    @payment = @total_price + @delivery_charge
  end

  def create
    @cart_item = CaerItem.where(public_id: current_public.id)
    @order.address = @deliverie.address
    @order.address_name = @deliverie.address_name
    @order.zip = @deliverie.zip
    @order.delivery_charge = @delivery_charge.to_i
    @order.tax_rate = @tax_rate.to_i
    @order.public_id = current_public.id
    @cart_item.each do |product|
      @total_price += product.pre_tax_price
    end
    @order.total_price = @total_price
    if @order.save
      @cart_item.each do |item|
        @order_datail = Order_datail.new
        @order_datail.order_id = @order.id
        @order_datail.product_id = item.product_id
        @order_datail.quantity = item.quantity
        @order_datail.pre_tax_price = item.pre_tax_price
        @order.save
      end
      @cart_item.destroy
  	  redirect_to public_public_products_path
    end
    

    
  end

  private



end

