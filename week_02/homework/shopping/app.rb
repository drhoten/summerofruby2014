class App

  require_relative "../../homework/shopping/lib/item"
  require_relative "../../homework/shopping/lib/cart"

  puts "Total Items:"
  cart = Cart.new
  item1 = Item.new("Widget", 5)
  item2 = Item.new("Dodad", 10)
  item3 = Item.new("Dodad", 10)

  cart.add_item(item1)
  cart.add_item(item2)
  cart.add_item(item3)

  items = cart.items

  loop_items = items.map do |itm|
    puts "  #{itm[:item].name}: " + sprintf("$%.2f",itm[:item].price) + " x #{itm[:item_qty]} = " + sprintf("$%.2f",itm[:item_total])
  end

  puts "Total: #{cart.total}"

end