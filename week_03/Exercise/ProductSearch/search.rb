class Search

  require 'rack'
  require_relative 'search_form'
  require_relative 'handle_requests'

  app = Rack::Builder.new do
    map "/" do
      run SearchForm.new
    end

    map "/search" do
     run HandleRequests.new
    end
  end

  server = Rack::Server.new :app => app, :server => "webrick"
  server.start

end