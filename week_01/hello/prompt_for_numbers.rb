class PromptForNumbers
  # Prompt for the numbers
  puts "What's the first number?"
  number1 = gets.chop
  puts "What's the second number?"
  number2 = gets.chop;
  puts "What's the third number?"
  number3 = gets.chop

  # Convert the numbers
  number1 = number1.to_i
  number2 = number2.to_i
  number3 = number3.to_i

  # Add it up, print the answer
  answer = number1 + number2 + number3
  print "The sum of #{number1}, #{number2} and #{number3} is  #{answer}" + "\n"
end