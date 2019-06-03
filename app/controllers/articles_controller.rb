class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @articles = Article.search(params[:search])
      else
      @articles = Article.all
    end
  end

  def new
    @articles = Article.new
  end
  def edit
  end
  def create
    @articles = Article.new(dog_params)
    @articles.user = current_user
     if @articles.save
    flash[:success] = "Article was successfully created"
     redirect_to article_path(@articles)
    else
    render 'new'
    end
 end

  def update
    if @articles.update(dog_params)
    flash[:success] = "Article was Update successfully"
    redirect_to articles_path(@articles)
    else
    render 'edit'
    end
  end

  def show

  end

  def destroy
      @articles.destroy
  flash[:danger] = "Article was successfully deleted"
      redirect_to articles_path
    end

    private
  def set_article
   @articles = Article.find(params[:id])
   end
  def dog_params
    params.require(:article).permit(:title, :description)
  end
  def require_same_user
    if current_user != @articles.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own articles"
      redirect_to root_path
    end
  end

end
