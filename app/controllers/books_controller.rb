class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]



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

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    @user=current_user
    @book=Book.new
    @books=Book.all
  end

  def show
    @books=Book.new
    @book=Book.find(params[:id])
    @user=@book.user
    @book_comment=BookComment.new
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
     @book=Book.find(params[:id])
  if @book.update(book_params)
     flash[:notice] = "You have updated book successfully."
     redirect_to book_path(@book.id)
  else
    render :edit
  end
  end


 private

  def book_params
    params.require(:book).permit(:title, :image, :body, :rate)
  end


  def is_matching_login_user
    user_id = Book.find(params[:id]).user_id
    login_user_id = current_user.id
    if(user_id != login_user_id)
      redirect_to books_path
    end
  end




end
