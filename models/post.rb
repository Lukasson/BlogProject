class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  has_and_belongs_to_many :tags
  
  validates_associated :comments
  
end