class Public::PublicUsersController < ApplicationController
  

  def confirm

    @public = Public.find(current_public.id)
  end

  def show
    @public = Public.find(params[:id])

  end

  def edit
  	@public = Public.find(params[:id])
  end

  def update

    @public = Public.find(params[:id])
    if @public.update(public_params)
      @deliverie = Deliverie.where(public_id: @public.id).first
      @deliverie.zip = @public.zip
      @deliverie.address = @public.address
      @deliverie.address_name = @public.end_user_last_name + @public.end_user_first_name
      @deliverie.save
      flash[:notice] = "Book was successfully updated."
      redirect_to public_public_user_path(@public)
    else
      render action: :edit


    end
  end



  def destroy
    public = Public.find(params[:id])
    public.destroy
    redirect_to new_public_registration_path
  end

  private

   def public_params
    params.require(:public).permit(:end_user_last_name,:end_user_first_name,:end_user_last_kana,:end_user_first_kana, :zip, :address,:end_user_phone, :email)
   end

  
end