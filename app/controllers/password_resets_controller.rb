class PasswordResetsController < ApplicationController
  def new
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def create
  user = User.find_by_email(params[:email])
  user.send_password_reset if user
  flash[:success] = edit_password_reset_url(user.password_reset_token)
  flash[:danger] = 'This Link copy and paste In Url'
  # redirect_to edit_password_reset_path(user.password_reset_token)
  redirect_to new_password_reset_path(user.password_reset_token)
end

def update
  @user = User.find_by_password_reset_token!(params[:id])
  if @user.password_reset_sent_at < 2.hour.ago
    flash[:danger] = 'Password reset has expired'
    redirect_to new_password_reset_path
  elsif @user.update(user_params)
    flash[:success] = 'Password has been reset!'
    redirect_to login_path
  else
    render :edit
  end
end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password)
  end

end
