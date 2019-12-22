class Admin::AdminChargesController < ApplicationController
  

  def edit
    @charge = Charge.find(1)
  end

  def update
    @charge = Charge.find(1)
    if @charge.update(charge_params)
      redirect_to admin_admin_products_path
      flash[:notice] = "updated."
    else
      render action: :edit
    end
  end

  def charge_params
    params.require(:charge).permit(:charge,:tax_rate)
  end

end