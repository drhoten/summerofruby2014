class BankAccount

  require_relative '../../banking/lib/logger'  # This is needed because the module is not in the same file
  require_relative '../../banking/lib/interest'
  require_relative '../../banking/lib/person'
  require_relative '../../banking/lib/exceptions'

  include Logger
  include Interest

  attr_accessor :name
  attr_reader :balance

  def initialize(starting_balance = 0, starting_name = nil)
    @balance = starting_balance
    @name = starting_name
    @tx_history = Array.new
  end

  def to_s
    sprintf("$%.2f", self.balance)
  end

  def deposit(amount)
    raise WrongDataTypeForDepositError unless amount.is_a? Numeric
    tx = {:action => "Deposit", :tx_amount => amount}
    @tx_history.push(tx)
    @balance += amount
  end

  def withdraw(amount)
    raise WrongDataTypeForWithdrawError unless amount.is_a? Numeric
    raise InsufficientBalanceWithdrawError unless amount <= @balance
    tx = {:action => "Withdraw", :tx_amount => amount}
    @tx_history.push(tx)
    @balance -= amount
  end

  def summary
    "The account '#{name}' has a balance of " + self.to_s
  end

  def history
    loop_tx = @tx_history.map do |tx|
      history = "   #{tx[:action]} of " + sprintf("$%.2f", "#{tx[:tx_amount]}") + "\n"
      print history
      log(history)
    end
    print summary
  end

end