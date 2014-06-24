class Exceptions
  class InvalidItemForCartError < StandardError
    def to_s
      "You cannot adding thing to the cart except an object of type 'Item'!"
    end
  end
end