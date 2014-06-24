class SearchForm

  def call(env)
    search_form = File.read("lib/SearchForm.html")
    content = %Q{
      <h1>Products search</h1>
      #{search_form}
    }
    [200, {'Content-Type'=> 'text/html'},[content]]
  end

end