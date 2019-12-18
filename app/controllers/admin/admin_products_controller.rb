class Admin::AdminProductsController < ApplicationController


  def index
    @products = Product.all
    # ransac使用の検索において必要っぽい
    # @q = Product.ransack(params[:q])
    # @products = @q.result(distinct: true)
  end

  def show
    @product = Product.find(params[:id])
    @disks = Disk.where(product_id: @product.id)
  end

  def edit
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
    # else
    #   flash.now[:product] = "保存失敗"
    #   render :new
    # end
  end

  def update
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end


end