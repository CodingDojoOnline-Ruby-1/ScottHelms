class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user

  has_many :messages, dependent: :destroy

  validates :title, presence: true, length: {minimum: 5}
  validates :content, presence: true, length: {minimum: 15}
  validates :blog, :user, presence: true
end
