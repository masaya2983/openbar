class Public::BarsController < ApplicationController
  
   def show
      @bar = Bar.find(params[:id])
   end
 
  
  def index
      @bars = Bar.all
     
     if params[:latest]
      @bars = Bar.latest.page(params[:page]).per(10)
     elsif params[:old].present?
       @bars = Bar.old.page(params[:page]).per(10)
     else
       @bars = Bar.all.page(params[:page]).per(10)
     end
  end
  
  def create
    @bar = Bar.new(bar_params)
    @bar.user_id = current_user.id
    
    if @bar.save
      redirect_to @bar
      flash[:notice] ="更新完了"
    else
      @bars = Bar.all
      render 'new'
    end
  end
  
  def new
    @bar = Bar.new
  end
  
  def edit
     @bar == Bar.find(params[:id])
     if @appetizer.user == current_user
      render "edit"
     else
        redirect_to bars_path
     end
  end
  
  def update
       @bar == Bar.find(params[:id])
    if @bar.update(bar_params)
      redirect_to bar_path(@bar)
      flash[:notice] ="更新完了"
    else
    @bars = Bar.all
    render "edit"
    end  
  end
  
  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to bars_path
  end
  
  private
  
  def set_bar
    @bar = Bar.find(params[:id])
  end
  
  def bar_params
   params.require(:liquore).permit(:name,:content,:image,:status, :body)
  end
end
