class Environment

  def call(env)
    #content = env.inspect
    content = env.map {|key,value| "#{key} => #{value}"}.sort.join("\n")
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end