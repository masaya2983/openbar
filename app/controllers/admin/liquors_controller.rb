class Admin::LiquorsController < ApplicationController
    before_action :authenticate_admin!
  def index
    @liqors = Liqor.order(created_at: :desc).page(params[:page]).per(6)
  end
  
  def show
    @liqor = Liqor.find(params[:id])
  end

  def update
       @liquor == Liquor.find(params[:id])
    if @liquor.update(liquor_params)
      redirect_to liquor_path(@liquor)
      flash[:notice] ="更新完了"
    else
    @liqors = Liquor.all
    render "edit"
    end  
  
  end
  
  def destroy
    @liquor = Liquor.find(params[:id])
    @liquor.destroy
    redirect_to adminliquors_path
  end
end
