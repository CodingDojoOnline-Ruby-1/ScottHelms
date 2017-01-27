class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: "User"
end
#  looks like we're looking into self-joins here, a link:  http://guides.rubyonrails.org/association_basics.html#self-joins