class BlogsController < Sinatra::Base
  # attches to the root directory
  set :root, File.join(File.dirname(__FILE__),"..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $photos = [{
	 id: 0,
	 title: "Photo 1",
	 body: "This is the first post"
},
{
    id: 1,
    title: "Photo 2",
    body: "This is the second post"
},
{
    id: 2,
    title: "Photo 3",
    body: "This is the third post"
}];

  get "/" do
    @title = "Photos homepage"
    erb :'photos/index'
  end

  get "/photos" do
    @title = 'photos'
    @photos = $photos
    erb :'photos/index'

  end

  get "/photos/new" do
    "This is my page"
  end

  get "/photos/:id" do
    id = params[:id].to_i
    @photo = $photos[id]
    erb :'photos/show'
  end

  get "/photos/:id/edit" do
    "Edit: #{params[:id]}"
  end

end
