class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @new_book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @new_book = Book.new(book_params) #これから作成するbook
    @new_book.user_id = current_user.id
    if @new_book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@new_book)
    else
    @books = Book.all
    @user = current_user
    render :index
    end
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id]) #params特定のレコードをとってくる！
    @books = @user.books #表示したいbookは複数のためbooks
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id) #インスタンス変数(@user)ではない,(user.id)がなくでも動作にエラーでなかった
    else
    @new_book = Book.new
    @books = @user.books
    redirect_to user_path(current_user.id)
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
