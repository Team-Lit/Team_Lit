class Admin::AdminUsersController < ApplicationController
  before_action :authenticate_admin! 

  PER = 10
  
  
  def index
    unless params[:search].blank?
      u_first = Public.where("end_user_first_name LIKE ?", "%#{params[:search]}%")
      u_last = Public.where("end_user_last_name LIKE ?", "%#{params[:search]}%")
      k_first = Public.where("end_user_first_kana LIKE ?", "%#{params[:search]}%")
      k_last = Public.where("end_user_last_kana LIKE ?", "%#{params[:search]}%")
      a = u_first | u_last
      b = ( a | k_first)
      c = ( b | k_last )
      @users = Kaminari.paginate_array(c).page(params[:page]).per(PER)
    else
      @users = Public.page(params[:page]).per(PER).reverse_order
    end
  end

  def show
    @user = Public.find(params[:id])
    @address = Delivery.all
    @orders = @user.orders.reverse_order
  end

  def edit
    @user = Public.find(params[:id])
  end

  def update
    @user = Public.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_admin_user_path(@user.id)
    end
  end

  def destroy
    @user = Public.find(params[:id])
    @user.delete
    redirect_to admin_admin_users_path
  end

  private

  def user_params
    params.require(:public).permit(:end_user_last_name, :end_user_first_name, :end_user_last_kana, :end_user_first_kana, :zip, :address, :end_user_phone, :email)
  end


end