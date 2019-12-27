class Admin::AdminLabelsController < ApplicationController
  
  
  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to new_admin_admin_product_path, notice: 'レーベル名の登録に成功しました。'
    else
      flash.now[:label] = "レーベル名の登録に失敗しました。"
      render :new
    end
  end

  def destroy
    @label = Label.find(params[:id])
    @label.destroy
  end

  private

  def label_params
    params.require(:label).permit(:label_name)
  end


end