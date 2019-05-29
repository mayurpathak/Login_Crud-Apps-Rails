class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "successfully Signup Welcome To #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end

    def update
        @user = User.find(params[:id])
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




  def _form
  end


end
