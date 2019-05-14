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
    @article = Article.new(dog_params)
 if @article.save
flash[:notice] = "Article was successfully created"
 redirect_to article_path(@article)
else
render 'new'
end
end
def update
if @articles.update(dog_params)
flash[:notice] = "Article was Update successfully"
redirect_to articles_path(@articles)
else
render 'edit'
end
end


  def show

  end

  def destroy
      @articles.destroy
  flash[:notice] = "Article was successfully deleted"
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
