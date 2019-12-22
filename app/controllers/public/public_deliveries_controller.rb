class Public::PublicDeliveriesController < ApplicationController
  before_action :authenticate_public!
  

  def show
    @deliveries = Deliverie.where(public_id: current_public.id)
    @deliverie = Deliverie.new
    @order = Order.new
  end

  def edit
    @deliverie = Deliverie.find(params[:id])
  end

  def update
    @deliverie = Deliverie.find(params[:id])
    if @deliverie.update(deliverie_params)
      redirect_to public_public_user_public_deliveries_path(current_public)
      flash[:notice] = "Book was successfully updated."
    else
      render action: :edit
    end
  end

  def create
  	@deliveries = Deliverie.where(public_id: current_public.id)
    @deliverie = Deliverie.new(deliverie_params)
  	@deliverie.public_id = current_public.id
  	if @deliverie.save
      redirect_to public_public_user_public_deliveries_path(current_public)
      flash[:notice] = "Book was successfully Create."
  	else
  	  render action: :show
  	end 
  end

  def destroy
    @deliverie = Deliverie.find(params[:id])
  	@deliverie.destroy
  	redirect_to public_public_user_public_deliveries_path(current_public)
  end

  private
    
    def deliverie_params
      params.require(:deliverie).permit(:address,:address_name,:zip)
    end

end