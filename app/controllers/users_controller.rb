class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      # User successfully registered, you can automatically log them in here if needed.
      redirect_to root_path, notice: 'User registered successfully.'
    else
      render :new
    end
  end

  def login
    # TODO - Implement user login logic here.
  end

  def logout
    # TODO - Implement user logout logic here.
  end

  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
