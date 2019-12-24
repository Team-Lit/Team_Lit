class Public::PublicProductsController < ApplicationController
  
  PER = 10

  def index
    unless params[:search].blank?
      artist = Product.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      song =  Product.joins(disks: :songs).where("song_title LIKE ?", "%#{params[:search]}%")
      product_name = Product.where("product_name LIKE ?", "%#{params[:search]}%")
      merged_result = artist | product_name
      @products = (merged_result | song)
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(PER)
      @new_products = Product.all.order(created_at: "DESC").limit(10)
    else
      @products = Product.page(params[:page]).per(PER).reverse_order
      @new_products = Product.all.order(created_at: "DESC").limit(10)
      # @popular_products = Product.where(id: OrderDetail.all.order(quantity: "DESC").limit(3))
    end
  end

  def show
    @cart_item = CartItem.new
    @product = Product.find(params[:id])
    @cart_item.product_id = @product.id
    @stock = @product.arrivals.sum(:arrival_quantity) - @product.order_details.sum(:quantity)
  end

  private

  def product_params
    params.require(:product).permit(:artist_id, :label_id, :genre_id, :product_name, :jacket_image, :pre_tax_price, :stock_quantity, :release_date, :stock_status, disks_attributes: [:id, :disk_numbre, :_destroy, songs_attributes: [:id, :song_title, :song_order, :_destroy]])
  end

  def cart_item_params
    params.require(:cart_item).permit(:product_id,:public_id,:quantity)
  end
end