class ArticlePolicy
  attr_accessor :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def publish?
    @user.role == 'editor'
  end

  def update?
    @user.role == 'editor' || @user.role == 'author'
  end

  def destroy?
    @user.role == 'editor'
  end
end
