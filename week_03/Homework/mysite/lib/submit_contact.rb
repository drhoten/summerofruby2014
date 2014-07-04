class SubmitContact

  def call(env)
    request = Rack::Request.new(env)

    if request.post?
      name = request.POST["name"]
      email = request.POST["email"]
      message = request.POST["message"]

      content = %Q{
        <h1>Thank You</h1>
        <p>Name: #{name}</p>
        <p>Email: #{email}</p>
        <p>Message: #{message}</p>
      }
    elsif
      content = File.read("lib/contact_form.html")
    end

    [200, {'Content-Type'=> 'text/html'},[content]]

  end

end