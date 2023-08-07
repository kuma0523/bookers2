class BooksController < ApplicationController

  def new

    @book = Book.new

  end


  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    @book.save

    redirect_to user_path(current_user.id)
    # 変更

  end



  def index
    
    @user = current_user

    @book = Book.new

    @books = Book.all

  end



  def show
    
    @book = Book.new
    
    
    @book = Book.find(params[:id])
    
   
    
    @user = User.find(@book.user.id)
    
     @user = @book.user

    @books = @user.books

  end



  def edit

  end






  private


  def book_params

    params.require(:book).permit(:title, :body)

  end

end

