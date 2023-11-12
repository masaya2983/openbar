class Publics::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @liquors = @user.games.page(params[:page]).per(10)
    @liquor = Game.new
  end
    
  def index
    @users = User.all
    @liquor = Liquor.new
  end
end
