class Me

  def call(env)
    content = %Q{
      <!DOCTYPE html>
        <html lang="en-­‐US">
        <head>
          <meta charset="utf-­‐8">
          <title>My Page</title>
        </head>
        <body>
          <H1>Doug Rhoten</H1>
          <BlockQuote>When senior management puts guidelines around the type of ideas employees can pursue, innovation is already dead on arrival. #LeanEnterprise</BlockQuote>
        </body>
      </html>
      }
    [200, {"Content-­‐type"=>  "text/html"}, [content]]
  end

end