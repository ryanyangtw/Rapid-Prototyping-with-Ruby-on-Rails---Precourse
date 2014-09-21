class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
  end


  def create
    @article = Article.find(params[:article_id])
    #@articles = Article.all
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(@article)
    else
      @article.comments.destroy(@comment)
      render 'articles/show'
      #render :template => 'articles/show'
    end
  end

  def edit
  end

  def update
  end

  def destroy

    @article = Article.find(params[:article_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@article) 
    else
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
