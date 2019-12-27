class Public::PublicProductsController < ApplicationController

  PER = 10

  def top
    product_favorite_count = Product.joins(:favorites).group(:product_id).count
    product_favorited_ids = Hash[product_favorite_count.sort_by{ |_, v| -v }].keys
    @product_ranking = Product.where(id: product_favorited_ids).order(id: "DESC").limit(5)
  end

  def index
    @new_products = Product.all.order(created_at: "DESC").limit(5) 
    unless params[:search].blank?
      artist = Product.joins(:artist).where("artist_name LIKE ?", "%#{params[:search]}%")
      song =  Product.joins(disks: :songs).where("song_title LIKE ?", "%#{params[:search]}%")
      product_name = Product.where("product_name LIKE ?", "%#{params[:search]}%")
      merged_result = artist | product_name
      @products = (merged_result | song)
      @products = Kaminari.paginate_array(@products).page(params[:page]).per(PER)
    else
      @products = Product.page(params[:page]).per(PER).reverse_order
      @new_products = Product.all.order(created_at: "DESC").limit(10)
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