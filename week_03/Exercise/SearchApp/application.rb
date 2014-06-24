class Application
  require 'rack'
  require_relative 'lib/search_form'
  require_relative 'lib/handle_requests'
  require_relative 'lib/browse'
  require_relative 'lib/app'

  def self.run
    Rack::Builder.new do
      use Footer
      use Header
      map "/" do
        run SearchForm.new
      end

      map "/search" do
        run HandleRequests.new
      end

      map "/browse" do
        run Browse.new
      end
    end
  end
end