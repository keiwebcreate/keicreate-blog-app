class CommentsController < ApplicationController
  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'コメントが追加されました'
    else
      flash.now[:error] = 'コメントの追加に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end