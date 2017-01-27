class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, class_name: "User", foreign_key: "friend_id", through: :friendships
end
#  appears as though we're looking into self-joins here, a link:  http://guides.rubyonrails.org/association_basics.html#self-joins