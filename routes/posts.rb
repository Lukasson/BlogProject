# PRIMITIVE ROUTE PATTERNS FOR CLASS POST
get "/posts" do
  @posts=Post.all
  erb :"posts/posts_index"
end

# NEW POST_________________________
get "/posts/new" do
  erb :"posts/posts_new"
end

# The NESTED ROUTE method
get "/authors/:id/post_new" do
  @author=Author.find(params[:id])
  erb :"posts/posts_new2"
end
#*********************************

# CREATE POST_____________________
post "/authors/:id/post_create" do
  @post=Post.create({
    title: params[:title],
    content: params[:content],
    date: Time.now.to_s,
    author_id: params[:id]
  })
  erb :"posts/posts_create"  
end

# The NESTED ROUTE method
post "/posts/create" do
  @post=Post.create({
    content: params[:content],
    date: Time.now.to_s,
    author_id: params[:author_id].to_i
  })
  erb :"posts/posts_create"
end
#*********************************

# EDIT POST_______________________
get "/posts/:id/edit" do
  @post=Post.find(params[:id])
  erb :"posts/posts_edit"
end

# The NESTED ROUTE method 
get "/authors/:id/post_edit" do
  @author=Author.find(params[:id])
  erb :"posts/posts_edit2"
end
#*********************************

post "posts/:id/update" do
  @post=Post.find(params[:id])
  @post.update_attributes({
    content: params[:content]
  })
  erb :"posts/posts_update"
end

# Use "get" rather than "post" to avoid submitting form
get "/posts/:id/delete" do
  Post.find(params[:id]).delete
  erb :"posts/posts_delete"
end

get "/posts/:id" do
#  binding.pry
  @post=Post.find(params[:id])
  erb :"posts/posts_show"
end

