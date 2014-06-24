class Cart

  require_relative "../../../homework/shopping/lib/item"
  attr_reader :cart_total

  def initialize
    @items_in_cart = Array.new
    @cart_total = 0
  end

  # Adds the item to the cart if it does not exist, otherwise it increases the quantity
  def add_item(item)
    raise InvalidItemForCartError unless item.is_a? Item
    qty = 1
    add_to_cart = true

    loop_items = @items_in_cart.map do |itm|
      if itm[:item].name == item.name
        itm[:item_qty] += qty
        itm[:item_total] += qty * item.price
        add_to_cart = false
        break
      end
    end

    if add_to_cart == true
      tx = {:item => item, :item_qty => qty, :item_total => qty * item.price}
      @items_in_cart.push(tx)
    end
  end

  # Computes the total of all items in the cart
  def total
    loop_items = @items_in_cart.map do |itm|
      @cart_total += itm[:item_total]
    end
    sprintf("$%.2f", self.cart_total)
  end

  # Returns the items in the cart along with the quantity (getter only)
  def items
    @items_in_cart
  end

end