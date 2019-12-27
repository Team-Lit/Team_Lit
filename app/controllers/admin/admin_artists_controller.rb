class Admin::AdminArtistsController < ApplicationController
  

  def new
    @artist = Artist.new 
    @artists = Artist.all
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to new_admin_admin_product_path, notice: 'アーティスト名の登録に成功しました。'
    else
      flash.now[:artist] = "アーティスト名の登録に失敗しました。"
      render "new"
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end



end