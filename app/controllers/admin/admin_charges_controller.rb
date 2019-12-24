class Admin::AdminChargesController < ApplicationController
  before_action :authenticate_admin!
  

  def edit
    @charge = Charge.find(1)
  end

  def update
    @charge = Charge.find(1)
    if @charge.update(charge_params)
      redirect_to admin_admin_products_path, notice: "店舗設定を変更しました。"
    else
      flash.now[:charge] = "店舗設定の更新に失敗しました。全ての項目を入力してください。"
      render "edit"
    end
  end

  def charge_params
    params.require(:charge).permit(:charge,:tax_rate)
  end

end