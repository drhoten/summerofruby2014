require 'sinatra/base'
require 'sqlite3'

CONNECTION = SQLite3::Database.new("store.sqlite3")

CONNECTION.execute <<-SQL
  CREATE TABLE IF NOT EXISTS "items"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" VARCHAR,
    "price" DOUBLE DEFAULT 0
  )
SQL

class MyApp < Sinatra::Base

  get "/items" do
    results = CONNECTION.execute("SELECT name, price FROM items ORDER BY id desc LIMIT 20 ")
    @tablerows = results.collect do |row|
        "<tr><td>#{row[0]}</td><td>#{row[1]}</td></tr>"
    end

    erb :items
  end

  post "/items" do
    name = params[:name]
    price = params[:price]
    CONNECTION.execute("INSERT INTO items
                        (name, price) VALUES (?, ?)", [name, price])
    redirect "/items"
  end

  get "/items/:id" do
    id = params[:id]
    results = CONNECTION.execute("SELECT name, price FROM items WHERE id = ?" , [id])
    @tablerows = results.collect do |row|
      "<tr><td>#{row[0]}</td><td>#{row[1]}</td></tr>"
    end

    erb :item

  end

end