class Public::PublicDeliveriesController < ApplicationController
  

  def index
    @deliverie = Deliverie.find_by(params[:public_id])
  end

  def edit
    @deliverie = Deliverie.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    @adress = Deliveries.find(params[:id])
    def deliverie_params
      params.require(:deliverie).permit(:address,:address_name,:zip)
    end

end