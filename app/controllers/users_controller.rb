class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user,only: [:edit]


  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end



  def new
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(current_user.id)
    else
      render "users/sign_up"
    end
      flash[:notice]="Welcome! You have signed up successfully."

  end

  def edit
    @user = User.find(params[:id])



  end



  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
    @user = current_user

    flash[:success]="Signed in successfully."

  end

  def update
    # @user = User.find(params[:id])
    @user = current_user
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def ensure_current_user
    # @user = current_user
    @user = User.find(params[:id])
    redirect_to (user_path(current_user.id)) unless @user == current_user
  end

end


