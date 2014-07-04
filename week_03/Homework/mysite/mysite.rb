class Mysite

  require 'rack'
  require_relative 'lib/submit_contact'

  def render_page(page_name)
    content = File.read(page_name)
    [200, {'Content-Type'=>  'text/html'}, [content]]
  end

  def self.run
    Rack::Builder.new do

      map "/" do
        run lambda {|env|
          Mysite.new.render_page("lib/default.html")
        }
      end

      map "/about_me" do
        run lambda {|env|
          Mysite.new.render_page("lib/about_me.html")
        }
      end

      map "/resume" do
        run lambda {|env|
          Mysite.new.render_page("lib/resume.html")
        }
      end

      map "/contact" do
        run lambda {|env|
          Mysite.new.render_page("lib/contact_form.html")
        }
      end

      map "/submit_contact" do
        run SubmitContact.new
      end
    end
  end
end