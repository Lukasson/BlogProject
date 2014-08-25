# PRIMITIVE ROUTE PATTERNS FOR CLASS TAG
get "/tags" do
  @tags=Tag.all
  erb :"tags/tags_index"
end

get "/tags/new" do
  erb :"tags/tags_new"
end

post "/tags/create" do
  @tag=Tag.create({
    description: params[:description]
  })
  erb :"tags/tags_create"
end

get "/posts/:tag_id/tag_posts_index" do
  @tag=Tag.find(params[:tag_id])
  @tag_posts=@tag.posts
  erb :"tags/tag_posts_index"
end

get "/tags/:id/edit" do
  @tag=Tag.find(params[:id])
  erb :"tags/tags_edit"
end

post "tags/:id/update" do
  @tag=Tag.find(params[:id])
  @tag.update_attributes({
    description: params[:description]
  })
  erb :"tags/tags_update"
end

# Use "get" rather than "post" to avoid submitting form
get "/tags/:id/delete" do
  Tag.find(params[:id]).delete
  erb :"tags/tags_delete"
end

get "/tags/:id" do
  @tag=Tag.find(:id)
  erb :"tags/tags_show"
end