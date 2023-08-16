class BooksController < ApplicationController
  def index
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params) #これから作成するbook
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.find(params[:id]) #params特定のレコードをとってくる！
    @user = @book.user
    @new_book = Book.new #新規作成したbook
  end

  def edit
    @book = Book.find(params[:id])
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

end
