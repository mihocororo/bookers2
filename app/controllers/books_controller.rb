class BooksController < ApplicationController
before_action :authenticate_user!
  before_action :ensure_current_user,{only: [:edit,:update,:destroy]}

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
    @user = current_user
  end

  def new
     @user = current_user
     @book = Book.new
     @book = Book.page(params[:page])

  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
     @books = Book.all
     @newbook = Book.new
     @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path

    flash[:notice2]="You have updated book successfully."
    else
      render:edit
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end



  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    else
      @user = current_user
      @books = Book.all
      flash[:notice3]="error prohibited this obj from being saved:"
    render:index
    end


    flash[:success2]="You have created book successfully."

  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_current_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end
end
