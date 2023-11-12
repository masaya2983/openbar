class Publics::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @liquors = @user.games.page(params[:page]).per(10)
    @liquor = Game.new
  end
    
end
