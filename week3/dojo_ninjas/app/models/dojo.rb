class Dojo < ActiveRecord::Base
  has_many :ninjas, dependent: :destroy, :validate => :false

  validates :name, :city, :state, presence: true, length: {minimum: 2}

end
