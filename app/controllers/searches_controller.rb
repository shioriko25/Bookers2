class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
      redirect_to  search_path(@user.id)
    else
      @books = Book.looks(params[:search], params[:word])
      render "/searches/search_result"
    end
  end
end
