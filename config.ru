require "sinatra"
require "sinatra/reloader" if development?
require_relative "./controllers/blog_controllers.rb"


run BlogsController
