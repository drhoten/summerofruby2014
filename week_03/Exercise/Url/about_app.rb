class AboutApp

  def call(env)
    content = %Q{
      <h1>About!</h1>
      <p>This is the about page.</p>
    }
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end