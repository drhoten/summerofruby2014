class Urls

  require 'rack'
  require_relative 'home_app'
  require_relative 'about_app'

  app = Rack::Builder.new do
    map "/" do
      run HomeApp.new
    end

    map "/about" do
      run AboutApp.new
    end

    map "/admin.php" do
      run lambda {|env|
        [200, {'Content-­‐Type'=> 'text/html'}, ["<h1>Welcome, admin!</h1>"]]}
    end

    map "/contact.aspx" do
      run lambda {|env|
        [200, {'Content-­‐Type'=> 'text/html'}, ["<h1>Contact, us!</h1>"]]}
    end
  end

  server = Rack::Server.new :app => app, :server => "webrick"
  server.start

end