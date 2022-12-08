class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(book_comment_params)
    @book_comment.book_id = @book.id
    @book_comment.user_id = current_user.id
   # unless 
    @book_comment.save
    #redirect_back(fallback_location: root_path)
    #render 'books/show'
    #end
  end

   def destroy
    @book = Book.find(params[:book_id])
    BookComment.find(params[:id]).destroy
    #redirect_to book_path(params[:book_id])
   end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
