class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new
  end

  def create
    @article = Article.find(params[:article_id])
    @comments = @article.comments
    @comment = @article.comments.build(comment_params)
    if @comment.save
      render "articles/show"
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def edit
    @article = Article.find(:article_id)
    @comment = @article.comments.find(:id)
  end

  def update
    if @comment.update_attributes(comment_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_comment
    @article = Article.find(:article_id)
    @comment = @article.comments.build(comment_params)

  def comment_params
    params.require(:comment).permit(:post, :verified)
  end
end
