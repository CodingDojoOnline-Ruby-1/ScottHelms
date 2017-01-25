class User < ActiveRecord::Base
  has_many :owners
  has_many :blogs, through: :owners
  has_many :messages
  has_many :posts

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email_address, presence: true, length: {minimum: 2}
  validates :email_address, presence: true, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

  before_save do
    self.email_address.downcase
  end

end
