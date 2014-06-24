module Admin
  def is_admin?
    true
  end
end

module Customer
  def is_customer?
    true
  end
end

class Person
  include Admin
  include Customer

  attr_accessor :first_name, :last_name, :age

  def full_name
    "#{first_name} #{last_name}"
  end
end

