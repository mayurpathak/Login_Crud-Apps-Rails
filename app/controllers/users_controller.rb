class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def index
    if params[:search]
      @users = User.search(params[:search])
      else
      @users = User.all
    end
  end

  def show
  end

   def destroy
      @user = User.find(params[:id])
      @user.destroy
      flash[:danger] = "User and all article created by user have been deleted"
      redirect_to users_path
    end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # UserMailer.test_send(@user.email).deliver_now
      session[:user_id] = @user.id
      flash[:success] = "successfully Signup Welcome To #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

    def update
        if @user.update(user_params)
            flash[:success] = "Update successfully #{@user.username}"
              redirect_to articles_path
        else
          render 'edit'
        end
    end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :address, :dateofbirth)
  end

def set_user
  @user = User.find(params[:id])
end

def require_same_user
  if current_user != @user and !current_user.admin?
    flash[:danger] = "You can only edit your own account"
    redirect_to root_path
  end
end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end
end
