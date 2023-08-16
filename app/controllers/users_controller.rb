class UsersController < ApplicationController

  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params) #これから作成するbook
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @user = User.find(params[:id]) #params特定のレコードをとってくる！
    @books = @user.books #表示したいbookは複数のためbooks
  end

  def edit

  end

  def update

  end

  private

  def user_params

  end

end
