class Public::PublicOrdersController < ApplicationController
  

  def confirm
    @deliverie = Deliverie.find(params[:public_id])

  end

  def result
  end

  def new
    @deliverie = Deliverie.find(params[:public_id])
    @products = cart_item.products
    @total_price = 0
    @products.each do |product|
      @total_price += product.pre_tax_price
    end
    @payment = @total_price + @delivery_charge
  end

  def create
  end

  private

  def 
  end

end

