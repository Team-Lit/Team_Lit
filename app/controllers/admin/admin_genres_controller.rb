class Admin::AdminGenresController < ApplicationController
  
  
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to new_admin_admin_product_path, notice: 'ジャンル名の登録に成功しました。'
    else
      flash.now[:genre] = "ジャンル名の登録に失敗しました。"
      render :new
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:genre_name)
  end


end