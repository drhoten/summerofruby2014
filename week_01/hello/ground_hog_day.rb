class GroundHogDay

  def self.is_even?(a_number)
    a_number.even?
  end

  keep_going = true

  while(keep_going) do
    print "What's your number? "
    number = gets.chop
    if number.to_s.length == 0
      keep_going = false
      break
    end
    print "That's right, woodchuck-chuckers, it's GROUNDHOG DAY and you entered '#{number}'!\n"
    is_number = number.to_i.to_s
    if number == is_number
      #print self.is_even?(number.to_i).to_s
      odd_even = self.is_even?(number.to_i) == TRUE ? "even" : "odd"
      print "#{number} is an #{odd_even} number.\n"
    else
      print "'#{number}' is NOT a number!\n"
    end
  end
end