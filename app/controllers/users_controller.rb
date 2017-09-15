class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    create_user
  
    if @user.save
      flash[:notice] = "Welcome to Bloccit #{@user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error creating your account. Please try again."
      render :new
    end
  end

  def confirm
    create_user
  end
end

private

def create_user
  @user = User.new
  @user.name = params[:name]
  @user.email = params[:email]
  @user.password = params[:password]
  @user.password_confirmation = params[:password_confirmation]
end
