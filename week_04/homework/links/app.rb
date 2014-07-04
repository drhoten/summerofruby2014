require 'sinatra/base'
require 'sqlite3'

CONNECTION = SQLite3::Database.new("links.sqlite3")

CONNECTION.execute <<-SQL
  CREATE TABLE IF NOT EXISTS "links"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" VARCHAR,
    "url" VARCHAR,
    "description" VARCHAR
  )
SQL

class MyLinks < Sinatra::Base

  get "/" do
    @title = "Default"
    @show_form = false
    results = CONNECTION.execute("SELECT name, url, description FROM links LIMIT 10 ")
    @tablerows = results.collect do |row|
      "<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td></tr>"
    end
    erb :links
  end

  get "/links" do
    @title = "GET Links"
    @show_form = true
    results = CONNECTION.execute("SELECT name, url, description FROM links")
    @tablerows = results.collect do |row|
      "<tr><td>#{row[0]}</td><td>#{row[1]}</td><td>#{row[2]}</td></tr>"
    end

    erb :links
  end

  post "/links" do
    @title = "POST Links"
    name = params[:name]
    url = params[:url]
    description = params[:description]
    CONNECTION.execute("INSERT INTO links
                        (name, url, description) VALUES (?, ?, ?)", [name, url, description])
    redirect "/links"
  end

  get "/links/:id" do
    @title = "GET Link by ID"
    @id = params[:id]
    results = CONNECTION.execute("SELECT name, url, description FROM links WHERE id = ?" , [@id])
    @tablerows = results.collect do |row|
      "<tr><td>#{row[0]}</td><td><a href='#{row[1]}'>#{row[1]}</a></td><td>#{row[2]}</td></tr>"
    end

    erb :link

  end
end