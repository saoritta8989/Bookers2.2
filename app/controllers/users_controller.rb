class UsersController < ApplicationController



	def index
	 @book = Book.new
   @users = User.all

	end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def edit
  	@user = User.find(params[:id])
    if current_user != @user
      redirect_to books_path
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "Book was succesfully"
       redirect_to user_path(@user.id)
  else
    render :edit
  end
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile_image, :introduction)
  end
end