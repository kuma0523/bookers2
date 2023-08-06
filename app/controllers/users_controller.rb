class UsersController < ApplicationController
  
  
  # def create

  #   @book = Book.new(book_params)

  #   @book.user_id = current_user.id

  #   @book.save

  #   redirect_to user_path
    
  # end


  def index
    
    @user = current_user

    @users = User.all

  end

  def show
    
    @book = Book.new
    
    @user = User.find(params[:id])
  
    @books = @user.books
    
    # .page(params[:page])

  end


  def edit
    
    @user = User.find(params[:id])
    

  end
  
  
  def update

    @user = User.find(params[:id])

    @user.update(user_params)

    redirect_to @user
  
  end
  
  
  
  private


  def user_params

    params.require(:user).permit(:name, :profile_image)

  end


end
