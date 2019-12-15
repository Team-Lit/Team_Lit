class Public::PublicUsersController < ApplicationController
  

  def confirm
  end

  def show
    @user = Public.find(params[:id])
  end

  def edit
    @user = Public.find(params[:id])
  end


  def update
  end



  def destroy
    @user = Public.find(params[:id])
    @user.destroy
    redirect_to new_public_registration_path
  end


end