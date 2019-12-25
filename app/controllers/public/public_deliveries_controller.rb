class Public::PublicDeliveriesController < ApplicationController
  before_action :authenticate_public!
  

  def show
    @deliveries = Delivery.where(public_id: current_public.id)
    @delivery = Delivery.new
    @order = Order.new
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      redirect_to public_public_user_public_deliveries_path(current_public), notice: "宛先を更新しました。"
    else
      flash.now[:delivery] = "宛先の更新に失敗しました。全ての項目を入力してください。"
      render "edit"
    end
  end

  def create
  	@deliveries = Delivery.where(public_id: current_public.id)
    @delivery = Delivery.new(delivery_params)
  	@delivery.public_id = current_public.id
  	if @delivery.save
      redirect_to public_public_user_public_deliveries_path(current_public), notice: "宛先を追加しました。"
    else
      flash.now[:delivery] = "宛先の追加に失敗しました。全ての項目を入力してください。"
  	  render "show"
  	end 
  end

  def destroy
    @delivery = Delivery.find(params[:id])
  	@delivery.destroy
  	redirect_to public_public_user_public_deliveries_path(current_public), notice: "宛先を削除しました。"
  end

  private
    
    def delivery_params
      params.require(:delivery).permit(:address,:address_name,:zip)
    end

end