class Public::PublicOrdersController < ApplicationController
  

  def confirm

  end

  def result
  end

  def new
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
    @address = 

  def 
  end

end

