class Browse

  require_relative 'product_catalog'
  require_relative 'product'

  def call(env)
    content = ""
    catalog = ProductCatalog.new
    catalog.products.each do |product|
      content << "<p>#{product.name}: #{product.price}</p>"
    end
    [200, {'Content-Type' => 'text/html'},[content]]
  end
end