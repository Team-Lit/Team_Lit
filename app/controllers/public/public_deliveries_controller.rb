class Public::PublicDeliveriesController < ApplicationController
  

  def show
    @deliveries = Deliverie.where(public_id: current_public.id)
    @deliverie = Deliverie.new
  end

  def edit
    @deliverie = Deliverie.find(params[:id])
  end

  def update
    @deliverie = Deliverie.find(params[:id])
    if @deliverie.update(deliverie_params)
      redirect_to public_public_deliveries_path
      flash[:notice] = "Book was successfully updated."
    else
      render action: :edit
    end
  end

  def create
  	@deliveries = Deliverie.where(public_id: current_public.id)
  	@deliverie = Deliverie.new
  	@deliverie.public_id = current_public.id
  	if @deliverie.save
      redirect_to public_public_deliveries_path
      flash[:notice] = "Book was successfully Create."
  	else
  	  render action: :index
  	end 
  end

  def destroy
    @deliverie = deliverie.find(params[:id])
  	@deliverie.destroy
  	redirect_to public_public_deliveries_path
  end

  private
    
    def deliverie_params
      params.require(:deliverie).permit(:address,:address_name,:zip)
    end

end