require 'sinatra'

get "/" do
  "Hello World"
end

get "/about" do
  "This is the about page"
end

get "/hello/:name" do
  name = params[:name]
  "Hello, #{name}."
end