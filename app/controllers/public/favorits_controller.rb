class Public::FavoritsController < ApplicationController
  
  def create
    liquor = Liquor.find(params[:id])
    @favorite = current_user.favorites.new(liquor_id: liquor.id)
    @favorite.save
   render 'replace_btn'
  end
  
end
