class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:new, :create, :destroy]

  def new
    article = Article.find(params[:article_id])
    @comments = article.comments.build
  end

  def create
    @comment = @article.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to article_path(@article), notice: 'コメントが投稿されました'
    else
      render :new
    end
  end

  def destroy
    comment = @article.comments.find(params[:id])
    comment.destroy!
    redirect_to article_path(@article), status: :see_other, notice: 'コメントが削除されました'
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end