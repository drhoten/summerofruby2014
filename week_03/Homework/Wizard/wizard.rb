class Wizard

  require 'rack'

  def render_page(page_name)
    content = File.read(page_name)
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

  app = Rack::Builder.new do
    map "/" do
      use Rack::Auth::Basic, "Restricted Area" do
        |user, password| user == 'user' && password == 'password'
      end
      run lambda {|env|
        Wizard.new.render_page("step1.html")
      }
    end

    map "/step1.html" do
      use Rack::Auth::Basic, "Restricted Area" do
        |user, password| user == 'user' && password == 'password'
      end
      run lambda {|env|
        Wizard.new.render_page("step1.html")
      }
    end

    map "/step2.html" do
      use Rack::Auth::Basic, "Restricted Area" do
        |user, password| user == 'user' && password == 'password'
      end
      run lambda {|env|
        Wizard.new.render_page("step2.html")
      }
    end

    map "/step3.html" do
      use Rack::Auth::Basic, "Restricted Area" do
        |user, password| user == 'user' && password == 'password'
      end
      run lambda {|env|
        Wizard.new.render_page("step3.html")
      }
    end

    map "/step4.html" do
      use Rack::Auth::Basic, "Restricted Area" do
        |user, password| user == 'user' && password == 'password'
      end
      run lambda {|env|
        Wizard.new.render_page("step4.html")
      }
    end
  end

  server = Rack::Server.new :app => app, :server => "webrick"
  server.start

end