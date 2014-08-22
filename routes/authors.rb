# PRIMITIVE ROUTE PATTERNS FOR CLASS AUTHOR
get "/authors" do
  @authors=Author.all
  erb :authors_index
end

get "/authors/new" do
  erb :authors_new
end

post "/authors/create" do
  @author=Author.create({
    name: params[:name],
    email: params[:email]
  })
  erb :"authors/authors_create"
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
  @author=Author.find(:id)
  erb :"authors/authors_show"
end

