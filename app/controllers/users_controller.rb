class UsersController < ApplicationController
  

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
       
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

 

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end