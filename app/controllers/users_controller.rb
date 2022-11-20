class UsersController < ApplicationController



  def show
    @books=Book.all
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
