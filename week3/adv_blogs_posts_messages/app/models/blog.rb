class Blog < ActiveRecord::Base
  has_many :owners
  has_many :posts, dependent: :destroy
  has_many :users, through: :owners
  has_many :messages, through: :posts

  validates :name, presence: true, length: {minimum:7}
  validates :description, presence: true, length: {minimum:15}
end