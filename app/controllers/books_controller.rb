class BooksController < ApplicationController

  def new

    @book = Book.new

  end


  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save

      flash[:notice] = "You have created book successfully."

      redirect_to user_path(current_user.id)

    else

      render :new

    end

  end



  def index

    @user = current_user

    @book = Book.new

    @books = Book.all

  end



  def show

    @new_book = Book.new

    @book = Book.find(params[:id])

    @user = User.find(@book.user.id)

  end



  def edit

    @book = Book.find(params[:id])

  end



  def update

    @book = Book.find(params[:id])

    if @book.update(book_params)

      flash[:notice] = "You have updated book successfully."

      redirect_to book_path(current_user.id)

    else

      render :edit

    end

  end



  def destroy

    book = Book.find(params[:id])

    book.destroy

    redirect_to books_path

  end


  private


  def book_params

    params.require(:book).permit(:title, :body)

  end

end