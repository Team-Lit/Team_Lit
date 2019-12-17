class Admin::AdminLabelsController < ApplicationController
  
  
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
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

  def label_params
    params.require(:label).permit(:label_name)
  end


end