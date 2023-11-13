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
    
  end
end
