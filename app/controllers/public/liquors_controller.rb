class Public::LiquorsController < ApplicationController
  def show
      @liquor = Liquor.find(params[:id])
      @genre = @liquor.genre
      @liquorcomment = Comment.new
      @liquorcomment = Comment.all.page(params[:page]).per(4)
      if @liquor.status_private? && @liquor.user !=current_user
      respond_to do |format|
      format.html { redirect_to liquors_path, notice: 'このページにはアクセスできません' }
       end
      end
  end
  
  def index
      @liqors = Liquor.all
     
     if params[:latest]
      @liqors = Liqour.latest.page(params[:page]).per(10)
     elsif params[:old].present?
       @liqors = Liqour.old.page(params[:page]).per(10)
     else
       @liqors = Liquor.all.page(params[:page]).per(10)
     end
  end
  
  def create
    @liquor = Liquor.new(liquor_params)
    @liquor.user_id = current_user.id
    
    if @liquor.save
      redirect_to @liquor
      flash[:notice] ="更新完了"
    else
      @liquors = Liquor.all
      render 'new'
    end
  end
  
  def new
    @liquor = Liquor.new
  end
  
  def edit
     @liquor == Liquor.find(params[:id])
     if @liquor.user == current_user
      render "edit"
     else
        redirect_to liquors_path
     end
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
    redirect_to liquors_path
  end
  
  private
  
  def set_liquor
    @liqor = Liquor.find(params[:id])
  end
  
  def liquore_params
   params.require(:liquore).permit(:name,:content,:image,:status, :review, :star, :category_id)#,:category_id)
  end
end
