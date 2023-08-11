class UsersController < ApplicationController


  # def create

  #   @book = Book.new(book_params)

  #   @book.user_id = current_user.id

  #   @book.save

  #   redirect_to user_path

  # end


  def index

    @book = Book.new

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

    if @user.update(user_params)
      
      flash[:notice] = "You have updated user successfully."

      redirect_to user_path(current_user.id)

    else

      render :edit

    end

  end



  private


  def user_params

    params.require(:user).permit(:name, :profile_image, :introduction)

  end


end
