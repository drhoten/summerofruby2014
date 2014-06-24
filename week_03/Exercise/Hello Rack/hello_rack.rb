class HelloRack

  require 'rack'
  require_relative 'hello_app'
  require_relative 'me'
  require_relative 'hello_index'
  require_relative 'environment'
  require_relative 'hello_browser'

  # app = lambda do |env|
  #   content = "Hello from Rack"
  #   [200, {"Content-­‐type" => "text/html"}, [content]]
  # end

  #app = HelloApp.new
  #app = Me.new
  #app = HelloIndex.new
  #app = Environment.new
  app = HelloBrowser.new

  server = Rack::Server.new :app => app, :server => "webrick"
  server.start

end