class AddItUp
  # Instance method
  def add1
    1+1
    2+2
    3+3
  end

  # Class method
  def self.add2
    a=1
    b=2
    c=a+b
    d=4
    c
  end

  def add3
    a=1
    b=2
    return a
    c=a+b
  end

  def self.is_even?(a_number)
    a_number.even?
  end

  print "The result of the first verse is #{AddItUp.new.add1}.\n"
  print "The result of the second verse is #{self.add2}.\n"

  instance_a = AddItUp.new
  print "The result of the third verse is #{instance_a.add3}.\n"

  puts self.is_even?(2)
  puts self.is_even?(3)

end