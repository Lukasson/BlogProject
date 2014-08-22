# PRIMITIVE ROUTE PATTERNS FOR CLASS COMMENT
get "/comments" do
  @comments=Comment.all
  erb :"comments/comments_index"
end

get "/comments/new" do
  erb :"comments/comments_new"
end

#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
get "/posts/:post_id/comment_new" do
  @post=Post.find(params[:post_id])
  erb :"comments/comments_new2"
end

post "/posts/:id/comment_create" do
  binding.pry
  @post=Post.find(params[:id])
  @comment=Comment.create({
    content: params[:content],
    date: Time.now.to_s,
    post_id: params[:id]
  })
  erb :"comments/comments_create2"
end

get "/posts/:tag_id/tag_posts_index" do
  @tag=Tag.find(params[:tag_id])
  @tag_posts=@tag.posts
  erb :"tags/tag_posts_index"
end
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

post "/comments/create" do
  @comment=Comment.create({
    content: params[:content],
    date: Time.now.to_s,
    post_id: params[:post_id].to_i
  })
  erb :"comments/comments_create"
end

get "/comments/:id/edit" do
  @comment=Comment.find(params[:id])
  erb :"comments/comments_edit"
end

post "comments/:id/update" do
  @comment=Comment.find(params[:id])
  @comment.update_attributes({
    content: params[:content]
  })
  erb :"comments/comments_update"
end

# Use "get" rather than "post" to avoid submitting form
get "/comments/:id/delete" do
  Comment.find(params[:id]).delete
  erb :"comments/comments_delete"
end

get "/comments/:id" do
  @comment=Comment.find(:id)
  erb :"comments/comments_show"
end

