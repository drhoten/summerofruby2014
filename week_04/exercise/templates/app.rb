require 'sinatra'

get "/" do
  @title = "Home"
  @message = "Hello World"
  erb:index
end

get "/name/:name" do
  name = params[:name]
  @message = "Hi #{name}, how are you today?"
  erb:index
end

get "/links" do
  @links = [
    {:text => "Google", :href => "http://google.com"},
    {:text => "Hacker News", :href => "http://news.ycombinator.com"},
    {:text => "This Week In Tech", :href => "http://twit.tv/show/this-week-in-tech"}
  ]
  erb:links
end

get "/people" do
  @people = [
    {first_name: "Homer", last_name: "Simpson"},
    {first_name: "Marge", last_name: "Simpson"},
    {first_name: "Bart", last_name: "Simpson"}
  ]
  erb:people
end

__END__

@@index
<h1><%= @message %></h1>
<p><%= Date.today %></p>

@@layout
<!DOCTYPE html>
<html lang="en-­‐US">
  <head>
    <meta charset="utf-­‐8">
    <title><%= @title %></title>
  </head>
  <body>
    <header>
      <h1>Welcome App</h1>
    </header>
    <section class="main">
      <%= yield %>
    </section>
    <footer>Copyright <%= Date.today.year %> Brian Hogan</footer>
  </body>
</html>

@@links
<h1>Links</h1>
<% if @links.length > 0 %>
  <ol>
  <% @links.each_with_index do |link, index| %>
    <li><a href="<%= link[:href] %>"><%= link[:text]%></a></li>
  <% end %>
  </ol>
<% else %>
  <p>There are no links to display.</p>
<% end %>

@@people
<h1>People</h1>
<% if @people.length > 0 %>
  <table>
      <tr>
        <td>First Name</td><td>Last Name</td>
      </tr>
      <% @people.each_with_index do |person, index| %>
        <tr>
          <td><%= person[:first_name] %></td><td><%= person[:last_name] %></td>
        </tr>
      <% end %>
  </table>
<% else %>
  <p>There are no people to display.</p>
<% end %>