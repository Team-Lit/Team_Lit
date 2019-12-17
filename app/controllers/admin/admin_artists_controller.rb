class Admin::AdminArtistsController < ApplicationController
  

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
       flash[:notice] = "登録成功"
       redirect_to new_admin_admin_product_path
    else
       flash[:notice] = "登録失敗"
       render :new
    end
  end

  def destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end



end