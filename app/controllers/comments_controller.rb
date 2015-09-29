class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :correct_user, only: :destroy


  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment Created"
      redirect_to @article
    else
      format.html { render :new }
      format.json { render json: @comment.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

  def comment_params
    comment = params.require(:comment).permit(:post, :verified)
    comment[:user_id] = current_user.id
    comment
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
end
