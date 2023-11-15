class Public::LiquorcommentsController < ApplicationController
  
  def create
    @liquorcomment = current_user.liquorcomments.new(liquorcomment_params)
     if @liquorcomment.save
       flash[:notice] = "success"
      redirect_to @liquorcomment.liquor
     else
      flash.now[:danger] = "failed"
      render 'public/liquors/show'
     end
  end
  
  def destroy
    @liquorcomment = Comment.find(params[:id])
    @liquorcomment.destroy
    redirect_to @liquorcomment.liquor
  end
  
  private
  
  def comment_params
    params.require(:liquorcomment).permit(:liquorcomment, :liquor_id)
  end
end
