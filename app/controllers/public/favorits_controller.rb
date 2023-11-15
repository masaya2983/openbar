class Public::FavoritsController < ApplicationController
  
  def create
    liquor = Liquor.find(params[:id])
    @favorite = current_user.favorites.new(liquor_id: liquor.id)
    @favorite.save
   render 'replace_btn'
  end
  
  def destroy
     liquor = Liquor.find(params[:liquor_id])
     @favorite = current_user.favorites.find_by(liquor_id: liquor.id)
     @favorite.destroy
      render 'replace_btn'
  end
  
  def followings
     user = User.find(params[:user_id])
     @users = user.followings
  end
  #フォロワー一覧
  def followers
     user = User.find(params[:user_id])
     @users = user.followers
  end
  
end
