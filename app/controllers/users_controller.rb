class UsersController < ApplicationController



  def index
    @users=User.all
    @user=current_user
  end



  def show
    @books=Book.all
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end



private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
