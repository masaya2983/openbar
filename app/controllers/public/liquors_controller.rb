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
   
  end
  
end
