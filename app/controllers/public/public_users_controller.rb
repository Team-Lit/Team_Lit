class Public::PublicUsersController < ApplicationController
  before_action :authenticate_public!
  

  def confirm
    @public = Public.find(current_public.id)
  end
 
  def show
    @public = Public.find(params[:id])
    @order = Order.where(public_id: current_public)
  end

  def edit
  	@public = Public.find(params[:id])
  end

  def update
    @public = Public.find(params[:id])
    if @public.update(public_params)
      @delivery = Delivery.where(public_id: @public.id).first
      @delivery.zip = @public.zip
      @delivery.address = @public.address
      @delivery.address_name = @public.end_user_last_name + @public.end_user_first_name
      @delivery.save
      redirect_to public_public_user_path(@public), notice: "プロフィールを更新しました。"
    else
      flash.now[:public] = "ユーザー情報の更新に失敗しました。全ての項目を埋めてください。"
      render action: :edit
    end
  end



  def destroy
    @public = Public.find(params[:id])
    @public.destroy
    redirect_to new_public_registration_path, notice: "退会しました。ご利用ありがとうございました。"
  end

  private

   def public_params
    params.require(:public).permit(:end_user_last_name,:end_user_first_name,:end_user_last_kana,:end_user_first_kana, :zip, :address,:end_user_phone, :email)
   end

  
end