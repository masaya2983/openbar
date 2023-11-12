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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
  if @user.update(user_params)
      redirect_to user_path(@user)
      flash[:notice] ="更新完了"
  else
   render "edit"
  end
  end
  
   def check
    @user = current_user
   end

 def withdrawal
   @user = current_user
    #is_deletedカラムをtrueに変更することにより削除フラグを立てる
  @user.update(is_deleted: true)
  reset_session
  redirect_to root_path
 end


 private

def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
end

 def is_maching_login_user
   user = User.find(params[:id])
   unless user.id == curent_user.id
     redirect_to user_path(user.id)
   end

 end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
   def ensure_guest_user
     @user = User.find(params[:id])
      if @user.name == "guestuser"
        redirect_to user_path(current_user)
         flash[:notice] = 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
      end
   end
  end
  
end
