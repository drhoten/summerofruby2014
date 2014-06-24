class LinksApp

  def call(env)
    content = %Q{
      <h1>Links</h1>
      <ol>
        <li><a href="/answer?choice=1">First choice</a></li>
        <li><a href="/answer?choice=2">Second choice</a></li>
        <li><a href="/answer?choice=3">Third choice</a></li>
      </ol>
    }
    [200, {"Content-­‐type"=> "text/html"}, [content]]
  end

end