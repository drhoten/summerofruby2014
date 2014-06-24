class GetRequests

  require 'rack'
  require_relative 'answer_app'
  require_relative 'links_app'

  app = Rack::Builder.new do
    map "/" do
      run LinksApp.new
    end

    map "/answer" do
      run AnswerApp.new
    end
  end

  server = Rack::Server.new :app => app, :server => "webrick"
  server.start

end