class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:show, :index, :edit, :update]



  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was succesfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end


  def top
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
  end


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    if current_user != @book.user
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    flash[:notice] = "Book was succesfully"
    redirect_to book_path(book.id)
  end

  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to '/books'
  end

def about
end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
