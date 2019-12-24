class Admin::AdminOrdersController < ApplicationController
  before_action :authenticate_admin!


  PER = 10 
  

  def index
    @orders = Order.page(params[:page]).per(PER)
    unless params[:search].blank?
      u_first = Order.joins(:public).where("end_user_first_name LIKE ?", "%#{params[:search]}%")
      u_last = Order.joins(:public).where("end_user_last_name LIKE ?", "%#{params[:search]}%")
      a_name = Order.where("address_name LIKE ?", "%#{params[:search]}%")
      a = ( u_first | u_last )
      b = ( a | a_name )
      @orders = Kaminari.paginate_array(b).page(params[:page]).per(PER)
    else
      # 削除されたレコードも検索対象に含める
      @orders = Order.with_deleted.page(params[:page]).per(PER)
    end
  end

  def show
    # 削除されたレコードの情報も見れる
    @order = Order.with_deleted.find(params[:id])
    @order_detail = OrderDetail.where(order_id: params[:id])
    # @sub_total = OrderDetail.where(order_id: params[:id]).sum(:pre_tax_price)
  end

  def update
    @order = Order.with_deleted.find(params[:id])
    @order.delivery_status = params[:order][:delivery_status]
    @order.save
    flash[:delivery_status] = "配送ステータスを変更しました。"
    redirect_to admin_admin_order_path(@order.id)
  end

  private


end