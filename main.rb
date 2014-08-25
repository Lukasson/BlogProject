#require "pry"
# require "sinatra"
# require "sinatra/reloader"
# require "sinatra/activerecord"
# require "mail"

require "rubygems"
require "bundler"
Bundler.require

require_relative "./models/post.rb"
require_relative "./models/author.rb"
require_relative "./models/comment.rb"
require_relative "./models/tag.rb"
require_relative "./routes/authors.rb"
require_relative "./routes/comments.rb"
require_relative "./routes/posts.rb"
require_relative "./routes/tags.rb"

get "/" do
  @posts=Post.all
#  binding.pry
  erb :home
end

get "/test" do
  binding.pry
  @posts=Post.all
  erb :test
end

get "/p/index" do
  @posts=Post.all
  erb :p_index
end

