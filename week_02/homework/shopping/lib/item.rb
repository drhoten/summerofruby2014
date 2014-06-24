class Item
  attr_accessor :name
  attr_accessor :price

  def initialize(starting_name, starting_price)
    @name = starting_name
    @price = starting_price
  end
end