class Public::AppetizersController < ApplicationController
    def show
      @appetizer = Appetizer.find(params[:id])
      @genre = @liquor.genre
    end
 
  
  def index
      @appetizers = Appetizer.all
     
     if params[:latest]
      @appetizers = Appetizer.latest.page(params[:page]).per(10)
     elsif params[:old].present?
       @appetizers = Appetizer.old.page(params[:page]).per(10)
     else
       @appetizers = Appetizer.all.page(params[:page]).per(10)
     end
  end
  
  def create
    @appetizer = Appetizer.new(liquor_params)
    @appetizer.user_id = current_user.id
    
    if @appetizer.save
      redirect_to @appetizer
      flash[:notice] ="更新完了"
    else
      @appetizers = Appetizer.all
      render 'new'
    end
  end
  
  def new
    @appetizer = Appetizer.new
  end
  
  def edit
     @appetizer == Appetizer.find(params[:id])
     if @appetizer.user == current_user
      render "edit"
     else
        redirect_to liquors_path
     end
  end
  
  def update
       @appetizer == Appetizer.find(params[:id])
    if @appetizer.update(liquor_params)
      redirect_to liquor_path(@liquor)
      flash[:notice] ="更新完了"
    else
    @appetizers = Appetizer.all
    render "edit"
    end  
  end
  
  def destroy
    @appetizer = Appetizer.find(params[:id])
    @appetizer.destroy
    redirect_to liquors_path
  end
  
  private
  
  def set_appetizer
    @appetizer = Appetizer.find(params[:id])
  end
  
  def appetizer_params
   params.require(:liquore).permit(:name,:content,:image,:status, :body, :category_id)#,:category_id)
  end
end
