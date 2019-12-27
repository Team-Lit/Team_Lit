class Admin::AdminArrivalsController < ApplicationController
  before_action :authenticate_admin!
  

  PER = 10

  def index
    unless params[:search].blank?
      title = Arrival.joins(:product).where("product_name LIKE ?", "%#{params[:search]}%")
      a = title
      @arrivals = Kaminari.paginate_array(a).page(params[:page]).per(PER)
    else
      @arrivals = Arrival.page(params[:page]).per(PER).reverse_order
    end
  end

  def new
    @arrival = Arrival.new 
  end

  def create
    @arrival = Arrival.new(arrival_params)
    if @arrival.save
      redirect_to admin_admin_arrivals_path, notice: "商品を追加しました。"
    else
      flash.now[:arrival] = "商品の追加に失敗しました。商品名を選択してください。"
      render "new"
    end
  end

  private

  def arrival_params
    params.require(:arrival).permit(:product_id, :arrival_quantity, :arrival_date)
  end

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end


end 