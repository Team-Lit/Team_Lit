class Admin::AdminGenresController < ApplicationController
  
  
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
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

  def genre_params
    params.require(:genre).permit(:genre_name)
  end


end