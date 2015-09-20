class Comment < ActiveRecord::Base
  belongs_to :author_id
  belongs_to :user_id
end
