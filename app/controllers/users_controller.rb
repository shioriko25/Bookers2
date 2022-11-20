class UsersController < ApplicationController



  def show
    @books=Book.all
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
  end
end
