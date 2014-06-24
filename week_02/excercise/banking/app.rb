class App

  require_relative 'lib/logger'
  require_relative 'lib/exceptions'
  require_relative 'lib/bank_account'

  puts "Test 1"

  begin
    account = BankAccount.new(1000, "ABC123")
    puts "Initial balance = #{account.balance}"
    puts account.name

    account.deposit 20
    account.deposit 20
    account.withdraw 30
    account.deposit 100
    puts account.history

    puts "\n"

    customer_admin = Person.new
    customer_admin.first_name = "Charles"
    customer_admin.last_name = "Brown"

    customer_admin.extend Admin
    customer_admin.extend Customer
    puts "#{customer_admin.full_name} is Admin := #{customer_admin.is_admin?}\n"
    puts "#{customer_admin.full_name} is Customer := #{customer_admin.is_customer?}"
  rescue ArgumentError => e
    puts "You need to enter only numbers"
  rescue Exception => e
    puts "It broke some other way: " + e.to_s
  end

  puts "Test 2"

  account2 = BankAccount.new(0,"XYZ456")
  puts account2.name
  puts account2.history


  puts "Test 3"
  account3 = BankAccount.new

  keep_going = true

  while keep_going do
    puts %Q{Deposit or Withdrawal ("d" or "w")}
    tx = gets.chop.to_s.downcase

    puts "Amount?"
    amount = gets.chop

    amount = amount.to_f

    if tx == "d"
      account3.deposit amount
    else
      account3.withdraw amount
    end

    puts "Your new balance is #{account}"

    puts %Q{More Transactions? ("y" to continue)}
    keep_going = gets.chop.to_s.downcase == "y"
  end

  account3.history
  puts "Thank you!"
end