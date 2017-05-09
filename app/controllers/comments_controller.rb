class CommentsController < ApplicationController
  before_action :authorize
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    @comment.commenter = current_user.name
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
