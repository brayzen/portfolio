class User < ActiveRecord::Base
  has_many :articles, foreign_key: "author_id"
  has_many :comments, through: :articles
  devise :database_authenticatable, :registerable, :omniauthable,
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


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user.email = auth.email || "#{user.name}@#{auth.provider}.com"
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end


