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
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id) #インスタンス変数(@user)ではない,(user.id)がなくでも動作にエラーでなかった
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
