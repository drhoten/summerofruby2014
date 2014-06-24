class AnswerApp

  CHOICES = {
    "1" => "<p>You chose poorly",
    "2" => "<p>You chose wisely",
    "3" => "<p>You chose poorly"
  }

  def call(env)
    request = Rack::Request.new(env)
    choice = request.GET["choice"]
    content = CHOICES[choice] || "Not an option."
    [200, {"Content-­‐type"=> "text/html"}, [content]]
  end
end