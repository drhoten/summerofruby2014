class HelloIndex

  def call(env)
    content = File.read('Index.html')
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end