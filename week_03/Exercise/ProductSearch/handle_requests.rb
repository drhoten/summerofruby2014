class HandleRequests

  require_relative 'product_catalog'
  require_relative 'product'

  def call(env)
    content = ""
    request = Rack::Request.new(env)
    query = request.GET["query"]
    catalog = ProductCatalog.new
    products = catalog.find_all_by_keyword(query)
    products.each do |product|
      content << "<p>#{product.name}: #{product.price}</p>"
    end
    search_form = File.read("SearchForm.html")
    content << search_form
    [200, {"Content-­‐type"=> "text/html"}, [content]]
  end

end