class ArticlesController < ApplicationController
before_action :set_article, only: [:edit, :update, :show, :destroy]
  def index
    @articles = Article.all
  end
  def new
    @articles = Article.new
  end
  def edit
  end
  def create
    @articles = Article.new(dog_params)
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





end
