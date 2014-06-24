class HomeApp

  def call(env)
    content = %Q{
      <h1>Welcome!</h1>
      <p>This is the home page.</p>
    }
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end