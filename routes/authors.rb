# PRIMITIVE ROUTE PATTERNS FOR CLASS AUTHOR
get "/authors" do
  @authors=Author.all
  erb :authors_index
end

get "/authors/login" do
  @authors=Author.all
  erb :"authors/author_login"
end

get "/authors/new" do
  erb :authors_new
end

get "/authors/authors_new" do
  erb :"authors/authors_new"
end

post "/authors/create" do
  @author=Author.create({
    name: params[:name],
    email: params[:email]
  })
  erb :"authors/authors_create"
end

get "/authors/:id/author_posts" do
  @author=Author.find(params[:id])
  @author_posts=@author.posts
  erb :"authors/author_posts"
end

get "/authors/:id/edit" do
  @author=Author.find(params[:id])
  erb :"authors/authors_edit"
end

post "authors/:id/update" do
  @author=Author.find(params[:id])
  @author.update_attributes({
    name: params[:name],
    email: params[:email]
  })
  erb :"authors/authors_update"
end

# Use "get" rather than "post" to avoid submitting form
get "/authors/:id/delete" do
  Author.find(params[:id]).delete
  erb :"authors/authors_delete"
end

get "/authors/:id" do
  @author=Author.find(params[:id])
  erb :"authors/authors_show"
end

