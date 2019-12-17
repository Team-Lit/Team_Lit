class Admin::AdminArrivalsController < ApplicationController
  

  def index
    @arrivals = Arrival.all
  end

  def new
    @arrival = Arrival.new
    @product = Product.find(params[:admin_product_id])
  end

  def create
    product = Product.find(params[:admin_product_id])
    arrival = Arrival.new(arrival_params)
    arrival.product_id = product.id
    arrival.save
    redirect_to admin_admin_product_path(product.id)
  end

  private

  def arrival_params
    params.require(:arrival).permit(:arival_quantity, :arrival_date)
  end


end 