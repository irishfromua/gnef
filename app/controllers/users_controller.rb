class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = "Please confirm your email address to continue"
      redirect_to root_url
#      session[:user_id] = user.id
#      redirect_to '/appeals'
    else
      flash[:error] = "Oooppss, something went wrong!"
      render 'new'
#      redirect_to '/signup'
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Welcome to the Aimtracker.com! Your email has been confirmed. Please sign in to continue."
      redirect_to signin_url
    else
      flash[:error] = "Sorry. User does not exist."
      redirect_to root_url
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
