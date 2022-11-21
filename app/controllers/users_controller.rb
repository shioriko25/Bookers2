class UsersController < ApplicationController

before_action :is_matching_login_user, only: [:edit, :update]


  def index
    @book=Book.new
    @users=User.all
    @user=current_user
  end


def create
    @user=current_user
    @book=Book.new(book_params)
    @book.user_id=current_user.id
  if  @book.save
     flash[:notice] = "You have created book successfully."
    redirect_to  book_path(@book.id)
  else
    @books=Book.all
    render :index
  end
end

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
      @user=User.find(params[:id])
  if  @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to users_path
  else
    render :edit
  end
  end


private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end

end
