class Footer
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    response_body = response.join("\n")
    response_body << "<footer>Generated #{Time.now}</footer>"
    headers["Content-length"] = response_body.length.to_s
    [status, headers, [response_body]]
  end
end