class Header
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    response_body = response.join("\n")
    links = "<a href='/'>Search</a> | <a href='/browse'>Browse</a>"
    response_body = links + response_body
    headers["Content-length"] = response_body.length.to_s
    [status, headers, [response_body]]
  end
end