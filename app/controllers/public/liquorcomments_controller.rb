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
  
end
