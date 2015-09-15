class User < ActiveRecord::Base
  has_many :articles, foreign_key: "author_id"
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def editor?
    role == 'editor'
  end

  def author?
    role == 'author'
  end

  def visitor?
    role == 'visitor'
  end
end


