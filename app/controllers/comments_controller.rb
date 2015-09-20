class CommentsController < ApplicationController
  def new
    @article = Article.find(:article_id)
    @comment = @article.comments.build
  end

  def create
    @article = Article.find(:article_id))
    @comment = @article.comments.build(comment_params)
    if @comment.save
      @comment
      format.html { redirect_to @article, notice: 'Comment was successfully created.' }
      format.json { render :show, status: :created, location: @comment }
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:post, :verified)
  end
end
