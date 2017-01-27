class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog
  belongs_to :post
  belongs_to :message
  belongs_to :commentable, polymorphic: true
end