class Person

  keep_going = true
  people = Array.new

  while(keep_going) do
    puts "What's the first name of the person?"
    first_name = gets.chop

    puts "What's the last name of the person?"
    last_name = gets.chop

    puts "How old are they?"
    age = gets.chop

    person = {:firstname => first_name, :lastname => last_name, :age => age}
    people.push(person)

    puts "Would you like to enter another person?"
    continue = gets.chop
    if continue.to_s.downcase == "n" || continue.to_s.downcase == "no"
      keep_going = false
      break
    end
  end

  # index = 0
  # while index <= people.length - 1 do
  #   print "You entered #{people[index][:firstname]} #{people[index][:lastname]} #{people[index][:age]}.\n"
  #   index = index + 1
  # end

  folks = people.map do |per|
    print "Name: #{per[:firstname]} #{per[:lastname]}\n"
    print "Age: #{per[:age]}\n\n"
  end
end