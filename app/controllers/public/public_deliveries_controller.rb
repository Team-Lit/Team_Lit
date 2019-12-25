class Public::PublicDeliveriesController < ApplicationController
  before_action :authenticate_public!
  

  def show
    @cart_item = CartItem.where(public_id: current_public.id)
    if @cart_item.empty?
      render template: "public/public_cart_items/show"
    else
      @deliveries = Delivery.where(public_id: current_public.id)
      @delivery = Delivery.new
      @order = Order.new
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to public_public_user_public_deliveries_path(current_public)
      flash[:notice] = "Book was successfully updated."
    else
      render action: :edit
    end
  end

  def create
  	@deliveries = Delivery.where(public_id: current_public.id)
    @delivery = Delivery.new(delivery_params)
  	@delivery.public_id = current_public.id
  	if @delivery.save
      redirect_to public_public_user_public_deliveries_path(current_public)
      flash[:notice] = "Book was successfully Create."
  	else
  	  render action: :show
  	end 
  end

  def destroy
    @delivery = Delivery.find(params[:id])
  	@delivery.destroy
  	redirect_to public_public_user_public_deliveries_path(current_public)
  end

  private
    
    def delivery_params
      params.require(:delivery).permit(:address,:address_name,:zip)
    end

end