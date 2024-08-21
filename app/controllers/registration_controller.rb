class RegistrationController < ApplicationController
  def new
    @user = User.new
    # Any logic you have
    # render 'some_other_template' # Make sure this isn't pointing to a missing template
  end
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice:"successfully"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:email, :password, :password_confirmation)
  end
end

