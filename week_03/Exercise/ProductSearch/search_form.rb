class SearchForm
  def call(env)
    search_form = File.read("SearchForm.html")
    content = %Q{
      <h1>Product search</h1>
      #{search_form}
    }
    [200, {"Content-­‐type"=> "text/html"}, [content]]
  end
end