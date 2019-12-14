class Public::PublicUsersController < ApplicationController
  

  def confirm
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


end