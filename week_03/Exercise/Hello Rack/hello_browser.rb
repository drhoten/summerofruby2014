class HelloBrowser

  def call(env)

    #HTTP_USER_AGENT
    #content = env.map {|key,value| "#{key} => #{value}"}.sort.join("\n")
    user_agent = env["HTTP_USER_AGENT"]

    content = ""

    if user_agent.to_s.include?("Chrome")
      content = "Hi, Chrome user"
    elsif user_agent.to_s.include?("Safari")
      content = "Salut Safari"
    elsif user_agent.to_s.include?("Firefox")
      content = "Greetings Firefox"
    elsif user_agent.to_s.include?("IE")
      content = "Why are you using IE?"
    else
      content ="Who are you?!"
    end

    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end