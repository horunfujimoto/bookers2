class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @new_book = Book.new
    @books = Book.all
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
    @book = Book.find(params[:id]) #params特定のレコードをとってくる！
    @user = @book.user
    @new_book = Book.new #新規作成したbook
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book)
    else
    @new_book = Book.new
    @user = @book.user
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end

end
