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
    # TODO - This action should render the login form.
  end
  
  def perform_login
    @user = User.find_by(email: params[:email])
  
    if @user && @user.authenticate(params[:password])
      # User successfully logged in, store user ID in session
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      flash.now[:alert] = 'Invalid email or password.'
      render :login
    end
  end
  
  def logout
    # Log the user out by clearing the session
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out successfully.'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
