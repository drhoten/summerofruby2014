class HelloApp

  def call(env)
    content = "Hello from Rack"
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end