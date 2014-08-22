class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts
  validates_associated :posts
  validates :description, exclusion: { in: %w(fuck shit bitch),
      message: "%{value} is profane." }
  
end