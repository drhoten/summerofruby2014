class MyMiddleware
    def init(app)
      @app = app
    end

    def call(env)
      status, headers, and response
      status, headers, response = app.call(env)
      [status, headers, response]
    end
end