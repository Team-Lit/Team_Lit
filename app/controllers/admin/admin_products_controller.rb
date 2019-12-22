class Admin::AdminProductsController < ApplicationController
  before_action :authenticate_admin!

  PER = 10


  def index
    unless params[:search].blank?
      artist = Product.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      song =  Product.joins(disks: :songs).where("song_title LIKE ?", "%#{params[:search]}%")
      product_name = Product.where("product_name LIKE ?", "%#{params[:search]}%")
      merged_result = artist | product_name
      @products = (merged_result | song)
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(PER)
    else
      @products = Product.page(params[:page]).per(PER).reverse_order
    end
  end

  def show
    @product = Product.find(params[:id])
    @disks = Disk.where(product_id: @product.id)
    @stock = @product.arrivals.sum(:arrival_quantity) - @product.order_details.sum(:quantity)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @disk = @product.disks.build
    @song = @disk.songs.build
  end
 
  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to admin_admin_products_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_admin_product_path(@product.id)
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to admin_admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end

  def arrival_params
    params.require(:arrival).permit(:arrival_quantity, :arrival_date)
  end


end